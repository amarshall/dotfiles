export SH_USERNAME=amarshall
source ~/.config/dotfiles/lib/shell/env.zsh

fpath=(~/.config/dotfiles/lib/zsh/functions /usr/local/share/zsh-completions $fpath)
autoload -U ~/.config/dotfiles/lib/zsh/functions/*(:t)

for dir in ~/.config/dotfiles/lib/zsh/plugins/*; do
  if [[ -f "$dir/env.zsh" ]]; then
    source "$dir/env.zsh"
  fi
done
