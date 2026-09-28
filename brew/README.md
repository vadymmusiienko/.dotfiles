# Homebrew

`Brewfile` is the full list of formulae and casks on this machine. It is the
source of truth for what the rest of these configs assume is installed, so
install from it first on a new machine.

## Usage

```bash
# Install everything in the Brewfile
brew bundle --file ~/.dotfiles/brew/Brewfile

# Regenerate the Brewfile from what is currently installed
brew bundle dump --file ~/.dotfiles/brew/Brewfile --force

# Check whether anything in the Brewfile is missing
brew bundle check --file ~/.dotfiles/brew/Brewfile

# Uninstall anything not listed in the Brewfile
brew bundle cleanup --file ~/.dotfiles/brew/Brewfile
```

`cleanup` removes packages, so run it with `--dry-run` first.

Prerequisite, if Homebrew is not installed yet:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## What is in it

Read the Brewfile itself: every entry has a comment saying what it is and why it
is there. Rather than duplicating that list here, where it would go stale, this
is what the configs in this repo actually depend on:

| Config                | Needs                                                            |
| --------------------- | ---------------------------------------------------------------- |
| `.config/zsh`         | `eza`, `bat`, `fd`, `ripgrep`, `zoxide`, `dust`, `procs`, `htop`, `tealdeer`, `viu`, `figlet`, `cmatrix`, `fastfetch` |
| `.config/p10k`        | `powerlevel10k`, `zsh-syntax-highlighting`, `font-meslo-lg-nerd-font` |
| `.config/git`         | `git`, `diff-so-fancy` (pager), `git-lfs` (filter), `neovim` (editor), `visual-studio-code` (difftool) |
| `.config/tmux`        | `tmux`                                                           |
| `.config/nvim`        | `neovim`                                                         |
| `.config/ghostty`     | `ghostty`, `font-meslo-lg-nerd-font`                             |
| `.config/rstudio`     | `rstudio`                                                        |
| `.latexmkrc`          | a TeX distribution, `basictex` in the Brewfile                   |
| Dotfile linking       | `stow`                                                           |

Some entries are commented out in the Brewfile: things I tried and stopped
using, plus tools macOS already ships (`jq` is at `/usr/bin/jq` on recent
versions). Uncomment what you need.

## Maintenance

```bash
brew update && brew upgrade   # formulae and casks
brew cleanup                  # old versions and cache
brew doctor                   # diagnose problems
```

After installing something you want to keep, re-run `brew bundle dump --force`
and commit the diff. That keeps the Brewfile honest, which is the only reason it
is useful on a fresh machine.
