# Ghostty Terminal

**Links:** [Official Website](https://ghostty.org) | [GitHub Repository](https://github.com/ghostty-org/ghostty)

## Why Ghostty

I went through iTerm2, Kitty, Alacritty, and WezTerm before settling here.
Ghostty is fast, open source, and does everything I used Alacritty for plus
extras like Kitty-style image rendering. Themes and font handling work out of
the box.

## Installation and setup

- Install via Homebrew: `brew install --cask ghostty` (included in the Brewfile)
- Config file: `~/.config/ghostty/config`
- Requires `MesloLGS Nerd Font Mono`, also installed by the Brewfile

## Commands to know

- `ghostty +show-config` - print the effective config
- `ghostty +validate-config` - check the config file for errors
- `ghostty +edit-config` - open the config file in your editor
- `ghostty +list-themes` - list the built-in themes
- `ghostty +list-keybinds` - every active keybinding
- `ghostty +list-fonts` - fonts Ghostty can see
- `ghostty +list-actions` - actions available to bind to keys
- `ghostty +version`

On macOS the emulator itself cannot be launched from the CLI, only these
actions. Use `open -na Ghostty.app` instead.

## Notes on this config

- **Theme**: Rose Pine, one of the built-ins. Pick another with
  `ghostty +list-themes` and set `theme = "<name>"`.
- **Selection colors**: `selection-background` and `selection-foreground` are
  commented out, so the theme's own selection colors apply. Uncomment them if
  selected text is hard to read.
- **Fullscreen**: `macos-non-native-fullscreen = true` makes window switching
  faster but disables Ghostty's own tabs. Tmux covers that for me.
- **Font**: size 16, `font-thicken = true`, and `font-feature = +liga` so `->`
  and `==` render as ligatures. Set `-liga` to turn that off. The underline
  position and thickness are nudged so underlines do not collide with descenders.
- **Cursor**: bright pink (`#ff0078`), easy to find on a busy screen.
- **Shell integration**: `cursor,sudo,title,ssh-terminfo,ssh-env`. The two ssh
  features fix terminfo and environment on remote hosts, which matters for the
  machines in `~/.ssh/config`.
- **Transparency**: `background-opacity` and `background-blur-radius` are
  commented out. Uncomment both for a translucent window.
- **macOS look**: hidden titlebar, no window decorations, `xray` icon variant,
  and `quit-after-last-window-closed = true` so it behaves like a normal Mac app.
- **Scrollback**: 10,000 lines.
- **Keybindings**: the `shift+arrow` ignores at the bottom are commented out.
  Uncomment them if you are not using tmux and see stray sequences like `;10D`
  when shift-selecting text.
