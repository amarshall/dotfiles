" Use Vim settings, rather then Vi settings
" This must be first, because it changes other options as a side effect
set nocompatible

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set backspace=indent,eol,start  " Backspace over everything
set laststatus=2  " Always display the status line
set nowrap   " Don't wrap lines by default
set number   " Display line numbers
set ruler    " Show the cursor position all the time
set scrolloff=3  " Start scrolling when 3 lines remain
set showcmd  " Display incomplete commands
set showmatch  " Highlight matching brackets
set splitbelow splitright  " Add new windows towards the right and bottom.
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P  " Git branch in status line

" Soft tabs, 2 spaces
set expandtab
set shiftwidth=2
set smarttab
set tabstop=2

" Display extra whitespace
set list listchars=tab:»·,trail:·

" GUI settings
if has("gui")
  set background=dark
  colorscheme solarized
  set cursorline  " Highlight current row
  set guifont=Monaco:h10
  set guioptions-=T  " No toolbar

  " Write all writeable buffers when changing buffers or losing focus.
  autocmd FocusLost * silent! wall
  set autowriteall
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

let mapleader = ","

" Prev/next in quickfix file listing (e.g. search results)
map <M-D-Down> :cn<CR>
map <M-D-Up> :cp<CR>

" Opt-cmd-arrows [next & previous open files]
map <M-D-Left> :bp<CR>
map <M-D-Right> :bn<CR>

" Split screen vertically and move between screens.
map <leader>v :vsp<CR>
map <leader>w ^Ww
map <leader>= ^W=

" Move between horizontally split screens.
map <leader>j ^Wj
map <leader>k ^Wk

" Indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" In insert mode, use Cmd-<CR> to jump to a new line in insert mode
imap <D-CR> <ESC>o

" File tree browser - backslash
map \ :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>

" Copy current file path to system pasteboard.
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>

" Comment/uncomment lines.
map <leader>/ <plug>NERDCommenterToggle
map <D-/> <plug>NERDCommenterToggle
imap <D-/> <ESC><plug>NERDCommenterToggle i

" Command-T
let g:CommandTMaxHeight=20
map <D-N> :CommandTFlush<CR>:CommandT<CR>
imap <D-N> <ESC>:CommandTFlush<CR>:CommandT<CR>
map <leader>t :CommandT<CR>
map <leader>B :CommandTBuffer<CR>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Strip trailing whitespace on save for code files
  autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp :%s/\s\+$//e
  autocmd BufWritePre *.rb,*.yml,*.js,*.json,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml :%s/\s\+$//e
  autocmd BufWritePre *.java,*.php,*.feature :%s/\s\+$//e

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt set filetype=text

  " Highlight JSON files as javascript
  autocmd BufRead,BufNewFile *.json set filetype=javascript

  " Highlight jasmine_fixture files as HTML
  autocmd BufRead,BufNewFile *.jasmine_fixture set filetype=html

  " Highlight some other filetypes as Ruby
  au BufRead,BufNewFile *.thor set filetype=ruby
  au BufRead,BufNewFile *.god set filetype=ruby
  au BufRead,BufNewFile Gemfile* set filetype=ruby
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
  au BufRead,BufNewFile soloistrc set filetype=ruby

  " Set question mark to be part of a VIM word in Ruby
  autocmd FileType ruby set iskeyword=@,48-57,_,?,!,192-255
  autocmd FileType scss set iskeyword=@,48-57,_,-,?,!,192-255

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
