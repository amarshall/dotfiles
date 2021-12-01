func s:fallback(value, fallback)
  if empty(a:value)
    return a:fallback
  else
    return a:value
  endif
endfunc

func s:xdg_path(name, child)
  if a:name ==# "cache"
    let l:path = s:fallback($XDG_CACHE_HOME, $HOME . "/.cache/vim")
  elseif a:name ==# "data"
    let l:path = s:fallback($XDG_DATA_HOME, $HOME . "/.local/share/vim")
  else
    throw "unknown XDG type"
  endif
  let l:path = l:path . a:child
  call mkdir(l:path, "p", 0700)
  return l:path
endfunc

let mapleader = "\<Space>"
let maplocalleader = ","

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
set timeoutlen=500
set title
set virtualedit=block
set wildignorecase
set wildmenu

" Store backup & swap files elsewhere to avoid directory pollution
execute "set backupdir=" . fnameescape(s:xdg_path("cache", "/backup"))
execute "set directory=" . fnameescape(s:xdg_path("cache", "/swap"))
execute "set undodir=" . fnameescape(s:xdg_path("data", "/undo"))

" Search settings
set ignorecase
set incsearch
set smartcase
set hlsearch

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
  set undofile
  set undolevels=1000
endif

augroup CursorLine
  autocmd!
  autocmd ColorScheme * hi CursorLineNr cterm=NONE
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
