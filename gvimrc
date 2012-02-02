colorscheme solarized
set background=dark
set guifont=Menlo:h12,"Deja Vu Sans":h12,Consolas:h12
set linespace=2

set cursorline
set guioptions-=rL " No scrollbars
set guioptions-=T  " No toolbar

if(has("macunix"))
  " Prev/next in quickfix file listing (e.g. search results)
  map <M-D-Down> :cn<CR>
  map <M-D-Up> :cp<CR>

  " Opt-cmd-arrows [next & previous open files]
  map <M-D-Left> :bp<CR>
  map <M-D-Right> :bn<CR>

  " In insert mode, use Cmd-<CR> to jump to a new line in insert mode
  imap <D-CR> <ESC>o

  " NERDCommenter
  map <D-/> <plug>NERDCommenterToggle
  imap <D-/> <ESC><plug>NERDCommenterToggle i
else "if(has("gui_gtk") || has("win32"))
  " NERDCommenter
  map <C-/> <plug>NERDCommenterToggle
  imap <C-/> <ESC><plug>NERDCommenterToggle i
endif

if filereadable($HOME . "/.gvimrc_local")
  source ~/.gvimrc_local
endif
