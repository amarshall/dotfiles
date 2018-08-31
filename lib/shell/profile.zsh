for dir in ~/.config/dotfiles/shell/plugins/*; do
  if [[ -f "$dir/profile.zsh" ]]; then
    source "$dir/profile.zsh"
  fi
done
