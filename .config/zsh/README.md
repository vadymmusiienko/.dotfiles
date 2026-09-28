# Zsh Configuration

My shell setup, split into three files so each piece stays easy to find:

```
~/.config/zsh/
  zsh_main      Prompt, plugins, history behavior, key bindings
  zsh_aliases   Aliases
  zsh_functions Shell functions
```

`~/.zshrc` sources all three. `~/.zprofile` holds the environment variables
(PATH, history file and sizes, `CMAKE_EXPORT_COMPILE_COMMANDS`), since those only
need to be set once per login rather than per shell.

## Setup

Everything here comes from the Brewfile. The files are linked into place by GNU
Stow from `~/.dotfiles`, so there is nothing to copy by hand. After a change,
run `reload` (`source ~/.zshrc`).

Load order in `zsh_main` matters in two places: the Powerlevel10k instant-prompt
cache has to stay at the top, and `zoxide init` has to stay at the bottom.

## What is in zsh_main

- **Powerlevel10k** prompt, configured in `~/.config/p10k/p10k.zsh`
- **zsh-syntax-highlighting** for command coloring as you type
- **History**: shared across sessions, duplicates dropped first, and history
  expansion verified before it runs
- **Arrow keys** search history by the prefix already typed, instead of walking
  every command
- **zoxide** replaces `cd`

## Modern replacements

These aliases shadow the standard tools, so the habits carry over:

| Alias  | Runs     | Instead of |
| ------ | -------- | ---------- |
| `ls`   | `eza`    | `ls`       |
| `cat`  | `bat`    | `cat`      |
| `grep` | `rg`     | `grep`     |
| `find` | `fd`     | `find`     |
| `cd`   | `z`      | `cd`       |
| `du`   | `dust`   | `du`       |
| `ps`   | `procs`  | `ps`       |
| `top`  | `htop`   | `top`      |
| `man`  | `tldr`   | `man`      |

`ls` variants: `ll` long, `la` long with hidden files, `lt` tree, `lta` tree with
hidden files, `l1` one per line. They all show Nerd Font icons, most sort by
extension, and `ll`, `la`, and `lta` add git status.

Because `grep`, `find`, and `man` are shadowed, scripts that need the real tool
should call it directly (`command grep`, `/usr/bin/find`).

## Other aliases worth knowing

- **Navigation**: `..`, `...`, `....`, and `cdi` for an interactive zoxide jump
- **Safety**: `cp`, `mv`, `rm`, `ln` all run with `-i`, so they ask before
  overwriting or deleting. Use `command rm` in scripts to skip the prompt.
- **Quick edits**: `zshrc`, `zsh_main`, `aliases`, `functions`, `nvimrc`
- **Editor**: `vi` and `vim` both open `nvim`
- **macOS**: `showfiles` / `hidefiles` toggle hidden files in Finder, `flush`
  clears the DNS cache, `dsstore` deletes `.DS_Store` files recursively
- **Tmux**: `tm`, `tma`, `tmn`, `tml`, `tmk`, the `-t` variants `tmat`, `tmnt`,
  `tmkt`, the attach-or-create shortcuts `tm-main`, `tm-work`, `tm-dev`, and
  `tmka` to kill the server
- **Other**: `serve` starts a Python HTTP server on port 8000, `weather` and
  `moon` query wttr.in, `preview` shows an image in the terminal with viu,
  `info` prints the figlet banner and fastfetch, `reload` re-sources `.zshrc`

Some aliases in the file are commented out, mostly git and npm shortcuts I
decided not to keep. Uncomment what you want.

## Functions

| Function          | What it does                                      |
| ----------------- | ------------------------------------------------- |
| `mkcd <dir>`      | Create a directory and cd into it                 |
| `extract <file>`  | Unpack any common archive format                  |
| `backup <file>`   | Copy to `<file>.bak`                              |
| `genpass [len]`   | Random password, 16 characters by default         |
| `cheat <cmd>`     | Cheat sheet for a command from cht.sh             |
| `myipinfo`        | Public IP and location as JSON, needs `jq`        |

## Customizing

Edit the matching file and run `reload`. Aliases go in `zsh_aliases`, functions
in `zsh_functions`, and anything touching the prompt, plugins, or history goes in
`zsh_main`.
