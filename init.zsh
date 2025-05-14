#!/bin/zsh
# ~/.zsh/init.zsh
# Main entry point for ZSH configuration
# This file sources all other modules in the correct order

# Uncomment to measure ZSH startup time
# zmodload zsh/zprof

# Base directory for all ZSH configuration files
ZSH_DIR="$HOME/.zsh"

# Function to safely source files
source_file() {
  local file="$1"
  if [[ -f "$file" ]]; then
    source "$file"
  else
    echo "Warning: Could not source $file (file not found)"
  fi
}

# Load modules in specific order for proper functionality
# 1. Path configuration (should be loaded early)
source_file "$ZSH_DIR/path.zsh"

# 2. Environment variables
source_file "$ZSH_DIR/env.zsh"

# 3. Prompt configuration
source_file "$ZSH_DIR/prompt.zsh"

# 4. Aliases
source_file "$ZSH_DIR/aliases.zsh"

# 5. Custom functions
source_file "$ZSH_DIR/functions.zsh"

# 6. Private environment variables (not tracked in git)
source_file "$ZSH_DIR/secrets.zsh"

# 7. Completions (should be loaded before plugins)
source_file "$ZSH_DIR/completions.zsh"

# 8. Plugins (loaded last to avoid conflicts)
source_file "$ZSH_DIR/plugins.zsh"

# Uncomment to display ZSH startup time report
# zprof
