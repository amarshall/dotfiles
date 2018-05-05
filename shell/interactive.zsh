source ~/.shell/lib/aliases.zsh

for dir in ~/.shell/plugins/*; do
  if [[ -f "$dir/interactive.zsh" ]]; then
    source "$dir/interactive.zsh"
  fi
done
