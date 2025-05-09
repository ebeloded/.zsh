# Configure Starship
# ~/.config/starship.toml

# eval "$(starship init zsh)"

# PROMPT=''

# fpath+=(~/.zsh/pure)
# autoload -U promptinit
# promptinit
# prompt pure

# CUSTOM PROMPT
setopt prompt_subst # Enable command substitution in prompt

# Show relative path from git root, or just the repo name at the root
get_git_relative_path() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local gitroot=$(git rev-parse --show-toplevel)
    if [[ "$PWD" == "$gitroot" ]]; then
      echo "${gitroot##*/}" # Just the repo folder name
    else
      echo "${PWD#$gitroot/}" # Path relative to repo root
    fi
  else
    echo "%~" # fallback to home-relative path
  fi
}

# Get current branch name
get_git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Build the prompt
PROMPT='%F{cyan}$(get_git_relative_path)%f on %F{yellow}$(get_git_branch)%f'$'\n''%F{green}❯%f '
