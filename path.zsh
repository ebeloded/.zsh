# ~/.zsh/path.zsh
# PATH management using array-based approach for better organization and performance

# Initialize path_dirs array with directories to be added to PATH
# Order from highest to lowest precedence (first entry takes highest precedence)
typeset -U path_dirs
path_dirs=(
  # Home bin directories
  "$HOME/bin"
  "$HOME/.local/bin"

  # Package managers
  "$HOME/Library/pnpm" # PNPM_HOME
  "$HOME/.bun/bin"     # BUN_INSTALL/bin
  "$HOME/.npm-global/bin"

  # Development tools
  "$HOME/.console-ninja/.bin"
  "$HOME/.codeium/windsurf/bin"

  # Languages and frameworks
  "$HOME/.modular/pkg/packages.modular.com_mojo/bin"
  "$HOME/miniconda3/bin"

  # System paths
  "/bin"
)

# Export package manager home directories
export PNPM_HOME="$HOME/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"

# Add all directories to PATH
for dir in $path_dirs; do
  if [[ -d "$dir" ]]; then
    path=("$dir" $path)
  fi
done

# Export the modified PATH
export PATH
