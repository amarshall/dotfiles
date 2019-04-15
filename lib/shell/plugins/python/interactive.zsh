if command -v pyenv &> /dev/null; then
  eval "$(pyenv init -)"
fi

pipenv() {
  if command -v pipenv &> /dev/null; then
    if [[ -e Pipfile ]]; then
      command pipenv "$@"
    else
      echo "No Pipfile present, aborting." >&2
      return 1
    fi
  else
    command pipenv
  fi
}
