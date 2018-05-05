#!/bin/bash

COLOR_NONE='\033[0m'
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_YELLOW='\033[0;33m'
CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"

EXCLUDE=(install.sh LICENSE README.md)
NO_DOT=(bin)

linkfile() {
  symbolic=$1;
  original=$2;

  if [ -e "$symbolic" ]; then
    if [[ $(readlink "$symbolic") != "$original" ]]; then
      printf $COLOR_YELLOW
      printf "\"%s\" already exists, skipping.\n" $symbolic
    else
      printf $COLOR_NONE
      printf "\"%s\" is already linked.\n" $symbolic
    fi
  else
    if ln -s "$original" "$symbolic"; then
      printf $COLOR_GREEN
      printf "\".%s\" linked.\n" $symbolic
    else
      printf $COLOR_RED
      printf "\".%s\" linking failed.\n" $symbolic
    fi
  fi
}

printf "Initializing and updating git submodules..."
if (cd "$CURRENT_DIR" && git submodule sync && git submodule update --init --recursive); then
  printf "\r$COLOR_GREEN"
  printf "Submodules successfully initialized & updated.\n"
else
  printf "\r$COLOR_YELLOW"
  printf "Submodules could not be initialized/updated.\n"
fi

for filename in $(ls "$CURRENT_DIR"); do
  [[ ${EXCLUDE[@]} =~ $filename ]] && continue
  original="$CURRENT_DIR/$filename"
  if [[ ${NO_DOT[@]} =~ $filename ]]; then
    symbolic="$HOME/$filename"
  else
    symbolic="$HOME/.$filename"
  fi

  linkfile $symbolic $original
done

mkdir -p ~/.vim/tmp ~/.vim/undo
mkdir -p ~/.config/nvim
(cd ~/.config/nvim && ln -s ~/.vimrc init.vim)

for filename in $(ls "$HOME/.localrcs"); do
  original="$HOME/.localrcs/$filename"
  symbolic="$HOME/.$(printf $filename | cut -d'.' -f 2)"
  current_host="$(printf $(hostname) | cut -d'.' -f 1 | awk '{print tolower($0)}')"
  target_host="$(printf $filename | cut -d'.' -f 1 | awk '{print tolower($0)}')"

  if [[ $target_host == $current_host ]]; then
    linkfile $symbolic $original
  fi
done

if grep Darwin <(uname) &> /dev/null; then
  if ! which brew &> /dev/null ; then
    printf "\r$COLOR_YELLOW"
    printf 'Homebrew is not installed or is not in the $PATH'
    printf "\n"
  elif ! grep "$(brew --prefix)/bin" <(echo $PATH) &> /dev/null; then
    printf "\r$COLOR_YELLOW"
    printf 'Homebrew prefix is not in $PATH'
    printf "\n"
  elif egrep "(\A|:)(/usr/bin|/bin):(.*:)?$(brew --prefix)/bin" <(echo $PATH) &> /dev/null; then
    printf "\r$COLOR_YELLOW"
    printf 'Homebrew prefix is not before /usr/bin or /bin in $PATH'
    printf "\n"
  fi
fi

if ! [[ -e "$CURRENT_DIR/vim/bundle/command-t/ruby/command-t/ext/command-t/ext.bundle" ]]; then
  (cd "$CURRENT_DIR/vim/bundle/command-t/ruby/command-t/ext/command-t" && ruby extconf.rb && make)
fi

printf $COLOR_NONE
