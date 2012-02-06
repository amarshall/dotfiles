. ~/.sh_common/pre_config
. ~/.bash/paths
. ~/.bash/constants
. ~/.bash/aliases
for f in ~/.sh_common/functions/*; do . $f; done

if [[ $- == *i* ]] ; then
  . ~/.bash/config
  . ~/.bash/completions
fi

[ -f ~/.sh_common_local ] && . ~/.sh_common_local
[ -f ~/.bashrc_local ] && . ~/.bashrc_local
