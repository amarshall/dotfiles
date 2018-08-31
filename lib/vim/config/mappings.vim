" Copy current file path (plus line number, if asked) to system pasteboard.
map <silent> <leader>cp :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <silent> <leader>cP :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

" Toggle spell check
map <leader>ss :setlocal spell!<cr>

" Mapping for writing all files in a tab
cabbrev wt silent windo w

" Gracefully handle holding shift too long after : for common commands
cabbrev Q q
cabbrev Qa qa
cabbrev Tabe tabe
cabbrev Tabn tabn
cabbrev W w
cabbrev Wa wa
cabbrev Wq wq
cabbrev Wt wt

" Make Y consistent with D and C.
map Y y$

" Indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" Readline-like navigation for command mode
cnoremap <C-A> <Home>
cnoremap <C-B> <C-Left>
cnoremap <C-F> <C-Right>
