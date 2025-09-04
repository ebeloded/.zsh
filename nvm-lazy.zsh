#!/bin/zsh
# Lazy-load NVM to improve shell startup time
# Only loads NVM when node, npm, npx, or nvm commands are first used

# Store NVM directory
export NVM_DIR="$HOME/.nvm"

# Function to actually load NVM
__load_nvm() {
  # Remove our placeholder functions
  unset -f node npm npx nvm yarn pnpm __load_nvm
  
  # Load NVM
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  
  # Load NVM bash completion
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  
  # Auto-use .nvmrc if it exists in current directory
  if [ -f .nvmrc ]; then
    nvm use --silent
  fi
}

# Create placeholder functions that will load NVM on first use
node() {
  __load_nvm
  node "$@"
}

npm() {
  __load_nvm
  npm "$@"
}

npx() {
  __load_nvm
  npx "$@"
}

nvm() {
  __load_nvm
  nvm "$@"
}

yarn() {
  __load_nvm
  yarn "$@"
}

pnpm() {
  __load_nvm
  pnpm "$@"
}

# Optional: Add a command to force-load NVM
alias nvm-load='__load_nvm'