# Fastfetch

**Links:** [GitHub Repository](https://github.com/fastfetch-cli/fastfetch)

## Why Fastfetch

Fastfetch is a modern replacement for neofetch with significantly better performance and extensive customization options. Fastfetch is a system information tool that shows details about your hardware, operating system, and software configuration in a colorful terminal display.

## Installation & Setup

- Install via Homebrew: `brew install fastfetch` (included in Brewfile)
- Config file location: `~/.config/fastfetch/config.jsonc`
- Run with: `fastfetch` or `info`

## Fastfetch-specific commands to know

**Basic Usage:**
- `fastfetch` - Display system information with your custom config
- `info` (alias) - Display system information with a custom message (see aliases)
- `fastfetch --list-modules` - List all available information modules

**Configuration:**
- `fastfetch --gen-config` - Generate a default configuration file
- `fastfetch --print-config` - Display current configuration
- `fastfetch --config <path>` - Use a specific config file

**Logo Management:**
- `fastfetch --list-logos` - Show all available built-in logos
- `fastfetch --logo <name>` - Use a specific logo
- `fastfetch --logo none` - Disable logo display

**Debugging:**
- `fastfetch --version` - Show version information
- `fastfetch --list-features` - Display compiled features and dependencies

## Fastfetch config file notes

- **Custom layout**: The config uses a structured layout with bordered sections for Hardware, Software, and Desktop Environment information
- **Logo positioning**: Logo is set to builtin type with custom height (15) and width (30), with specific padding values (top: 6, left: 22) to align properly with the information sections
- **Hardware section**: Displays PC model, CPU, GPU, memory, and disk information with green-colored keys and a tree-like structure using Unicode box characters
- **Software section**: Shows OS, kernel, BIOS, package count, and shell with yellow-colored keys, maintaining the same visual hierarchy
- **Desktop environment section**: Lists DE, login manager, window manager, WM theme, and terminal with blue-colored keys
- **Uptime/Age section**: Custom section with magenta-colored keys showing OS installation age (calculated via filesystem stats), current uptime, and date/time
- **Color palette**: Displays color circles at the bottom with custom padding and circle symbols instead of default blocks
- **Unicode characters**: Uses box drawing characters (┌┐└┘├─) and Nerd Font icons
- **Custom commands**: The OS Age module uses a custom shell command to calculate days since OS installation by checking filesystem birth time
- **Commented sections**: Color bars are commented out - uncomment if you prefer the traditional color bar display over circles
- **Break spacing**: Multiple break modules create proper vertical spacing between sections for better readability