export CLICOLOR=1
export LSCOLORS=ExfxcxdxbxagadbHbHEHEH
export LS_COLORS='di=01;34;49:ln=35;49:so=32;49:pi=33;49:ex=31;49:bd=30;46:cd=30;43:su=31;01;47:sg=31;01;47:tw=01;34;01;47:ow=01;34;01;47'
export EDITOR=vim
if [ -z "$JAVA_HOME" ] && command -v /usr/libexec/java_home &> /dev/null; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi
command -v lesspipe.sh &> /dev/null && export LESSOPEN="| lesspipe.sh %s"
[[ -z "$LANG" ]] && export LANG=en_US.UTF-8
export LESS="-i -M -S -R"
export PAGER="$(command -vp less)"
export VISUAL=vim

# ANSI color constants
export         COLOR_NONE='\033[0m'
export        COLOR_WHITE='\033[1;37m'
export        COLOR_BLACK='\033[0;30m'
export         COLOR_BLUE='\033[0;34m'
export   COLOR_LIGHT_BLUE='\033[1;34m'
export        COLOR_GREEN='\033[0;32m'
export  COLOR_LIGHT_GREEN='\033[1;32m'
export         COLOR_CYAN='\033[0;36m'
export   COLOR_LIGHT_CYAN='\033[1;36m'
export          COLOR_RED='\033[0;31m'
export    COLOR_LIGHT_RED='\033[1;31m'
export       COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export        COLOR_BROWN='\033[0;33m'
export       COLOR_YELLOW='\033[1;33m'
export         COLOR_GRAY='\033[1;30m'
export   COLOR_LIGHT_GRAY='\033[0;37m'

if command -v brew &>/dev/null; then
  export HOMEBREW_CASK_OPTS='--appdir=/Applications'
fi

type fd &> /dev/null && export FZF_DEFAULT_COMMAND='fd --type f'
