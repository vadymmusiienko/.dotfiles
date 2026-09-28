# Configuration Files

Everything under `~/.config`, linked here from `~/.dotfiles/.config` by GNU Stow.
Each directory has its own README with the details.

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
```

Every tool here is installed by `brew/Brewfile`, so start there on a new machine.
The shared pieces are the `MesloLGS Nerd Font Mono` font, which the icons in eza,
bat, and the prompt depend on, and a Rose Pine or Catppuccin palette used across
the terminal, tmux, and RStudio.

Nothing in this directory is machine-specific. Runtime state written by tools
(htop, Raycast, cagent) is ignored by the repo's `.gitignore` rather than tracked.
