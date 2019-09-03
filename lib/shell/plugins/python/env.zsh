if [ -d "$HOME"/Library/Python ]; then
  find "$HOME"/Library/Python -mindepth 2 -maxdepth 2 -type d -name bin -print0 |
    while IFS= read -r -d '' dir; do
      export PATH="$PATH:$dir"
    done
fi
