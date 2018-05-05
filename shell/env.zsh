for dir in ~/.shell/plugins/*; do
  if [[ -f "$dir/env.zsh" ]]; then
    source "$dir/env.zsh"
  fi
done
