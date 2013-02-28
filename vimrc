" NOTICE! The vimpagerrc file is a subset of this, please check that
"         what is being changed here is updated there if it exists.

set nocompatible

call pathogen#infect()

autocmd!

let mapleader = ","
let maplocalleader = "<"

set backspace=indent,eol,start
set cursorline
set hidden
set laststatus=2
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

" Copy current file path to system pasteboard.
map <silent> <leader>cp :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>

" Toggle spell check
map <leader>ss :setlocal spell!<cr>

" Gracefully handle holding shift too long after : for common commands
cabbrev Q q
cabbrev Qa qa
cabbrev Tabe tabe
cabbrev Tabn tabn
cabbrev W w
cabbrev Wa wa
cabbrev Wq wq

" Make Y consistent with D and C.
map Y y$

" Indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" CtrlP
let g:ctrlp_max_height=20
let g:ctrlp_match_window_reversed=0
let g:ctrlp_use_caching=0
map <C-P>     :CtrlPMRU<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>e :e#<CR>

" Indent Guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi link IndentGuidesOdd Normal
autocmd VimEnter,Colorscheme * :hi link IndentGuidesEven CursorLine

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" NERDCommenter
let NERDSpaceDelims = 1
map <leader>/ <plug>NERDCommenterToggle

" NERDTree
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>

" Splitjoin
nmap <leader>j :SplitjoinJoin<CR>
nmap <leader>s :SplitjoinSplit<CR>

" Syntastic
let g:syntastic_enable_signs=1

" Tagbar
map <leader>l :TagbarToggle<CR>

" VimClojure
let vimclojure#DynamicHighlighting=1
let vimclojure#FuzzyIndent=1
let vimclojure#SplitPos = "right"
let vimclojure#WantNailgun = 1

" ZoomWin
map <leader>z :ZoomWin<CR>

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

if filereadable($HOME . "/.vimrc_local")
  source ~/.vimrc_local
endif
