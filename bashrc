source ~/.bash/paths
source ~/.bash/aliases
source ~/.bash/config
source ~/.bash/completions

# use .bashrc_local for settings specific to one system
if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi
