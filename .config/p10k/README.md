# Powerlevel10k (P10k) ZSH Theme

**NOTE:** Powerlevel10k has very limited support

**Links:** [Official Website](https://github.com/romkatv/powerlevel10k) | [GitHub Repository](https://github.com/romkatv/powerlevel10k/tree/master)

## Why Powerlevel10k

Powerlevel10k is a fast, customizable ZSH prompt theme that displays useful information about your current directory, git status, system performance, and more right in your terminal prompt. After trying various ZSH themes like oh-my-zsh's default themes, agnoster, and pure, Powerlevel10k stands out as the best combination of speed, features, and visual appeal. It's incredibly fast (100x faster than powerlevel9k), highly customizable, and comes with an excellent configuration wizard that makes setup effortless.

## Installation & Setup

- Install via Homebrew: `brew install powerlevel10k` (included in Brewfile)
- Config file location: `~/.config/p10k/p10k.zsh` (deafault is just `~/.p10k.zsh`)
- Run configuration wizard: `p10k configure`

## Powerlevel10k-specific commands to know

**Configuration:**
- `p10k configure` - Launch the interactive configuration wizard (Will overwrite old config)
- `p10k reload` - Reload Powerlevel10k configuration after making changes

**Customization:**
- Edit `~/.config/p10k/p10k.zsh` directly for advanced customization