# My ZSH Configuration

A modular, organized ZSH setup with custom prompt, aliases, functions, and plugins. Optimized for fast startup (~86ms).

## Structure

- **init.zsh**: Main entry point that sources all other modules
- **prompt.zsh**: Custom prompt with git integration
- **path.zsh**: PATH variable management
- **env.zsh**: Environment variables
- **aliases.zsh**: Command shortcuts (pnpm, bun, claude, etc.)
- **functions.zsh**: Custom shell functions
- **secrets.zsh**: Private environment variables (not tracked in git)
- **completions.zsh**: Tab completion configuration
- **plugins.zsh**: External plugin configuration
- **nvm-lazy.zsh**: Lazy-loading configuration for NVM

## Installation

1. Clone this repository to `~/.zsh`
2. Add `source ~/.zsh/init.zsh` to your `~/.zshrc`

## Features

### Performance
- **~86ms startup time** with lazy-loaded NVM
- Performance measurement utilities (`measure_startup.sh`, `benchmark.sh`)
- Optimized plugin loading

### Shell Options
- `AUTO_CD`: Navigate to directories without typing `cd`

### Custom Prompt
- Shows relative path from git root
- Displays git branch when in a repository
- Clean, minimal design with color coding

### Utility Functions
- `mdcd`: Create directory and cd into it
- `killport`: Kill processes using specific ports
- `rmall`: Recursively remove specific directories
- `lall`: Find directories by name
- `groot`: Navigate to git repository root

### Aliases
- Claude CLI shortcuts (`c`, `cc`, `cr` with permission variants)
- Shortcuts for package managers (pnpm, bun)
- Development workflow helpers
- Git and terraform shortcuts

### Plugins
- zsh-autosuggestions
- zsh-z for directory jumping (aliased as `zc`)
- zsh-syntax-highlighting
- NVM with lazy loading (loads on first use of node/npm/nvm)

## Setup Notes

This configuration loads modules in a specific order through `init.zsh` to ensure proper functionality:

1. path.zsh
2. env.zsh
3. prompt.zsh
4. aliases.zsh
5. functions.zsh
6. secrets.zsh
7. completions.zsh
8. plugins.zsh (includes nvm-lazy.zsh)

### Performance Tips

- NVM is lazy-loaded to reduce startup time from ~1100ms to ~86ms
- Use `nvm-load` alias to force-load NVM if needed
- Run `measure_startup.sh` to profile your shell startup
- Run `benchmark.sh` for a quick startup time check