source ~/.vim/config/init.vim
source ~/.vim/config/settings.vim
source ~/.vim/config/mappings.vim
source ~/.vim/config/filetypes.vim
source ~/.vim/config/plugins.vim

if filereadable($HOME . "/.vimrc_local")
  source ~/.vimrc_local
endif
