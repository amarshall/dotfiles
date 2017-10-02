" Abolish
cabbrev S Subvert
cabbrev %S %Subvert

" Blockle
let g:blockle_mapping = '<leader>rb'

" Command-T
let g:CommandTMatchWindowReverse=0
let g:CommandTMaxHeight=20
if &term =~ "xterm" || &term =~ "screen"
  " Make ESC work in CommandT while in terminal Vim
  let g:CommandTCancelMap=['<ESC>']
end
map <C-P> :CommandT<CR>

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
