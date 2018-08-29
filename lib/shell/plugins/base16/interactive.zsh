BASE16_SHELL="$HOME/.config/dotfiles/shell/vendor/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL"/profile_helper.sh)"
if [[ -z "$SSH_CONNECTION" ]]; then
  base16_solarized-dark
fi
