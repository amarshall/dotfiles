source ~/.config/dotfiles/shell/interactive.zsh
source ~/.config/dotfiles/zsh/lib/aliases.zsh
source ~/.config/dotfiles/zsh/lib/config.zsh
source ~/.config/dotfiles/zsh/lib/completions.zsh

for dir in ~/.config/dotfiles/zsh/plugins/*; do
  if [[ -f "$dir/interactive.zsh" ]]; then
    source "$dir/interactive.zsh"
  fi
done

source ~/.config/dotfiles/zsh/lib/prompt.zsh
