c() {
  if [[ "$(find ~/Code/ -mindepth 2 -maxdepth 2 -wholename "$1" | wc -l)" -gt 1 ]]; then
    echo 'FATAL: multiple directories match, cannot select' >&2
    return 1
  fi
  cd ~/Code/*/$1
  if [[ -n $TMUX ]] && ( \
      [[ $(tmux display-message -p '#W') == $(basename "$SHELL") ]] \
        || (($(tmux list-panes | wc -l) == 1)) \
      ); then
    tmux rename-window "$1"
  fi
}
