autoload -Uz compinit
compinit

# Matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# For Ubuntu. Requires the "command_not_found" package be installed.
[[ -d /etc/zsh_command_not_found ]] &&  . /etc/zsh_command_not_found
