# zsh-autosuggestions
. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-z
. ~/.zsh/zsh-z/zsh-z.plugin.zsh

# zsh-syntax-highlighting
. ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NVM - Lazy loaded for better performance
source "$ZSH_DIR/nvm-lazy.zsh"

# Optional: Uncomment below to restore immediate NVM loading and auto .nvmrc switching
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local nvmrc_path
#   nvmrc_path="$(nvm_find_nvmrc)"
#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version
#     nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
#       nvm use
#     fi
#   elif [ -n "$(nvm_find_up .nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# Google Cloud SDK
if [ -f '/Users/ebeloded/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ebeloded/google-cloud-sdk/path.zsh.inc'; fi
