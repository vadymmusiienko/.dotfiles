# Powerlevel10k Zsh Theme

**Links:** [GitHub Repository](https://github.com/romkatv/powerlevel10k)

**Note:** Powerlevel10k is in low-maintenance mode. The author recommends
[Starship](https://starship.rs) for new setups. It still works well, so I have
not moved.

## Why Powerlevel10k

A fast, informative prompt: directory, git status, exit codes, and timing,
without the startup lag of older themes like powerlevel9k or agnoster. The
instant-prompt feature draws the prompt before the rest of the shell finishes
loading, so a new terminal is usable immediately.

## Installation and setup

- `brew install powerlevel10k` (included in the Brewfile)
- Config file: `~/.config/p10k/p10k.zsh`. The default location is `~/.p10k.zsh`;
  `.config/zsh/zsh_main` sources it from here instead.
- `zsh_main` also sources the instant-prompt cache, which must stay at the very
  top of the shell startup or it prints a warning.
- Requires `MesloLGS Nerd Font Mono` for the glyphs, installed by the Brewfile.

## Commands to know

- `p10k configure` - run the setup wizard. It overwrites the config file, so
  commit or back up your current one first.
- `p10k reload` - reload after editing the config by hand.

## Notes

`p10k.zsh` is the wizard's output, roughly 1,700 lines of documented options.
Search it for the segment you want rather than reading it top to bottom.
