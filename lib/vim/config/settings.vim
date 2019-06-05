let mapleader = ","
let maplocalleader = "<"

set backspace=indent,eol,start
set cursorline
set breakindent
set hidden
set laststatus=2
set lazyredraw
set mouse=a
set nojoinspaces
set nomodeline
set nowrap
set number
set ruler
set scrolloff=3
set sidescrolloff=3
set showcmd
set showtabline=2
set splitbelow splitright
set title
set virtualedit=block
set wildignorecase
set wildmenu

" Store backup & swap files elsewhere to avoid directory pollution
set backupdir=$HOME/.config/nvim/backup,$TMPDIR/vim-backup
set directory=$HOME/.config/nvim/swap,$TMPDIR/vim-swap
set undodir=$HOME/.config/nvim/undo,$TMPDIR/vim-undo

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

augroup CursorLine
  autocmd!
  autocmd BufWinEnter,FocusGained,WinEnter * setlocal cursorline
  autocmd FocusLost,WinLeave * setlocal nocursorline
augroup END

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
