# Run fastfetch on terminal startup
if [[ $- == *i* ]] && [[ -z "$TMUX" ]] && command -v fastfetch >/dev/null 2>&1; then
    clear && figlet "Welcome to Zsh!" && fastfetch
fi

# Load custom aliases and functions
source ~/.zsh_aliases # Custom aliases
source ~/.zsh_functions # Custom functions

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Define a clean, custom PATH
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin"                   # Homebrew (Apple Silicon)
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"    # Core system binaries
# export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.12/bin"  # Python 3.12
# export PATH="$PATH:$HOME/.cargo/bin"                                # Rust
# export PATH="$PATH:$HOME/.ghcup/bin:$HOME/.cabal/bin"               # Haskell tools
# export PATH="$PATH:/Applications/quarto/bin"                        # Quarto CLI

[ -f "/Users/smokiemac/.ghcup/env" ] && . "/Users/smokiemac/.ghcup/env" # ghcup-env