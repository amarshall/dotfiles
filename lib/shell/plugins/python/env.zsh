if [[ -d "$HOME"/Library/Python ]]; then
  for dir in "$HOME"/Library/Python/*/bin; do
    if [[ -d "$dir" ]]; then
      export PATH="$PATH:$dir"
    fi
  done 2>/dev/null
fi
