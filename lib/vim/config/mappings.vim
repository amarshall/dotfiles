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

" Map backspace as alternative leader
nmap <backspace> <leader>
vmap <backspace> <leader>


" SpaceVim

let g:which_key_map = {}

nnoremap <silent> <leader> :WhichKey '<leader>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

nnoremap <leader><leader> :
let g:which_key_map['/'] = 'toggle comment'
noremap <leader>/ :call NERDComment("n", "Toggle")<CR>

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

nnoremap <leader>h :nohlsearch<CR>

let g:which_key_map.t = {'name': '+tags'}
let g:which_key_map.t.L = 'toggle tag list'
nnoremap <leader>tl :TagbarToggle<CR>
let g:which_key_map.t.L = 'search tags'
nnoremap <leader>ts :call fzf#vim#tags('')<CR>

let g:which_key_map.u = 'toggle undo tree'
nnoremap <leader>u :MundoToggle<CR>

let g:which_key_map.m = {'name': '+meta'}
let g:which_key_map.m.t = 'reveal type'
autocmd FileType haskell nnoremap <buffer> <silent> <leader>mt <Plug>InteroGenericType
autocmd FileType rust nnoremap <buffer> <silent> <leader>mt :call LanguageClient#textDocument_hover()<CR>
autocmd FileType scala nnoremap <buffer> <silent> <leader>mt :EnType<CR>
