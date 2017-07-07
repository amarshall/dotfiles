source ~/.sh_common/pre_config.bash
source ~/.bash/paths.bash
source ~/.bash/constants.bash
source ~/.bash/aliases.bash
for f in ~/.sh_common/functions/*; do . $f; done

if [[ $- == *i* ]] ; then
  source ~/.bash/config.bash
  source ~/.bash/completions.bash
fi

[ -f ~/.sh_common_local ] && source ~/.sh_common_local
[ -f ~/.bashrc_local ] && source ~/.bashrc_local
