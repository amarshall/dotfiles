if [[ -d "/usr/share/git-core/contrib" ]]; then
  export PATH="$PATH:/usr/share/git-core/contrib"
elif [[ -d "/usr/local/share/git-core/contrib/diff-highlight" ]]; then
  export PATH="$PATH:/usr/local/share/git-core/contrib/diff-highlight"
fi
