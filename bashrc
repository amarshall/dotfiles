. ~/.bash/constants
. ~/.bash/paths
. ~/.bash/aliases

if $IS_INTERACTIVE ; then
  . ~/.bash/config
  . ~/.bash/completions
fi

# Use .bashrc_local for settings specific to one system
[ -f ~/.bashrc_local ] && . ~/.bashrc_local
