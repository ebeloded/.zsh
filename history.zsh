# ~/.zsh/history.zsh
# History configuration

# History file and size
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# History behavior
setopt SHARE_HISTORY          # Share history across all sessions in real-time
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate when new duplicate is added
setopt HIST_REDUCE_BLANKS     # Remove superfluous whitespace from history entries
setopt HIST_IGNORE_SPACE      # Prefix command with space to keep it out of history
setopt HIST_VERIFY            # Show expanded history command before executing (e.g. !!)
setopt EXTENDED_HISTORY       # Save timestamp and duration to history file

# Up/Down arrow: prefix-based history search
# Type a prefix, then press up/down to cycle through matching commands only
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
