# ---- PATH ENVIRONMENT VARIABLES ----
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin"                  # Homebrew binaries
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"    # Core system binaries
export PATH="$HOME/bin:$PATH"                                       # My custom scripts (from .dotfiles)

# ---- HISTORY ENVIRONMENT VARIABLES ----
export HISTFILE=$HOME/.zhistory                                     # File where history is saved
export SAVEHIST=1000                                                # Number of history entries to save
export HISTSIZE=999                                                 # Number of history entries to keep in memory
