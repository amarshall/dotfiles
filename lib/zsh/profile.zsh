source ~/.config/dotfiles/shell/profile.zsh

for dir in ~/.config/dotfiles/zsh/plugins/*; do
  if [[ -f "$dir/profile.zsh" ]]; then
    source "$dir/profile.zsh"
  fi
done
