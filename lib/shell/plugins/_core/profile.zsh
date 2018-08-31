export EDITOR="$(command -v nvim || command -v vim)"
export VISUAL="$EDITOR"
command -v fd &> /dev/null && export FZF_DEFAULT_COMMAND='fd --hidden --type f'
