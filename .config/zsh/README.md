# Modern Zsh Configuration

A modular, modern zsh configuration that enhances the terminal experience with powerful tools and aliases

## Structure

This configuration is split into three modular files located in `~/.config/zsh/`:

```
~/.config/zsh/
├── zsh_main      # Core configuration and plugin loading
├── zsh_aliases   # Command aliases and shortcuts
└── zsh_functions # Custom shell functions
```

Your `~/.zshrc` should source all three files:

```bash
source ~/.config/zsh/zsh_main
source ~/.config/zsh/zsh_aliases
source ~/.config/zsh/zsh_functions
```

## Features

### Modern Command Replacements
- **File listing**: `eza` instead of `ls` with icons and git integration
- **Navigation**: `zoxide` for smart directory jumping
- **File search**: `fd` instead of `find`
- **Text search**: `ripgrep` instead of `grep`
- **File viewing**: `bat` instead of `cat` with syntax highlighting
- **System monitoring**: `htop`, `procs`, `dust` for better system info
- **Help**: `tldr` for concise command examples

### Enhanced Navigation
- `ls`, `ll`, `la` - Beautiful file listings with icons and git status
- `lt`, `lta` - Tree view of directories
- `cd` aliased to `z` (zoxide) for intelligent directory jumping
- `cdi` for interactive directory selection
- Quick parent directory navigation (`..`, `...`, `....`)

### Development Tools
- Python 3 as default (`python`, `pip`)
- Node.js shortcuts (`ni`, `nr`, `ns`, `nt`)
- Quick config editing (`zshrc`, `aliases`, `functions`, `nvimrc`)
- Local development server (`serve`)
- JSON pretty printing (`jsonpp`)

### System Utilities
- Safe file operations with confirmation prompts
- Network utilities and IP information
- macOS-specific commands (show/hide hidden files, DNS flush)
- Archive extraction for multiple formats
- Backup and password generation functions

### Terminal Enhancements
- **Powerlevel10k** theme for a beautiful, informative prompt
- **Syntax highlighting** for commands as you type
- **History search** with arrow keys
- Tmux session management shortcuts

## ⚙️ Installation

1. **Create the config directory:**
   ```bash
   mkdir -p ~/.config/zsh
   ```

2. **Copy the configuration files** to `~/.config/zsh/`:
   - `zsh_main`
   - `zsh_aliases` 
   - `zsh_functions`

3. **Update your `~/.zshrc`:**
   ```bash
   source ~/.config/zsh/zsh_main
   source ~/.config/zsh/zsh_aliases
   source ~/.config/zsh/zsh_functions
   ```

4. **Install Powerlevel10k configuration:**
   ```bash
   mkdir -p ~/.config/p10k
   # Run p10k configure to set up your prompt
   p10k configure
   ```

5. **Reload your shell:**
   ```bash
   source ~/.zshrc
   # or use the alias:
   reload
   ```

## Key Aliases & Functions

### File Operations
- `ls` → `eza --icons=always --group-directories-first --sort=extension`
- `cat` → `bat` (syntax highlighting)
- `find` → `fd` (faster, more intuitive)
- `grep` → `rg` (ripgrep)

### Navigation
- `cd` → `z` (zoxide smart jumping)
- `..` → `cd ..`
- `mkcd <dir>` → create and enter directory

### Development
- `serve` → Start HTTP server on port 8000
- `jsonpp` → Pretty print JSON with jq
- `ni/nr/ns/nt` → npm install/run/start/test

### System Info
- `info` → Display welcome message with system info
- `weather` → Current weather via wttr.in
- `myipinfo` → Get public IP and location info

### Utilities
- `extract <file>` → Extract any archive format
- `backup <file>` → Create .bak copy
- `genpass [length]` → Generate random password
- `cheat <command>` → Get command cheatsheet

### Tmux Management
- `tm` → tmux
- `tma` → attach to session
- `tm-main` → attach to 'main' session or create it
- `tmka` → kill all sessions

## Customization

### Adding New Aliases
Edit `~/.config/zsh/zsh_aliases` and add your aliases, then run `reload`.

### Adding New Functions
Edit `~/.config/zsh/zsh_functions` for custom shell functions.

### Modifying Core Settings
Edit `~/.config/zsh/zsh_main` for history settings, plugin loading, and key bindings.

### Quick Config Access
- `aliases` - Edit aliases file
- `functions` - Edit functions file  
- `zsh_main` - Edit main config
- `zshrc` - Edit main .zshrc

## History Configuration

The configuration includes optimized history settings:
- Shared history between sessions
- Duplicate removal
- History verification before execution
- Arrow key history search