if type -P brew &>/dev/null && test -f $(brew --prefix)/etc/bash_completion ; then
  source $(brew --prefix)/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

complete -C ~/.bash/completion_scripts/rake_completion.rb -o default rake
