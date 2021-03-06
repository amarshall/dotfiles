if [[ "$(uname)" == Darwin ]] && [[ -x /usr/libexec/path_helper ]]; then
  eval "$(/usr/libexec/path_helper)"
fi

source ~/.config/dotfiles/shell/env.zsh

fpath=(~/.config/dotfiles/zsh/functions /usr/local/share/zsh-completions $fpath)
autoload -U ~/.config/dotfiles/zsh/functions/*(:t)

for dir in ~/.config/dotfiles/zsh/plugins/*; do
  if [[ -f "$dir/env.zsh" ]]; then
    source "$dir/env.zsh"
  fi
done
