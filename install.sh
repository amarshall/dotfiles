#!/bin/bash

EXCLUDE=(install.sh README.markdown)

for filename in $(ls); do
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
