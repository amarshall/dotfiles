c() {
  if [[ "$(stat ~/Code/*/$1 | wc -l)" -gt 1 ]]; then
    echo 'FATAL: multiple directories match, cannot select' >&2
    return 1
  fi
  cd ~/Code/*/$1
}
