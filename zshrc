. ~/.sh_common/pre_config
. ~/.zsh/constants
. ~/.zsh/paths
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completions

[[ -f /etc/zsh_command_not_found ]] && . /etc/zsh_command_not_found

[[ -f ~/.sh_common_local ]] && . ~/.sh_common_local
[[ -f ~/.zshrc_local ]] && . ~/.zshrc_local

true
