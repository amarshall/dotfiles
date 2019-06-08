" Toggle spell check

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


" SpaceVim
let g:which_key_map = {}

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

let g:which_key_map[':'] = 'command-line mode'
nnoremap <leader><leader> :
let g:which_key_map['/'] = 'toggle comment'
nnoremap <leader>/ <plug>NERDCommenterToggle

let g:which_key_map.b = {'name': '+buffer'}
let g:which_key_map.b.c = 'copy current path'
nnoremap <silent> <leader>bc :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
let g:which_key_map.b.C = 'copy current path & line num.'
nnoremap <silent> <leader>bC :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>
let g:which_key_map.b.s = 'toggle spell-check in buffer'
nnoremap <leader>bs :setlocal spell!<CR>

let g:which_key_map.f = {'name': '+files'}
let g:which_key_map.f.s = 'search files'
nnoremap <leader>fs :FzfFiles<CR>
let g:which_key_map.f.l = 'toggle file list tree'
nnoremap <leader>fl :NERDTreeToggle<CR>
let g:which_key_map.f.L = 'open file list tree at current file'
nnoremap <leader>fL :NERDTreeFind<CR>

let g:which_key_map.t = {'name': '+tags'}
let g:which_key_map.t.L = 'toggle tag list'
nnoremap <leader>tl :TagbarToggle<CR>
let g:which_key_map.t.L = 'search tags'
nnoremap <leader>ts :call fzf#vim#tags('')<CR>

let g:which_key_map.u = 'toggle undo tree'
nnoremap <leader>u :MundoToggle<CR>

autocmd FileType haskell nnoremap <buffer> <silent> <leader>t <Plug>InteroGenericType
autocmd FileType rust nnoremap <buffer> <silent> <leader>t :call LanguageClient#textDocument_hover()<CR>
autocmd FileType scala nnoremap <buffer> <silent> <leader>t :EnType<CR>
