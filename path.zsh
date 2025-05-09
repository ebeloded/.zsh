# ~/.zsh/path.zsh
# PATH management

# Add paths from most to least important (first entry takes precedence)

# Home bin directory
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Package managers
export PNPM_HOME="/Users/ebeloded/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Development tools
export PATH="~/.console-ninja/.bin:$PATH"
export PATH="/Users/ebeloded/.codeium/windsurf/bin:$PATH"

# Languages and frameworks
export MODULAR_HOME="/Users/ebeloded/.modular"
export PATH="/Users/ebeloded/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export PATH="/Users/ebeloded/miniconda3/bin:$PATH"

# System paths
export PATH="/bin:$PATH"