for dir in "$HOME"/Library/Python/*; do
  if [ -d "$dir/bin" ]; then
    export PATH="$PATH:$dir/bin"
  fi
done
