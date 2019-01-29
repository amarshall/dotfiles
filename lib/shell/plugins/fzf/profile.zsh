export FZF_DEFAULT_OPTS='--bind change:top --color=fg+:18,bg+:20,hl:3,hl+:94,border:19,header:15,info:19,prompt:8,spinner:24 --filepath-word'

if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --hidden --type f'
fi
