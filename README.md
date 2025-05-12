# My ZSH Configuration

A modular, organized ZSH setup with custom prompt, aliases, functions, and plugins.

## Structure

- **init.zsh**: Main entry point that sources all other modules
- **prompt.zsh**: Custom prompt with git integration
- **path.zsh**: PATH variable management
- **env.zsh**: Environment variables
- **aliases.zsh**: Command shortcuts (pnpm, bun, etc.)
- **functions.zsh**: Custom shell functions
- **secrets.zsh**: Private environment variables (not tracked in git)
- **completions.zsh**: Tab completion configuration
- **plugins.zsh**: External plugin configuration

## Installation

1. Clone this repository to `~/.zsh`
2. Add `source ~/.zsh/init.zsh` to your `~/.zshrc`

## Features

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
- Shortcuts for package managers (pnpm, bun)
- Development workflow helpers
- Git and terraform shortcuts

### Plugins
- zsh-autosuggestions
- zsh-z for directory jumping
- zsh-syntax-highlighting

## Setup Notes

This configuration loads modules in a specific order through `init.zsh` to ensure proper functionality:

1. prompt.zsh
2. path.zsh
3. env.zsh
4. aliases.zsh
5. functions.zsh
6. secrets.zsh
7. completions.zsh
8. plugins.zsh