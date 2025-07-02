# Scripts Collection

Utility scripts for system setup and maintenance tasks. Each script is designed to be safe, interactive, and well-documented.

## 📁 Contents

- **`setup_ssh_keys.sh`** - Generate and configure SSH keys for secure authentication
- **`cleanup_ssh_keys.sh`** - Safely remove SSH keys from system and agents

## 🔐 SSH Key Management Scripts

### `setup_ssh_keys.sh` - SSH Key Generation & Setup

**Purpose**: Create new SSH keys and configure them properly for secure authentication with services like GitHub, GitLab, and remote servers.

**When to use**:
- Setting up a new development machine
- Creating SSH keys for the first time
- Adding additional keys for specific services or servers
- After running cleanup and needing fresh keys

**What it does**:
- ✅ Creates `~/.ssh` directory with correct permissions
- ✅ Generates Ed25519 SSH key pairs (modern, secure algorithm)
- ✅ Adds keys to SSH agent automatically
- ✅ Sets up SSH agent persistence (macOS keychain integration)
- ✅ Displays public keys ready for copying
- ✅ Configures SSH agent to auto-load keys on macOS
- ✅ Supports creating multiple keys for different purposes

**Usage**:
```bash
# Make executable
chmod +x setup_ssh_keys.sh

# Run the script
./setup_ssh_keys.sh
```

**Interactive prompts**:
1. **Email address** - Used as comment in SSH key
2. **Additional keys** - Option to create specialized keys
3. **Key names** - Custom names for additional keys

**Example workflow**:
```bash
$ ./setup_ssh_keys.sh
🔐 SSH Key Setup Script
======================

Enter your email address: user@example.com
✓ Generated id_ed25519 key pair
✓ Added id_ed25519 to SSH agent

Public key for id_ed25519:
------------------------
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5... user@example.com
------------------------

Do you need additional keys? (y/n): y
Enter key name: github_work
✓ Generated github_work key pair
```

---

### `cleanup_ssh_keys.sh` - SSH Key Removal & Cleanup

**Purpose**: Safely remove SSH keys from your system, including cleaning up SSH agent and keychain references.

**When to use**:
- Removing old, unused SSH keys
- Cleaning up after switching to new keys
- Decommissioning keys for security reasons
- Preparing system for fresh SSH setup
- Troubleshooting SSH key conflicts

**What it does**:
- 🗑️ Lists all current SSH keys before deletion
- 🗑️ Removes keys from SSH agent memory
- 🗑️ Clears keys from macOS keychain
- 🗑️ Deletes both private and public key files
- 🗑️ Creates automatic backups before deletion
- 🗑️ Interactive selection of keys to remove
- 🗑️ Safety confirmations for destructive actions

**Usage**:
```bash
# Make executable
chmod +x cleanup_ssh_keys.sh

# Run the script
./cleanup_ssh_keys.sh
```

**Safety features**:
- **Automatic backup** - Creates timestamped backup before deletion
- **Interactive prompts** - Never deletes without confirmation
- **Agent cleanup** - Removes keys from memory before file deletion
- **Validation** - Checks if keys exist before attempting deletion
- **Recovery info** - Provides guidance on post-cleanup steps

**Interactive menu**:
```bash
Available actions:
1. Delete specific key
2. Delete all SSH keys
3. List keys in SSH agent
4. Quit
```

**Example workflow**:
```bash
$ ./cleanup_ssh_keys.sh
🗑️ SSH Key Cleanup Script
=========================

⚠ This script will help you delete SSH keys safely.

Create backup before deletion? (Y/n): y
✓ Backup created at ~/.ssh/backup_20241201_143022

Current SSH keys in ~/.ssh/:
- id_ed25519
- id_ed25519.pub
- old_rsa_key
- old_rsa_key.pub

Choose an option (1-4): 1
Enter key name to delete: old_rsa_key
⚠ This will delete the key pair: old_rsa_key
Are you sure? (y/N): y
✓ Deleted private key: old_rsa_key
✓ Deleted public key: old_rsa_key.pub
```

## 🛡️ Security Best Practices

Both scripts follow security best practices:

### Setup Script Security
- Uses **Ed25519 algorithm** (modern, secure)
- Sets **correct file permissions** (600 for private, 644 for public)
- **No password prompts** for keys (uses SSH agent instead)
- **Keychain integration** on macOS for persistence

### Cleanup Script Security
- **Automatic backups** before any deletion
- **Agent cleanup** to remove keys from memory
- **Confirmation prompts** for all destructive actions
- **Selective deletion** - never forces mass deletion

## 🔧 System Integration

### SSH Agent Configuration
Both scripts work with SSH agent and configure:
- **Auto-loading** keys on shell startup
- **Keychain persistence** on macOS
- **Agent forwarding** compatibility

### File Structure
Scripts maintain proper SSH directory structure:
```
~/.ssh/
├── id_ed25519          # Private key (600)
├── id_ed25519.pub      # Public key (644)
├── config              # SSH client config (link to .dotfiles/.ssh/config)
└── backup_*/           # Automatic backups
```

## 📝 Usage Scenarios

### New Machine Setup
```bash
# 1. Generate fresh SSH keys
./setup_ssh_keys.sh

# 2. Copy public key to clipboard (macOS)
pbcopy < ~/.ssh/id_ed25519.pub

# 3. Add to GitHub/GitLab/servers
# 4. Test connection
ssh -T git@github.com
```

### Key Rotation/Cleanup
```bash
# 1. Clean up old keys
./cleanup_ssh_keys.sh

# 2. Generate new keys
./setup_ssh_keys.sh

# 3. Update services with new public keys
```

### Multiple Environment Setup
```bash
# Generate keys for different purposes
./setup_ssh_keys.sh
# Choose: personal, work, server1, server2, etc.
```

## ⚠️ Important Notes

### Before Running Cleanup
- **Backup important keys** or know how to regenerate them
- **Remove public keys** from services (GitHub, servers) if no longer needed
- **Update SSH config** files that reference deleted keys

### After Running Setup
- **Copy public keys** to required services
- **Test connections** to ensure keys work
- **Update SSH config** if using specific keys for different hosts

### Recovery
If you accidentally delete keys:
1. Check the automatic backup directory (`~/.ssh/backup_*`)
2. Restore needed keys from backup
3. Re-run setup script if backups are unavailable

---

**🔒 Security reminder**: Never share private keys or commit them to version control. These scripts help manage keys safely and securely.