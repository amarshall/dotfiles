set nocompatible

call pathogen#infect()

autocmd!

let mapleader = ","
let maplocalleader = "<"

set backspace=indent,eol,start
set cursorline
set hidden
set laststatus=2
set mouse=a
set nojoinspaces
set nowrap
set number
set ruler
set scrolloff=3
set sidescrolloff=3
set showcmd
set splitbelow splitright
set title
set wildignore+=*.class,*.o,.DS_Store
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/**,*/build/*,*/*.dSYM/*,*/.sass-cache/*
set wildmenu

" Store backup & swap files elsewhere to avoid directory pollution
set backupdir=~/.vim/tmp,/tmp
set directory=~/.vim/tmp,/tmp

" Search settings
set ignorecase
set incsearch
set smartcase
set hlsearch
nnoremap <silent> <leader>H :set hlsearch!<CR>
nnoremap <silent> <leader>h :nohlsearch<CR>

" Indentation settings (soft tabs, two spaces)
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set tabstop=2
set list listchars=extends:…,tab:»·,trail:·
filetype plugin indent on

" Persistent undo
if(has("persistent_undo"))
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000
endif

if has('gui_running') || $TERM_PROGRAM != 'Apple_Terminal'
  set background=dark
  colorscheme solarized
endif

if $TERM_PROGRAM == 'Apple_Terminal'
  set nocursorline
end

" Highlight if there is color
if(&t_Co > 2 || has("gui_running"))
  syntax on
endif

" Don't store global state in sessions
set sessionoptions-=options

" Delete trailing whitespace
func! DeleteTrailingWhitespace()
  exec "normal mZ"
  %s/\s\+$//e
  exec "normal `Z"
endfunc
autocmd BufWritePre *.{c,cpp,h,hpp,m,mm} :call DeleteTrailingWhitespace()
autocmd BufWritePre *.{erb,feature,haml,rb,yml} :call DeleteTrailingWhitespace()
autocmd BufWritePre *.{css,html,js,json,less,scss,xml} :call DeleteTrailingWhitespace()
autocmd BufWritePre *.{java,php} :call DeleteTrailingWhitespace()

" Associate some filetypes with their proper syntax
autocmd BufRead,BufNewFile *.applescript set filetype=applescript
autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd BufRead,BufNewFile *.prawn set filetype=ruby
autocmd BufRead,BufNewFile *.txt set filetype=text

autocmd FileType mail set textwidth=0
autocmd FileType mail set wrapmargin=0

autocmd FileType gitcommit,mail,markdown,text set spell

autocmd FileType scss set iskeyword=@,48-57,_,-,?,!,192-255

" Enable soft-wrapping for text files
autocmd FileType eruby,html,markdown,text,xhtml setlocal wrap linebreak nolist

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim), or when inside a git commit
autocmd BufReadPost *
  \ if &filetype != "gitcommit" && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
