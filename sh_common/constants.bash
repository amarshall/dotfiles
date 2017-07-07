export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vim
if [ -z $JAVA_HOME ] && /usr/libexec/java_home &> /dev/null; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
which lesspipe.sh &> /dev/null && export LESSOPEN="| lesspipe.sh %s"
[[ -z "$LANG" ]] && export LANG=en_US.UTF-8
export LESS="-i -M -S -R"
export PAGER="$(which less)"
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

if type brew &>/dev/null; then
  export HOMEBREW_CASK_OPTS='--appdir=/Applications'
fi

BASE16_SHELL=$HOME/.sh_common/vendor/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
