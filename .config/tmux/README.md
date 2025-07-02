# Tmux Terminal Multiplexer

**Links:** [Official Website](https://tmux.github.io/) | [GitHub Repository](https://github.com/tmux/tmux)

## What is Tmux

Tmux is a terminal multiplexer that allows you to create multiple terminal sessions, split windows into panes, and manage them all from a single interface. It's perfect for organizing your workflow and maintaining persistent sessions.

## Installation & Setup

- Install via Homebrew: `brew install tmux` (included in Brewfile)
- Config file location: `~/.config/tmux/tmux.conf`
- Start tmux: `tmux` (aliased to `tm`) or `tmux new-session -s session-name`

## Tmux Aliases (Essential)

### Basic Commands
- `tm` - Start tmux
- `tma` - Attach to the most recent session
- `tmn` - Create a new session
- `tml` - List all active sessions
- `tmk` - Kill the current session

### Session Management
- `tmat` - Attach to a specific session by name
- `tmnt` - Create a new session with a specific name
- `tmkt` - Kill a specific session by name

### Workflow Sessions
- `tm-work` - Create a detached "work" session
- `tm-dev` - Create a detached "dev" session  
- `tm-main` - Attach to "main" session, or create it if it doesn't exist

### System Control
- `tmka` - Kill all tmux sessions and the server

## Tmux-specific key bindings to know

**Key Bindings (with Ctrl-Space prefix):**
- `Ctrl-Space + r` - Reload tmux configuration
- `Ctrl-Space + \` - Split pane horizontally
- `Ctrl-Space + -` - Split pane vertically
- `Ctrl-Space + h/j/k/l` - Navigate panes (vim-style)
- `Ctrl-Space + c` - Create new window

**Window & Pane Management:**
- `Shift + Arrow Keys` - Resize panes
- `Ctrl-Shift + Left/Right` - Switch between windows
- `Ctrl-Space + d` - Detach from session
- `Ctrl-Space + x` - Kill current pane
- `Ctrl-Space + &` - Kill current window

**Copy Mode (Vi-style):**
- `Ctrl-Space + [` - Enter copy mode
- `v` - Begin selection (in copy mode)
- `y` - Copy selection to clipboard
- `Ctrl-Space + ]` - Paste from tmux buffer

**Useful Commands:**
- `tmux capture-pane -t <session>:<window> -p` - Capture pane content
- `tmux send-keys -t <session>:<window> "command" Enter` - Send commands to pane

## Tmux config file notes

- **Custom prefix**: Changed from default Ctrl-b to Ctrl-Space
- **Mouse support**: Enabled for easier pane resizing and scrolling
- **Vim-style navigation**: Uses h/j/k/l keys for pane navigation
- **Intuitive splits**: Backslash (\) for horizontal splits and dash (-) for vertical splits, more logical than default % and "
- **Rose Pine theme**: Custom color scheme with muted colors for comfortable long-term use
- **Persistent sessions**: Configured to not exit when closing sessions, allowing you to maintain multiple workspaces
- **Copy mode**: Vi-style copy mode with clipboard integration for macOS (pbcopy)
- **Window management**: Automatic renumbering when windows are closed, keeps numbering clean and sequential
- **Performance**: Aggressive resize enabled for better multi-client usage, 10,000 line scrollback buffer
- **Plugin support**: Commented TPM (Tmux Plugin Manager) configuration (Add later)