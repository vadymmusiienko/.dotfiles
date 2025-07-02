Here's the proofread version:

# Ghostty Terminal

**Links:** [Official Website](https://ghostty.org) | [GitHub Repository](https://github.com/ghostty-org/ghostty)

## Why Ghostty

I've tried a ton of different terminals like iTerm2, Kitty, Alacritty, and WezTerm until I stumbled upon Ghostty. Ghostty is the best of all worlds - it has extensive features (everything I need at least), it's open source, and it's blazingly fast and highly customizable. Before Ghostty, my terminal of choice was Alacritty, but Ghostty can do everything Alacritty does and more (like image rendering from Kitty). It's very easily customizable and supports many themes and fonts out of the box.

## Installation & Setup

-   Install via Homebrew: `brew install --cask ghostty` (included in Brewfile)
-   Config file location: `~/.config/ghostty/config`

## Ghostty-specific commands to know

**Theme Management:**

-   `ghostty +list-themes` - List all available built-in themes
-   `ghostty +show-theme <theme-name>` - Display colors and settings for a specific theme

**Configuration:**

-   `ghostty +show-config` - Display current configuration with all settings
-   `ghostty +validate-config` - Check if your config file has any errors
-   `ghostty +config-file` - Show the path to your config file

**Window Management:**

-   `ghostty +new-window` - Open a new Ghostty window
-   `ghostty +new-tab` - Open a new tab (if tabs are enabled)

**Debugging & Info:**

-   `ghostty +version` - Show Ghostty version information
-   `ghostty +help` - Display help and available commands

**Performance:**

-   `ghostty +benchmark` - Run performance benchmarks on your terminal

## Ghostty config file notes

-   **Theme selection**: I'm currently using the rose-pine theme for Ghostty (which is one of the default themes). If you want to change a theme, you can look up available themes by running `ghostty +list-themes`, choose a theme, and then just set it in the config file (ex: `theme = "GruvboxDark"`)
-   **Custom selection colors**: I've overridden the theme's default selection colors with `selection-background = 1d3c3b` and `selection-foreground = eeeeee` for better text visibility when selecting (comment out if needed)
-   **Fullscreen behavior**: Using `macos-non-native-fullscreen = true` makes window switching faster but disables Ghostty's tab feature - trade-off for performance (set to false if needed)
-   **Font setup**: MesloLGS Nerd Font is required for proper icon display in terminal tools like eza, bat, etc. It should be installed with Homebrew though.
-   **Programming ligatures**: `font-feature = +liga` combines characters like `->` and `==` into single symbols for cleaner code appearance (set to `-liga` to disable)
-   **Transparency effect**: Commented out `background-opacity` and `background-blur-radius` - uncomment both if you want a translucent terminal effect
-   **Custom cursor**: Bright pink cursor (`#ff0078`) makes it easy to spot in the terminal
-   **Shell integration**: Enables cursor, sudo, and title features for better terminal experience (shows current directory in title, etc.)
-   **Scrollback**: Set to 10,000 lines - increase if you need more history, but it uses more memory
-   **macOS specific**: Using `xray` icon variant and hidden titlebar for a cleaner look. `quit-after-last-window-closed = true` makes it behave like most Mac apps
-   **Keybinding issues**: Some shift+arrow combinations are commented out because they conflict with tmux - uncomment if not using tmux to avoid getting something like `;10D` when trying to select text in the terminal
