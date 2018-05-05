autoload -Uz compinit
compinit

# Matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

function verbose_completion() {
  zstyle ':completion:*' verbose yes
  zstyle ':completion:*:descriptions' format '%B%d%b'
  zstyle ':completion:*:messages' format '%d'
  zstyle ':completion:*:warnings' format 'No matches for: %d'
  zstyle ':completion:*' group-name ''
}

# For Ubuntu. Requires the "command-not-found" package be installed.
[[ -f /etc/zsh_command_not_found ]] &&  . /etc/zsh_command_not_found
