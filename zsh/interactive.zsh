source ~/.shell/interactive.zsh
source ~/.zsh/lib/aliases.zsh
source ~/.zsh/lib/config.zsh
source ~/.zsh/lib/completions.zsh

for dir in ~/.zsh/plugins/*; do
  if [[ -f "$dir/interactive.zsh" ]]; then
    source "$dir/interactive.zsh"
  fi
done

source ~/.zsh/lib/prompt.zsh
