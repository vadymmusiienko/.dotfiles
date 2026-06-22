# Tmux Configuration

My personal tmux setup. Config lives at `~/.config/tmux/tmux.conf` and is managed
through my dotfiles (`~/.dotfiles`).

**Links:** [Official Website](https://tmux.github.io/) | [GitHub](https://github.com/tmux/tmux)

For a full, searchable cheat sheet of tmux commands and shortcuts (including these
customizations), see my [tmux_cheat_sheet](https://github.com/vadymmusiienko/tmux_cheat_sheet) repo.

## What is Tmux

Tmux is a terminal multiplexer: multiple terminal sessions, windows split into panes,
all managed from one interface, with persistent sessions you can detach and reattach.

## Installation & Setup

- Install via Homebrew: `brew install tmux` (included in the Brewfile)
- Config file: `~/.config/tmux/tmux.conf`
- Plugins are managed by [TPM](https://github.com/tmux-plugins/tpm). On a fresh machine:
  ```sh
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
  ```
  then start tmux and press `prefix + I` to install plugins.
- Start tmux: `tmux` (aliased to `tm`) or `tmux new-session -s name`

## The prefix

The prefix is **`Ctrl-Space`** (changed from the default `Ctrl-b`). Everywhere below,
`prefix` means `Ctrl-Space`.

## Custom key bindings

| Action                          | Keys               | Default                 |
| ------------------------------- | ------------------ | ----------------------- |
| Reload config                   | `prefix` `r`       | —                       |
| Split pane right (side by side) | `prefix` `\`       | `prefix %`              |
| Split pane down (stacked)       | `prefix` `-`       | `prefix "`              |
| New window (keeps current path) | `prefix` `c`       | `prefix c`              |
| Navigate panes (vim-aware)      | `Ctrl-h/j/k/l`     | `prefix ←↓↑→`           |
| Resize pane                     | `Shift + ←↓↑→`     | `prefix Ctrl-←↓↑→`      |
| Previous / next window          | `Ctrl-Shift-← / →` | `prefix p` / `prefix n` |
| Zoom pane                       | `prefix` `z`       | `prefix z`              |
| Detach                          | `prefix` `d`       | `prefix d`              |

`Ctrl-h/j/k/l` is provided by [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator):
the same keys move seamlessly between Neovim splits and tmux panes.

## Copy mode (vi style)

`mode-keys vi`. Enter copy mode with `prefix [`.

| Action                               | Keys           |
| ------------------------------------ | -------------- |
| Begin selection                      | `v`            |
| Copy selection (to system clipboard) | `y` or `Enter` |
| Paste tmux buffer                    | `prefix ]`     |

Clipboard integration is OS-aware: `pbcopy` on macOS, `wl-copy` on Wayland, `xclip` on X11.

## Plugins (TPM)

| Plugin                                                                  | Purpose                                                     |
| ----------------------------------------------------------------------- | ----------------------------------------------------------- |
| [tpm](https://github.com/tmux-plugins/tpm)                              | Plugin manager                                              |
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)          | Sane defaults (also sets `focus-events`, `escape-time 0`)   |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | `Ctrl-h/j/k/l` pane/split navigation with Neovim            |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)        | Save/restore sessions — `prefix S` save, `prefix R` restore |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)        | Auto-save every 15 min and auto-restore on start            |

Sessions (including pane contents) survive reboots: continuum restores the last saved
environment automatically when tmux starts.

**Managing plugins:** `prefix I` install, `prefix U` update, `prefix alt-u` clean.

## Shell aliases

Defined in `~/.config/zsh/zsh_aliases`:

| Alias     | Command                                                     |
| --------- | ----------------------------------------------------------- |
| `tm`      | `tmux`                                                      |
| `tma`     | `tmux attach`                                               |
| `tmn`     | `tmux new-session`                                          |
| `tml`     | `tmux list-sessions`                                        |
| `tmk`     | `tmux kill-session`                                         |
| `tmat`    | `tmux attach-session -t`                                    |
| `tmnt`    | `tmux new-session -t`                                       |
| `tmkt`    | `tmux kill-session -t`                                      |
| `tm-work` | `tmux new-session -d -s work`                               |
| `tm-dev`  | `tmux new-session -d -s dev`                                |
| `tm-main` | `tmux attach-session -t main \|\| tmux new-session -s main` |
| `tmka`    | `tmux kill-server` (kills all sessions + server)            |

## Config highlights

- **Custom prefix** `Ctrl-Space` — easier to reach than `Ctrl-b`.
- **Truecolor** — `tmux-256color` + `terminal-features ",*:RGB"` for accurate colors.
- **Intuitive splits** — `\` for side-by-side, `-` for stacked.
- **Mouse mode** — on, for resizing/scrolling.
- **Rose Pine** status bar — muted colors for long sessions.
- **Persistent sessions** — `detach-on-destroy off`; resurrect + continuum auto-restore.
- **Clean window numbering** — `renumber-windows on`.
- **Quiet** — activity/bell monitoring disabled (no flashing or beeps).
- **Multi-client friendly** — `aggressive-resize on`, 10,000-line scrollback.
