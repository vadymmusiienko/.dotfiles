# Fastfetch

**Links:** [GitHub Repository](https://github.com/fastfetch-cli/fastfetch)

## Why Fastfetch

A system information tool: hardware, OS, and desktop details in a compact
terminal display. It is a much faster neofetch replacement and is configured with
plain JSON instead of shell script.

## Installation and setup

- Install via Homebrew: `brew install fastfetch` (included in the Brewfile)
- Config file: `~/.config/fastfetch/config.jsonc`
- Run with `fastfetch`, or `info` to also print the figlet banner

## Commands to know

- `fastfetch` - display system information using this config
- `fastfetch -c none` - run with no config, to check whether a problem is yours
- `fastfetch --list-modules` - every module available to put in the config
- `fastfetch --list-logos` - every built-in logo
- `fastfetch --logo none` - run without a logo
- `fastfetch --gen-config <path>` - generate a fresh default config
- `fastfetch --list-features` - what this build was compiled with

## Notes on this config

- Four boxed sections drawn with `custom` modules and box characters: Hardware,
  Software, desktop environment, and Uptime / Age / DateTime.
- Keys are colored per section (green, yellow, blue, magenta) and indented with
  a tree made of `│ ├` and `└ └` prefixes.
- The logo is a builtin, sized 15 by 30 with padding tuned to line up with the
  boxes. Those paddings are marked `// Adjust` because they need retuning if you
  change the font size or logo.
- Nerd Font icons appear in the keys, so a Nerd Font is required.
- The OS Age module shells out to `stat` for the root filesystem birth time. It
  uses the BSD form, `stat -f %B`, because this is a macOS config. On Linux it
  needs `stat -c %W` instead.
- The color palette at the bottom uses `"symbol": "circle"`. A plain `colors`
  module is commented out just above it if you prefer the default bars.
