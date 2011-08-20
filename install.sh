#!/bin/bash

EXCLUDE=(install.sh README.markdown)

for filename in $(ls "$(dirname $0)"); do
  [[ ${EXCLUDE[@]} =~ $filename ]] && continue
  original="$(cd "$(dirname $0)" && pwd)/$filename"
  symbolic="$HOME/.$filename"
  if [ -e "$symbolic" ]; then
    if [[ $(readlink "$symbolic") != "$original" ]]; then
      echo "\"$filename\" already exists, skipping."
    fi
  else
    ln -s "$original" "$symbolic"
  fi
done

for filename in $(ls "$HOME/.localrcs"); do
  original="$HOME/.localrcs/$filename"
  symbolic="$HOME/.$(echo $filename | cut -d'.' -f 2)"
  target_host=$(echo $filename | cut -d'.' -f 1)
  if [[ "$target_host" == $(echo $(hostname) | cut -d'.' -f 1) ]]; then
    ln -s "$original" "$symbolic"
  fi
done
