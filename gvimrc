set guioptions-=rL " No scrollbar GUI (use text)
set guioptions-=e  " No tab bar GUI (use text)
set guioptions-=T  " No toolbar

set guicursor+=a:blinkon0

if(has("macunix"))
  set guifont=Menlo:h14,Monaco:h14
elseif(has("unix"))
  set guifont=Deja\ Vu\ Sans\ 14
elseif(has("win32"))
  set guifont=Consolas:h14,Courier\ New:h14
endif

set linespace=2

if(has("macunix"))
  " Paste yanked text in command mode
  cnoremap <D-C> <C-R>"

  " Copy current file path to system pasteboard.
  map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>

  " Prev/next in quickfix file listing (e.g. search results)
  map <M-D-Down> :cn<CR>
  map <M-D-Up> :cp<CR>

  " Opt-cmd-arrows [next & previous open files]
  map <M-D-Left> :bp<CR>
  map <M-D-Right> :bn<CR>

  " In insert mode, use Cmd-<CR> to jump to a new line in insert mode
  imap <D-CR> <ESC>o

  " CtrlP
  map <D-N> :CtrlP<CR>
  map <D-e> :CtrlPMRU<CR>

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
