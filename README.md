# Vadym's Dotfiles

This is a repository with all of my dotfiles and configurations. Here you will find everything you need on a new mac machine. This repo has all the configs for different programs as well as Brewfile to install the essentials that I use on every mac machine.

## What's Inside

This repository contains configuration files, setup scripts, aliases and custom binaries (commands) for a modern, efficient development workflow built around:

-   **Shell Environment**: Zsh with Powerlevel10k theme, essential plugins and aliases
-   **Terminal Tools**: Modern CLI replacements (eza, bat, fd, ripgrep, etc.)
-   **Editor**: Neovim and VSCode configurations with carefully selected plugins and extensions
-   **Git**: Streamlined git workflow with lazygit integration
-   **Package Management**: Automated setup via Homebrew Bundle
-   **Dotfile Management**: Organized using GNU Stow for clean symlink management

## 🚀 Quick Start

```bash
# Clone the repository to the home directory
git clone git@github.com:vadymmusiienko/Dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install packages
brew bundle --file ~/.dotfiles/brew/Brewfile

# Set up dotfiles
cd ~/.dotfiles && stow .
```

## Other notes

.hushfile is used to suppress all post-login messages


## MacOS redownload
1. First, connect to wifi
2. clone dot files to the root
3. Install all apps using Brewfile
4. Run stow . from .dotfiles
5. Download all personal files from cloud
6. Sign into icloud
7. SSH keys in bitwarden (copy both private and public to .ssh)

