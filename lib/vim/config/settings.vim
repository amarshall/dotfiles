let mapleader = ","
let maplocalleader = "<"

set backspace=indent,eol,start
set nocursorline
set breakindent
set hidden
set laststatus=2
set lazyredraw
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
set wildmenu

" Store backup & swap files elsewhere to avoid directory pollution
set backupdir=~/.vim/undo,$TMPDIR,/tmp
set directory=~/.vim/undo,$TMPDIR,/tmp

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
set list listchars=extends:…,tab:»\ ,trail:·
filetype plugin indent on

" Persistent undo
if(has("persistent_undo"))
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000
endif

if $TERM == 'screen-256color'
  set t_RV=[>c
endif

if exists('$BASE16_THEME') && (!exists('g:colors_name') || g:colors_name != 'base16-' . $BASE16_THEME)
  let base16colorspace=256
  execute 'colorscheme base16-' . $BASE16_THEME
elseif filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Highlight if there is color
if(&t_Co > 2 || has("gui_running"))
  syntax on
endif

" Don't store global state in sessions
set sessionoptions-=options