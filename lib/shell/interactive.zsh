source ~/.config/dotfiles/lib/shell/lib/aliases.zsh

for dir in ~/.config/dotfiles/lib/shell/plugins/*; do
  if [[ -f "$dir/interactive.zsh" ]]; then
    source "$dir/interactive.zsh"
  fi
done
