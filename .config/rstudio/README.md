# RStudio

**Links:** [Official Website](https://posit.co/products/open-source/rstudio/)

RStudio preferences and custom themes. RStudio writes `rstudio-prefs.json`
itself, so treat this as a snapshot: change settings in the GUI, then commit the
diff.

## Setup

- `brew install --cask rstudio` (included in the Brewfile)
- `rstudio-prefs.json` is read from `~/.config/rstudio/`
- Themes live in `~/.config/rstudio/themes/` and appear under
  Tools, Global Options, Appearance once linked

## Themes

Three Catppuccin flavors are included: `frappe`, `macchiato`, and `mocha`.
`mocha` is the one selected in the preferences, which keeps RStudio in line with
the terminal and tmux.

## Notable preferences

- **Vim keybindings** in the editor, matching Neovim.
- **4 spaces** per tab with indentation auto-detection, relative line numbers,
  and rainbow parentheses.
- **Format on save** using [Air](https://posit-dev.github.io/air/), plus strip
  trailing whitespace and append a final newline.
- **Pane layout**: source and console on the left and right, Environment and
  History hidden, sidebar off.
- **Graphics**: the `ragg` backend, which renders faster and matches saved plots
  more closely than the default.
- **Python**: the system interpreter at `/usr/bin/python3`. Point this at a conda
  or venv interpreter if a project needs one.
