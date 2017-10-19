set nocompatible
if(has('nvim'))
  set runtimepath+=~/.vim/
endif
call pathogen#infect('~/.vim/bundle/{}')
autocmd!
