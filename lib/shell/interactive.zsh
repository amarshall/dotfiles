source ~/.config/dotfiles/shell/lib/aliases.zsh

for dir in ~/.config/dotfiles/shell/plugins/*; do
  if [[ -f "$dir/interactive.zsh" ]]; then
    source "$dir/interactive.zsh"
  fi
done
