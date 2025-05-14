# ~/.zsh/aliases.zsh
# Shell aliases

# Add your aliases below

# Python
alias pip="pip3"
alias python="python3"

# PNPM
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

# Git
alias git=hub
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"
alias glo="git log --oneline"
alias grb="git rebase"
alias gst="git stash"
alias gstp="git stash pop"

# Infrastructure
alias tf=terraform

# Navigation
alias c="z -c"

# Bun
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
alias bad="bun add -d"
alias bag="bun add -g"
alias bit="bun init"
alias bity="bun init -y"

# Tools
alias pf=promptfoo
alias td="turbo dev"
alias tb="turbo build"
alias ws="windsurf"
