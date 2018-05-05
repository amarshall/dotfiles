export SH_USERNAME=amarshall
source ~/.shell/env.zsh

fpath=(~/.zsh/functions /usr/local/share/zsh-completions $fpath)
autoload -U ~/.zsh/functions/*(:t)

for dir in ~/.zsh/plugins/*; do
  if [[ -f "$dir/env.zsh" ]]; then
    source "$dir/env.zsh"
  fi
done
