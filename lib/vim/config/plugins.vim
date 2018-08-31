" Abolish
cabbrev S Subvert
cabbrev %S %Subvert

" Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Blockle
let g:blockle_mapping = '<leader>rb'

" Easytags
set tags=./tags
let g:easytags_auto_highlight = 0
let g:easytags_async = 1
let g:easytags_dynamic_files = 1

" Indent Guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi link IndentGuidesOdd Normal
autocmd VimEnter,Colorscheme * :hi link IndentGuidesEven CursorLine

" Indexed Search
let g:indexed_search_show_index_mappings = 0

" Intero
autocmd FileType haskell map <buffer> <silent> <leader>t <Plug>InteroGenericType

" fzf
set runtimepath+=/usr/local/opt/fzf
map <C-P> :Files<CR>

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Markdown
let g:vim_markdown_folding_disabled=1

" NERDCommenter
let NERDSpaceDelims = 1
map <leader>/ <plug>NERDCommenterToggle

" NERDTree
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1

" Rust syntax
let g:rust_recommended_style=0

" Splitjoin
nmap <leader>j :SplitjoinJoin<CR>
nmap <leader>s :SplitjoinSplit<CR>

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_javascript_jshint_args = '--config '.expand('~/.jshintrc')

" Tagbar
map <leader>l :TagbarToggle<CR>

" TagList
if filereadable("/usr/local/bin/ctags")
  let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
endif

" ZoomWin
map <leader>z :ZoomWin<CR>
