# ~/.zsh/aliases.zsh
# Shell aliases organized by category

# ===== File System Navigation & Operations =====

# Navigation
alias zc="z -c"           # Smart directory jumping with z
alias ..="cd .."         # Go up one directory
alias ...="cd ../.."     # Go up two directories
alias ....="cd ../../.." # Go up three directories
alias -- -="cd -"        # Go to previous directory

# Listing files
alias ls="ls -G"      # Colorized ls output
alias ll="ls -lh"     # Long format, human-readable sizes
alias la="ls -lah"    # Long format, including hidden files
alias lt="ls -lhtr"   # Sort by time, newest last
alias lsd="ls -ld */" # List only directories

# File operations
alias cp="cp -iv"       # Interactive and verbose copy
alias mv="mv -iv"       # Interactive and verbose move
alias rm="rm -iv"       # Interactive and verbose remove
alias mkdir="mkdir -pv" # Create parent directories as needed, verbose

# ===== Development Tools =====

# Python
alias pip="pip3"
alias python="python3"
alias py="python3"
alias pyenv="python -m venv venv && source venv/bin/activate" # Create and activate virtual environment

# PNPM - Package manager
alias p="pnpm"
alias px="pnpx"
alias pa="pnpm add"
alias pad="pnpm add --save-dev"
alias pap="pnpm add --save-peer"
alias pga="pnpm add --global"
alias pgrm="pnpm remove --global"
alias pu="pnpm upgrade"
alias pui="pnpm upgrade --interactive"
alias puli="pnpm upgrade --latest --interactive"
alias pul="pnpm upgrade --latest"
alias prm="pnpm remove"
alias pout="pnpm outdated"
alias pls="pnpm list"
alias pi="pnpm install"
alias pr="pnpm run"
alias pt="pnpm run test"
alias pb="pnpm run build"
alias pbw="pnpm run build:watch"
alias pp="pnpm run package --"
alias pd="pnpm run dev --"
alias pub="pnpm publish"
alias pv="pnpm version"

# Bun - JavaScript runtime & package manager
alias b="bun"
alias bx="bunx"
alias bd="bun run dev"
alias bb="bun run build"
alias bi="bun install"
alias ba="bun add"
alias br="bun run"
alias brt="bun run test"
alias brm="bun remove"
alias brmg="bun remove -g"
alias bup="bun update"
alias bug="bun update -g"
alias bugl="bun update -g --latest"
alias bad="bun add -d"
alias bag="bun add -g"
alias bit="bun init"
alias bity="bun init -y"

# Turbo - Monorepo tool
alias td="turbo dev"
alias tb="turbo build"

# Other tools
alias pf="promptfoo"
alias ws="windsurf"

# Claude CLI
alias claude="~/.claude/local/claude"
alias c="claude"
alias cc="claude -c"
alias cr="claude -r"
alias cy="claude --permission-mode bypassPermissions"
alias ccy="claude -c --permission-mode bypassPermissions"
alias cry="claude -r --permission-mode bypassPermissions"
alias ca="cursor-agent"
alias cur="cursor"

# ===== Git & Version Control =====

# Git with hub extension
alias git="hub"
alias gs="git status -sb" # Short status with branch info
alias ga="git add"
alias gaa="git add --all" # Add all changes
alias gc="git commit -m"
alias gca="git commit --amend" # Amend previous commit
alias gp="git push"
alias gpf="git push --force-with-lease" # Safer force push
alias gl="git pull"
alias gf="git fetch --all" # Fetch all remotes
alias gfom="git fetch origin main:main" # Fetch origin main to local main
alias gd="git diff"
alias gds="git diff --staged" # Diff staged changes
alias gb="git branch"
alias gbd="git branch -d" # Delete branch
alias gco="git checkout"
alias gcb="git checkout -b"                      # Create and checkout new branch
alias glo="git log --oneline --graph --decorate" # Pretty log
alias grb="git rebase"
alias gst="git stash"
alias gstp="git stash pop"
alias gsta="git stash apply"     # Apply stash without removing it
alias gsl="git stash list"       # List stashes
alias grh="git reset HEAD~"      # Undo last commit, keep changes
alias grs="git restore --staged" # Unstage changes

# Git worktree
alias gw="git worktree"          # Git worktree command
alias gwa="git worktree add"     # Add new worktree
alias gwl="git worktree list"    # List all worktrees
alias gwr="git worktree remove"  # Remove worktree
alias gwp="git worktree prune"   # Prune worktree references
alias gwrf="git worktree remove --force" # Force remove worktree

# ===== System & Infrastructure =====

# Infrastructure
alias tf="terraform"
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"

# System
alias dud="du -d 1 -h"          # Disk usage by directory, human readable
alias duf="du -sh *"            # Disk usage by file, human readable
alias fd="find . -type d -name" # Find directories
alias ff="find . -type f -name" # Find files

# Process management
alias psa="ps aux"        # List all processes
alias psg="ps aux | grep" # Search processes

# Network
alias myip="curl -s https://api.ipify.org" # Get public IP
alias localip="ipconfig getifaddr en0"     # Get local IP
alias ports="lsof -i -P -n | grep LISTEN"  # Show listening ports
