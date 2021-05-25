if [[ $(id -u) != 0 ]]; then
  alias dnf="dnf --cacheonly"
fi
