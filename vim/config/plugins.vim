" Abolish
cabbrev S Subvert
cabbrev %S %Subvert

" Blockle
let g:blockle_mapping = '<leader>rb'

" CtrlP
let g:ctrlp_max_height=20
let g:ctrlp_match_window_reversed=0
let g:ctrlp_use_caching=0
map <C-P>     :CtrlPMRU<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>e :e#<CR>

" Easytags
set tags=./tags
let g:easytags_auto_highlight = 0
let g:easytags_dynamic_files = 1

" Indent Guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi link IndentGuidesOdd Normal
autocmd VimEnter,Colorscheme * :hi link IndentGuidesEven CursorLine

" Indexed Search
let g:indexed_search_show_index_mappings = 0

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
let vimclojure#WantNailgun = 0

" ZoomWin
map <leader>z :ZoomWin<CR>
