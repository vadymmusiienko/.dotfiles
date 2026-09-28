# Dotfiles

My macOS configuration: shell, terminal, editor, git, and the Homebrew packages
that back them. Managed with GNU Stow, which symlinks everything in this repo
into `$HOME`.

## Setup on a new machine

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone to the home directory
git clone https://github.com/vadymmusiienko/.dotfiles.git ~/.dotfiles

# 3. Install packages (includes git, stow, zsh tooling, neovim, casks)
brew bundle --file ~/.dotfiles/brew/Brewfile

# 4. Create ~/.ssh first so Stow links into it instead of replacing it
mkdir -p ~/.ssh && chmod 700 ~/.ssh

# 5. Link everything into $HOME
cd ~/.dotfiles && stow .

# 6. Restart the shell
exec zsh
```

Check what Stow would do before it does it: `stow -n -v .`

## Layout

```
.config/
  fastfetch/   System info screen (the `info` alias)
  ghostty/     Terminal emulator
  git/         Global git config and ignore file
  nvim/        Neovim, based on NvChad
  p10k/        Powerlevel10k prompt
  rstudio/     RStudio preferences and Catppuccin themes
  tmux/        Tmux config and plugin list
  zsh/         zsh_main, zsh_aliases, zsh_functions
.ssh/config    SSH hosts (keys are never stored here)
bin/           Custom git subcommands, added to PATH
brew/Brewfile  Every package and cask on the machine
scripts/       SSH key setup and cleanup helpers
.zshrc         Sources the files in .config/zsh
.zprofile      PATH, history, and build environment variables
```

`brew`, `scripts`, and every `README.md` are excluded from linking by
`.stow-local-ignore`, so they stay in the repo only.

## Manual steps Stow cannot do

- SSH keys: copy the private and public key from Bitwarden into
  `~/.ssh/id_ed25519` and `~/.ssh/id_ed25519.pub`, then
  `chmod 600 ~/.ssh/id_ed25519`. See `.ssh/README.md`.
  `scripts/setup_ssh_keys.sh` generates a fresh key instead.
- Tmux plugins: `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm`,
  then press `prefix + I` inside tmux.
- Neovim plugins install themselves on first launch.
- Terminal font: `MesloLGS Nerd Font Mono`, installed by the Brewfile.

## Personal checklist after a reinstall

1. Connect to Wi-Fi and sign in to iCloud.
2. Run the setup steps above.
3. Restore SSH keys from Bitwarden.
4. Download personal files from cloud storage.

## Notes

- `.hushlogin` is empty on purpose: its presence suppresses the login message.
- `.latexmkrc` builds LaTeX into `build/` and copies the PDF back to the project root.
- Each directory under `.config/` has its own README with more detail.

## License

MIT, see [LICENSE](LICENSE). One exception: `bin/git-wtf` is third-party code by
William Morgan, licensed GPLv3, and keeps its own header.
