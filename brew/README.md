# Homebrew Configuration

This directory contains my Homebrew setup using a `Brewfile` for reproducible package management across macOS systems.

## 📁 Contents

- **`Brewfile`** - Complete list of installed packages, casks, and dependencies

## 🍺 What is Homebrew Bundle?

Homebrew Bundle allows you to manage all your Homebrew packages in a single `Brewfile`. This makes it easy to:
- **Backup** your entire package setup
- **Restore** packages on a new machine
- **Share** your setup with others
- **Version control** your package list

## 🚀 Quick Start

### Install Everything
```bash
# Install all packages from the Brewfile
brew bundle install

# Install from specific location
brew bundle install --file=path/to/Brewfile
```

### Generate Current Setup
```bash
# Create Brewfile from currently installed packages
brew bundle dump

# Force overwrite existing Brewfile
brew bundle dump --force
```

### Cleanup
```bash
# Remove packages not listed in Brewfile
brew bundle cleanup
```

## 📦 Package Categories

### 🔧 Essential Development Tools
- **Git** - Version control system
- **Python & Node.js** - Programming languages and runtimes
- **Neovim** - Modern vim editor
- **GCC** - Compiler collection
- **Lazygit** - Beautiful git TUI

### ⚡ CLI Enhancements
Modern replacements for standard Unix tools:
- `fd` → Better `find`
- `ripgrep` → Better `grep`
- `eza` → Better `ls` with icons and git status
- `bat` → Better `cat` with syntax highlighting
- `dust` → Better `du` for disk usage
- `procs` → Better `ps` for process viewing
- `htop` → Better `top` for system monitoring

### 🧭 Navigation & Search
- **Zoxide** - Smart directory jumping
- **FZF** - Fuzzy finder for files and commands
- **Tree** - Directory structure visualization

### 🐚 Shell Improvements
- **zsh-syntax-highlighting** - Command syntax highlighting
- **Powerlevel10k** - Beautiful, fast zsh theme

### 🎨 Media & Processing
- **FFmpeg** - Video/audio processing swiss army knife
- **ImageMagick** - Image manipulation toolkit
- **jp2a** - ASCII art from images
- **viu** - Terminal image viewer

### 🛠️ System Utilities
- **Tmux** - Terminal multiplexer
- **Stow** - Symlink farm manager for dotfiles
- **jq** - JSON processor
- **wget** - Network downloader
- **Tealdeer** - Simplified man pages

### 🎯 Specialized Tools
- **Tesseract** - OCR engine
- **SQLite** - Lightweight database
- **Fastfetch** - System information display

### 🎮 Fun Utilities
- **cmatrix** - Matrix-style terminal screensaver
- **jp2a** - Convert images to ASCII art

## 🖥️ GUI Applications (Casks)

### Development
- **Visual Studio Code** - Popular code editor
- **Docker** - Containerization platform
- **GitHub Desktop** - Git GUI client
- **Ghostty** - Modern GPU-accelerated terminal

### Productivity
- **Raycast** - Spotlight replacement with workflows
- **1Password** - Password manager
- **Magnet** - Window management
- **Alt-Tab** - Windows-style window switcher

### Communication & Media
- **Discord** - Community chat platform
- **Telegram** - Secure messaging
- **Zoom** - Video conferencing
- **IINA** - Modern media player

### System Enhancement
- **AppCleaner** - Thorough app uninstaller
- **Shottr** - Screenshot annotation tool
- **Font Meslo LG Nerd Font** - Programming font with icons

## 🔄 Maintenance

### Keep Everything Updated
```bash
# Update Homebrew and all packages
brew update && brew upgrade

# Update casks
brew upgrade --cask
```

### Clean Up
```bash
# Remove old versions and clean cache
brew cleanup

# See what would be cleaned
brew cleanup --dry-run
```

### Health Check
```bash
# Check for issues
brew doctor

# Verify installation integrity
brew bundle check
```

## 🎛️ Customization

### Adding New Packages
1. Install the package: `brew install package-name`
2. Update Brewfile: `brew bundle dump --force`
3. Commit changes to version control

### Optional Packages
The Brewfile includes commented-out optional packages:
- **R** - Statistical computing language
- **OpenJDK** - Java Development Kit
- **MongoDB** - NoSQL database
- **Arc Browser** - Alternative web browser
- **Bruno** - API testing tool
- **Alacritty** - Alternative terminal
- **Google Chrome** - Web browser

Uncomment these lines if needed for your workflow.

## 🔧 Integration with Dotfiles

This Brewfile is designed to work with the configurations in `~/.config/`:
- **Zsh config** depends on `eza`, `zoxide`, `bat`, `ripgrep`, etc.
- **Tmux config** works with the installed `tmux` package
- **Git config** uses the installed `git` and `lazygit`
- **Terminal setup** uses `powerlevel10k` and `zsh-syntax-highlighting`

## 🚦 Prerequisites

**Install Homebrew**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

## 🎯 Usage Tips

- **Regular updates**: Run `brew update && brew upgrade` weekly
- **Backup before changes**: `brew bundle dump --force` before major changes
- **Test on clean system**: Verify Brewfile works on fresh macOS install
- **Document custom taps**: Add any third-party taps to the Brewfile
- **Review annually**: Remove unused packages to keep system lean