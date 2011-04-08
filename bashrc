source ~/.bash/constants
source ~/.bash/paths
source ~/.bash/aliases

if $IS_INTERACTIVE ; then
  source ~/.bash/config
  source ~/.bash/completions
fi

# use .bashrc_local for settings specific to one system
if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi
