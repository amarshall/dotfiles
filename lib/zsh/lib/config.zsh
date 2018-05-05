HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
WORDCHARS=${WORDCHARS//[\/_-]}
REPORTTIME=10 # Print elapsed time when more than 10 seconds

setopt AUTO_CD
setopt AUTO_PUSHD
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt EXTENDED_HISTORY # Add timestamps to history
setopt EXTENDEDGLOB
setopt HASH_LIST_ALL
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt IGNORE_EOF
setopt INC_APPEND_HISTORY
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt NO_BG_NICE
setopt NO_HUP
setopt NOTIFY
setopt PRINT_EXIT_VALUE
setopt PROMPT_SUBST
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt RM_STAR_WAIT

autoload -U edit-command-line
zle -N edit-command-line
zle -N newtab

run-last-command() { zle up-history; zle accept-line }
foreground-current-job() { fg }
zle -N run-last-command
zle -N foreground-current-job

bindkey -e
bindkey '\e[3~' delete-char
bindkey '^b' backward-word
bindkey '^f' forward-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^r' history-incremental-search-backward
bindkey '^x^e' edit-command-line
bindkey '^p' run-last-command
bindkey '^z' foreground-current-job
