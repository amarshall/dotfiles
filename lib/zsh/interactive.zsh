source ~/.config/dotfiles/lib/shell/interactive.zsh
source ~/.config/dotfiles/lib/zsh/lib/aliases.zsh
source ~/.config/dotfiles/lib/zsh/lib/config.zsh
source ~/.config/dotfiles/lib/zsh/lib/completions.zsh

for dir in ~/.config/dotfiles/lib/zsh/plugins/*; do
  if [[ -f "$dir/interactive.zsh" ]]; then
    source "$dir/interactive.zsh"
  fi
done

source ~/.config/dotfiles/lib/zsh/lib/prompt.zsh
