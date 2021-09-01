if [[ "$(uname)" == Darwin ]] && [ -x /usr/libexec/path_helper ]; then
  eval "$(/usr/libexec/path_helper -s)"
fi

for dir in ~/.config/dotfiles/shell/plugins/*; do
  if [[ -f "$dir/env.zsh" ]]; then
    source "$dir/env.zsh"
  fi
done
