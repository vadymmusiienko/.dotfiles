#!/bin/bash

# SSH Key Cleanup Script
# Usage: ./cleanup_ssh_keys.sh

set -e  # Exit on any error

echo "SSH Key Cleanup Script"
echo "======================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Function to list SSH keys
list_ssh_keys() {
    echo
    print_info "Current SSH keys in ~/.ssh/:"
    echo "----------------------------"
    
    if ls ~/.ssh/id_* 2>/dev/null | grep -v '\.pub$'; then
        echo
        print_info "Public keys:"
        ls ~/.ssh/id_*.pub 2>/dev/null || echo "No public keys found"
    else
        echo "No SSH keys found"
    fi
    echo
}

# Function to remove key from SSH agent
remove_from_ssh_agent() {
    local key_path=$1
    
    if [ -f "$key_path" ]; then
        print_info "Removing $(basename "$key_path") from SSH agent..."
        ssh-add -d "$key_path" 2>/dev/null || print_warning "Key not in SSH agent or agent not running"
    fi
}

# Function to remove key from macOS keychain
remove_from_keychain() {
    local key_path=$1
    
    if [[ "$OSTYPE" == "darwin"* ]] && [ -f "$key_path" ]; then
        print_info "Removing $(basename "$key_path") from macOS keychain..."
        ssh-add -D 2>/dev/null || print_warning "Could not clear keychain"
    fi
}

# Function to delete key pair
delete_key_pair() {
    local key_name=$1
    local private_key="$HOME/.ssh/$key_name"
    local public_key="$HOME/.ssh/$key_name.pub"
    
    print_info "Deleting key pair: $key_name"
    
    # Remove from SSH agent first
    remove_from_ssh_agent "$private_key"
    
    # Remove from keychain (macOS)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        remove_from_keychain "$private_key"
    fi
    
    # Delete the files
    if [ -f "$private_key" ]; then
        rm "$private_key"
        print_status "Deleted private key: $key_name"
    else
        print_warning "Private key not found: $key_name"
    fi
    
    if [ -f "$public_key" ]; then
        rm "$public_key"
        print_status "Deleted public key: $key_name.pub"
    else
        print_warning "Public key not found: $key_name.pub"
    fi
}

# Function to backup keys before deletion
backup_keys() {
    local backup_dir="$HOME/.ssh/backup_$(date +%Y%m%d_%H%M%S)"
    
    print_info "Creating backup at $backup_dir..."
    mkdir -p "$backup_dir"
    
    # Copy all SSH keys to backup
    for key in ~/.ssh/id_*; do
        if [ -f "$key" ]; then
            cp "$key" "$backup_dir/"
        fi
    done
    
    print_status "Backup created at $backup_dir"
    echo
}

# Function for interactive deletion
interactive_delete() {
    while true; do
        list_ssh_keys
        
        echo "Available actions:"
        echo "1. Delete specific key"
        echo "2. Delete all SSH keys"
        echo "3. List keys in SSH agent"
        echo "4. Quit"
        echo
        
        read -p "Choose an option (1-4): " choice
        
        case $choice in
            1)
                echo
                read -p "Enter key name to delete (without path, e.g., 'id_ed25519'): " key_name
                
                if [ -z "$key_name" ]; then
                    print_error "Key name cannot be empty"
                    continue
                fi
                
                # Validate key exists
                if [ ! -f "$HOME/.ssh/$key_name" ] && [ ! -f "$HOME/.ssh/$key_name.pub" ]; then
                    print_error "Key '$key_name' not found"
                    continue
                fi
                
                echo
                print_warning "This will delete the key pair: $key_name"
                read -p "Are you sure? (y/N): " confirm
                
                if [[ $confirm =~ ^[Yy]$ ]]; then
                    delete_key_pair "$key_name"
                    echo
                    print_status "Key '$key_name' deleted successfully"
                else
                    print_info "Cancelled deletion of '$key_name'"
                fi
                ;;
                
            2)
                echo
                print_warning "This will delete ALL SSH keys in ~/.ssh/"
                print_warning "Make sure you have backups or can regenerate them!"
                read -p "Are you absolutely sure? (type 'DELETE ALL'): " confirm
                
                if [ "$confirm" = "DELETE ALL" ]; then
                    # Remove all keys from agent first
                    ssh-add -D 2>/dev/null || true
                    
                    # Delete all key files
                    for key in ~/.ssh/id_*; do
                        if [ -f "$key" ]; then
                            rm "$key"
                            print_status "Deleted $(basename "$key")"
                        fi
                    done
                    
                    print_status "All SSH keys deleted"
                    break
                else
                    print_info "Cancelled - incorrect confirmation"
                fi
                ;;
                
            3)
                echo
                print_info "Keys currently loaded in SSH agent:"
                ssh-add -l 2>/dev/null || print_info "No keys in SSH agent or agent not running"
                ;;
                
            4)
                print_info "Goodbye!"
                exit 0
                ;;
                
            *)
                print_error "Invalid option. Please choose 1-4."
                ;;
        esac
        
        echo
        read -p "Press Enter to continue..."
        echo
    done
}

# Main script
echo
print_warning "This script will help you delete SSH keys safely."
print_warning "Keys will be removed from SSH agent and keychain before deletion."
echo

# Check if .ssh directory exists
if [ ! -d "$HOME/.ssh" ]; then
    print_error "No ~/.ssh directory found. Nothing to clean up."
    exit 1
fi

# Check if any keys exist
if ! ls ~/.ssh/id_* 2>/dev/null | grep -q .; then
    print_info "No SSH keys found in ~/.ssh/"
    exit 0
fi

# Offer to create backup
echo
read -p "Create backup before deletion? (Y/n): " create_backup

if [[ ! $create_backup =~ ^[Nn]$ ]]; then
    backup_keys
fi

# Start interactive deletion
interactive_delete

print_status "Cleanup complete!"
echo
print_info "Remember to:"
echo "- Remove public keys from GitHub/GitLab/servers if no longer needed"  
echo "- Update your SSH config if it references deleted keys"
echo "- Generate new keys when needed using setup_ssh_keys.sh"
