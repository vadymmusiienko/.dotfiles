# Configuration Files

This directory contains all my dotfiles and configuration files for various tools and applications. Each subdirectory has its own README with detailed setup instructions and feature explanations.

## Directory Structure

```
.config/
├── fastfetch/          # System information display tool
│   ├── config.jsonc    # Fastfetch configuration
│   └── README.md       # Setup and customization guide
├── ghostty/            # Modern GPU-accelerated terminal
│   ├── config          # Ghostty terminal configuration
│   └── README.md       # Terminal setup and features
├── git/                # Git version control settings
│   ├── config          # Git global configuration
│   └── README.md       # Git aliases and workflow setup
├── p10k/               # Powerlevel10k zsh theme
│   ├── p10k.zsh        # Powerlevel10k prompt configuration
│   └── README.md       # Theme customization guide
├── tmux/               # Terminal multiplexer
│   ├── tmux.conf       # Tmux configuration file
│   └── README.md       # Session management and shortcuts
├── zsh/                # Z shell configuration
│   ├── zsh_aliases     # Command aliases and shortcuts
│   ├── zsh_functions   # Custom shell functions
│   ├── zsh_main        # Core zsh settings and plugins
│   └── README.md       # Complete shell setup guide
└── README.md           # This file
```

## 🚀 Quick Start

Each configuration directory is self-contained with its own documentation. To get started:

1. **Browse the specific tool's directory** you're interested in
2. **Read the README.md** for detailed setup instructions
3. **Follow the installation steps** provided in each README
4. **Customize as needed** using the configuration files

***Ideally used with GNU stow***

## Tool Overview

### 🖥️ [FastFetch](./fastfetch/README.md)

Modern system information display tool that shows hardware specs, OS details, and system stats in a clean, customizable format.

### 👻 [Ghostty](./ghostty/README.md)

Fast, GPU-accelerated terminal emulator with modern features and excellent performance for development workflows.

### 🔧 [Git](./git/README.md)

Global Git configuration with useful aliases, sensible defaults, and workflow optimizations for version control.

### ⚡ [Powerlevel10k](./p10k/README.md)

Fast, customizable zsh theme that provides a beautiful, informative prompt with git integration and system information.

### 🔀 [Tmux](./tmux/README.md)

Terminal multiplexer configuration for managing multiple terminal sessions, panes, and windows efficiently.

### 🐚 [Zsh](./zsh/README.md)

Modern shell configuration with powerful aliases, functions, and plugins that enhance the command-line experience.

## Key Features Across Tools

-   **Modern CLI replacements** (eza, bat, ripgrep, fd, zoxide)
-   **Beautiful, informative interfaces** with icons and colors
-   **Git integration** throughout the workflow
-   **Performance optimizations** for daily development tasks
-   **Consistent theming** across all terminal applications
-   **Productivity shortcuts** and intelligent defaults

## Dependencies

Most configurations depend on these core tools:

-   **Homebrew** (macOS package manager)
-   **Git** (version control)
-   **Zsh** (shell)
-   **Modern CLI tools** (installed per-tool as needed)

## Installation Philosophy

Each tool's configuration follows these principles:

-   **Modular design** - Easy to modify individual components
-   **Well-documented** - Clear explanations for every setting
-   **Sensible defaults** - Works great out of the box
-   **Easy customization** - Simple to adapt to personal preferences
-   **Cross-reference** - Tools work together seamlessly

---

_Each tool has been carefully configured to work together as a cohesive development environment._
