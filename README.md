# Dotfiles

My macOS configuration: shell, terminal, editor, git, and the Homebrew packages
that back them. Managed with GNU Stow, which symlinks everything in this repo
into `$HOME`.

Everything needed to go from a clean machine to a working setup is on this page.
The READMEs inside each directory explain individual tools and are not needed for
setup.

## Setup

Copy-paste these in order. Two orderings matter: step 5 must come before step 6,
and everything from step 6 on needs the packages installed in step 4.

```bash
# 1. Xcode command line tools (git, compilers)
xcode-select --install

# 2. Homebrew, then put it on PATH for this shell only
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3. Clone this repo to the home directory
git clone https://github.com/vadymmusiienko/.dotfiles.git ~/.dotfiles

# 4. Install every package and app
brew bundle --file ~/.dotfiles/brew/Brewfile

# 5. Create ~/.ssh yourself, BEFORE stowing.
#    Otherwise Stow links the whole directory and your private keys end up
#    living inside this repo.
mkdir -p ~/.ssh && chmod 700 ~/.ssh

# 6. Link everything into $HOME. Dry run first, it changes nothing.
cd ~/.dotfiles
stow -n -v .
stow .

# 7. Start a new shell, now with the real config
exec zsh

# 8. SSH keys: copy id_ed25519 and id_ed25519.pub out of Bitwarden into ~/.ssh,
#    then fix permissions and test.
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
ssh -T git@github.com

# 9. Switch this repo to SSH so you can push to it
git -C ~/.dotfiles remote set-url origin git@github.com:vadymmusiienko/.dotfiles.git

# 10. Tmux plugin manager, then press prefix + I inside tmux to install plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# 11. Neovim: launch it once and wait. lazy.nvim bootstraps itself, then Mason
#     and Treesitter install the language servers, formatters, and parsers.
nvim
```

If you have no keys to restore in step 8, run `~/.dotfiles/scripts/setup_ssh_keys.sh`
to generate a fresh pair instead. Note that it writes an agent block into
`~/.ssh/config`, which is a symlink into this repo, so check `git status`
afterwards.

Finally, open Ghostty and confirm the font is `MesloLGS Nerd Font Mono`. The
config sets it, and the Brewfile installs it, but icons in `ls`, the prompt, and
Neovim will all be missing boxes if the font did not install.

## Check it worked

- The prompt shows git status and timing. If it is plain, Powerlevel10k did not load.
- `ls` shows icons and colors. If not, the font or `eza` is missing.
- `tmux` starts, `prefix + I` reports plugins installed. Prefix is `Ctrl-Space`.
- `nvim` opens with no errors, and `:checkhealth` is clean.
- `git config --get user.email` returns your address, not a placeholder.

## How the linking works

`stow .` links the top level of this repo into `$HOME`. On a clean machine that
means `~/.config` becomes a symlink to `~/.dotfiles/.config`, so anything an app
later writes under `~/.config` is written inside this repo and shows up in
`git status`. That is why `.gitignore` excludes tool state like `.config/htop/`
and `.config/raycast/`, and every path that can hold a credential.

`brew`, `scripts`, and every `README.md` are excluded from linking by
`.stow-local-ignore`, so they stay in the repo only.

## If something goes wrong

- **`stow: command not found`**: step 4 did not finish. Re-run `brew bundle`.
- **`brew: command not found`** in a new shell: `.zprofile` is not linked yet, so
  re-run the `eval "$(/opt/homebrew/bin/brew shellenv)"` line from step 2.
- **Stow reports conflicts**: a real file already exists where a symlink should
  go, usually `~/.zshrc`. Move it aside (`mv ~/.zshrc ~/.zshrc.bak`) and re-run.
- **`~/.ssh` became a symlink**: you stowed before step 5. Run `stow -D .`,
  remove the symlink, create the directory properly, and stow again.
- **Boxes instead of icons**: the Nerd Font is not installed or not selected in
  the terminal.
- **LaTeX: `latexmk: command not found`**: `sudo tlmgr install latexmk`. BasicTeX
  is minimal and does not always include it.

## Layout

```
.config/
  fastfetch/   System info screen, shown by the `info` alias
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

## Full macOS reinstall checklist

1. Connect to Wi-Fi, sign in to iCloud.
2. Run the setup steps above.
3. Restore SSH keys from Bitwarden.
4. Sign in to the apps that need it: Bitwarden, Raycast, Spotify, Google Drive.
5. Download personal files from cloud storage.

## Notes

- `.hushlogin` is empty on purpose: its presence suppresses the login message.
- `.latexmkrc` builds LaTeX into `build/` and copies the PDF back to the project root.
- The conda block at the bottom of `.zshrc` is managed by `conda init` and is
  skipped automatically if miniconda is not installed.
- Each directory under `.config/` has its own README with more detail.

## License

MIT, see [LICENSE](LICENSE). One exception: `bin/git-wtf` is third-party code by
William Morgan, licensed GPLv3, and keeps its own header.
