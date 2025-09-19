# CUSTOM PROMPT
setopt prompt_subst # Enable command substitution in prompt

# Show git repo name and relative path from git root
get_git_relative_path() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local gitroot=$(git rev-parse --show-toplevel)
    local reponame="${gitroot##*/}"

    if [[ "$PWD" == "$gitroot" ]]; then
      echo "$reponame" # Just the repo folder name
    else
      echo "$reponame/${PWD#$gitroot/}" # Repo name and path relative to repo root
    fi
  else
    echo "%~" # fallback to home-relative path
  fi
}

# Get current branch name
get_git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

get_ssh_info() {
  if [[ -n $SSH_CONNECTION ]]; then
    local host=${HOST:-$(hostname)}
    echo " via %F{magenta}${USER}@${host%%.*}%f"
  fi
}

# Build the prompt
PROMPT='%F{cyan}$(get_git_relative_path)%f$(git rev-parse --is-inside-work-tree &>/dev/null && echo " on %F{yellow}$(get_git_branch)%f")$(get_ssh_info)'$'\n''%F{green}❯%f '
