#!/bin/bash

# SSH Key Setup Script
# Usage: ./setup_ssh_keys.sh

set -e  # Exit on any error

echo "SSH Key Setup Script"
echo "===================="

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

# Check if SSH directory exists
if [ ! -d "$HOME/.ssh" ]; then
    print_info "Creating ~/.ssh directory..."
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
    print_status "Created ~/.ssh directory with correct permissions"
fi

# Function to generate SSH key
generate_ssh_key() {
    local key_name=$1
    local email=$2
    local key_path="$HOME/.ssh/$key_name"
    
    if [ -f "$key_path" ]; then
        print_warning "Key $key_name already exists. Skipping..."
        return
    fi
    
    print_info "Generating SSH key: $key_name"
    ssh-keygen -t ed25519 -C "$email" -f "$key_path" -N ""
    
    # Set correct permissions
    chmod 600 "$key_path"
    chmod 644 "$key_path.pub"
    
    print_status "Generated $key_name key pair"
}

# Function to add key to SSH agent
add_to_ssh_agent() {
    local key_name=$1
    local key_path="$HOME/.ssh/$key_name"
    
    print_info "Adding $key_name to SSH agent..."
    
    # Start SSH agent if not running
    if ! pgrep -x "ssh-agent" > /dev/null; then
        eval "$(ssh-agent -s)"
        print_status "Started SSH agent"
    fi
    
    ssh-add "$key_path"
    print_status "Added $key_name to SSH agent"
}

# Function to display public key
show_public_key() {
    local key_name=$1
    local key_path="$HOME/.ssh/$key_name.pub"
    
    if [ -f "$key_path" ]; then
        echo
        print_info "Public key for $key_name:"
        echo "------------------------"
        cat "$key_path"
        echo "------------------------"
        echo
    fi
}

# Main setup
echo
read -p "Enter your email address: " email

# Generate main SSH key
print_info "Setting up main SSH key..."
generate_ssh_key "id_ed25519" "$email"
add_to_ssh_agent "id_ed25519"
show_public_key "id_ed25519"

# Ask about additional keys
echo
read -p "Do you need additional SSH keys (e.g., for specific servers/services)? (y/n): " need_additional

if [[ $need_additional =~ ^[Yy]$ ]]; then
    while true; do
        echo
        read -p "Enter key name (or 'done' to finish): " key_name
        
        if [ "$key_name" = "done" ]; then
            break
        fi
        
        # Validate key name
        if [[ ! $key_name =~ ^[a-zA-Z0-9_-]+$ ]]; then
            print_error "Invalid key name. Use only letters, numbers, hyphens, and underscores."
            continue
        fi
        
        generate_ssh_key "$key_name" "$email"
        add_to_ssh_agent "$key_name"
        show_public_key "$key_name"
    done
fi

# Setup SSH agent persistence (macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    print_info "Setting up SSH agent persistence for macOS..."
    
    # Check if config exists and has the necessary settings
    if ! grep -q "AddKeysToAgent yes" "$HOME/.ssh/config" 2>/dev/null; then
        echo "# SSH Agent Configuration" >> "$HOME/.ssh/config"
        echo "Host *" >> "$HOME/.ssh/config"
        echo "  AddKeysToAgent yes" >> "$HOME/.ssh/config"
        echo "  UseKeychain yes" >> "$HOME/.ssh/config"
        echo "" >> "$HOME/.ssh/config"
        print_status "Added SSH agent configuration to ~/.ssh/config"
    fi
    
    # Add keys to keychain
    for key in "$HOME/.ssh"/id_*; do
        if [[ -f "$key" && ! "$key" =~ \.pub$ ]]; then
            ssh-add --apple-use-keychain "$key" 2>/dev/null || true
        fi
    done
    print_status "Added keys to macOS keychain"
fi

echo
print_status "SSH key setup complete!"
echo
print_info "Next steps:"
echo "1. Copy the public key(s) above"
echo "2. Add them to your services:"
echo "   - GitHub: Settings → SSH and GPG keys"
echo "   - GitLab: User Settings → SSH Keys"
echo "   - Servers: Add to ~/.ssh/authorized_keys"
echo "3. Test your connection: ssh -T git@github.com"
echo

print_warning "Remember to:"
echo "- Never share your private keys"
echo "- Keep your private keys secure"
echo "- Use different keys for different purposes if needed"
