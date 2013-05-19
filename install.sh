#!/bin/bash

COLOR_NC='\033[0m'
COLOR_GREEN='\033[0;32m'
COLOR_YELLOW='\033[0;33m'

EXCLUDE=(install.sh LICENSE README.markdown)
NO_DOT=(bin)

linkfile() {
  symbolic=$1;
  original=$2;

  if [ -e "$symbolic" ]; then
    if [[ $(readlink "$symbolic") != "$original" ]]; then
      printf $COLOR_YELLOW
      printf "\"%s\" already exists, skipping.\n" $symbolic
    else
      printf $COLOR_NC
      printf "\"%s\" is already linked.\n" $symbolic
    fi
  else
    printf $COLOR_GREEN
    printf "\".%s\" linked.\n" $filename
    ln -s "$original" "$symbolic"
  fi
}

printf "Initializing and updating git submodules..."
if (cd $(dirname $0) && git submodule sync &> /dev/null && git submodule update --init &> /dev/null); then
  printf "\r$COLOR_GREEN"
  printf "Submodules successfully initialized & updated.\n"
else
  printf "\r$COLOR_YELLOW"
  printf "Submodules could not be initialized/updated.\n"
fi

for filename in $(ls "$(dirname $0)"); do
  [[ ${EXCLUDE[@]} =~ $filename ]] && continue
  original="$(cd "$(dirname $0)" && pwd)/$filename"
  if [[ ${NO_DOT[@]} =~ $filename ]]; then
    symbolic="$HOME/$filename"
  else
    symbolic="$HOME/.$filename"
  fi

  linkfile $symbolic $original
done

mkdir -p ~/.vim/tmp ~/.vim/undo

for filename in $(ls "$HOME/.localrcs"); do
  original="$HOME/.localrcs/$filename"
  symbolic="$HOME/.$(printf $filename | cut -d'.' -f 2)"
  current_host="$(printf $(hostname) | cut -d'.' -f 1 | awk '{print tolower($0)}')"
  target_host="$(printf $filename | cut -d'.' -f 1 | awk '{print tolower($0)}')"

  if [[ $target_host == $current_host ]]; then
    linkfile $symbolic $original
  fi
done

printf $COLOR_NC
