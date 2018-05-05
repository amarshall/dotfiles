source ~/.zsh/config.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/completions.zsh

[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

[[ -f ~/.sh_common_local ]] && source ~/.sh_common_local
[[ -f ~/.zshrc_local ]] && source ~/.zshrc_local

true
