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

# Get branch, dirty state, and ahead/behind in a single git call
get_git_info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local status_output
  status_output=$(git status --porcelain=v2 --branch 2>/dev/null)

  local branch
  branch=$(awk '/^# branch.head/ {print $3}' <<< "$status_output")
  [[ "$branch" == "(detached)" ]] && branch=$(git rev-parse --short HEAD 2>/dev/null)

  local dirty=""
  grep -q "^[^#]" <<< "$status_output" && dirty="%F{red}*%f"

  local ahead=0 behind=0
  local ab_line
  ab_line=$(awk '/^# branch.ab/ {print $3, $4}' <<< "$status_output")
  if [[ -n "$ab_line" ]]; then
    ahead=${${ab_line%% *}#+}
    behind=${${ab_line##* }#-}
  fi

  local result=" on %F{yellow}${branch}%f${dirty}"
  (( ahead > 0 )) && result+=" %F{cyan}↑${ahead}%f"
  (( behind > 0 )) && result+=" %F{red}↓${behind}%f"

  echo "$result"
}

get_ssh_info() {
  if [[ -n $SSH_CONNECTION ]]; then
    local host=${HOST:-$(hostname)}
    echo " via %F{magenta}${USER}@${host%%.*}%f"
  fi
}

# Build the prompt
PROMPT='%F{cyan}$(get_git_relative_path)%f$(get_git_info)$(get_ssh_info)'$'\n''%F{green}❯%f '
