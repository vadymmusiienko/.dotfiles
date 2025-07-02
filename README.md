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
