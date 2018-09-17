BASE16_SHELL="$HOME/.config/dotfiles/shell/vendor/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL"/profile_helper.sh)"

if [[ "$BASE16_THEME" == base16-* ]]; then
  export BASE16_THEME="$(echo "$BASE16_THEME" | perl -pe 's/^(base16-)+//')"
fi

if [[ -z "$SSH_CONNECTION" && $SHLVL = 1 ]]; then
  base16_solarized-dark
fi
