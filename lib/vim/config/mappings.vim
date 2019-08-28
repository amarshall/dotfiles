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

" Easier omnifunc mapping
imap <C-Space> <C-X><C-O>

" Map regular , to ,, so it may be used for other mappings
nnoremap ,, ,


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

let g:which_key_map.l = {'name': '+lang'}
let g:which_key_map.l.e = 'error details'
let g:which_key_map.l.g = {'name': '+goto'}
let g:which_key_map.l.g.d = 'goto definition'
let g:which_key_map.l.g.i = 'goto implementation'
let g:which_key_map.l.g.r = 'goto reference'
let g:which_key_map.l.g.t = 'goto type definition'
let g:which_key_map.l.h = 'highlight usage'
let g:which_key_map.l.h = 'clear highlight'
let g:which_key_map.l.r = 'rename'
let g:which_key_map.l.s = 'start language server'
let g:which_key_map.l.t = 'reveal type'
nnoremap <leader>le :call LanguageClient#explainErrorAtPoint()<CR>
nnoremap <leader>lgd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lgi :call LanguageClient#textDocument_implementation()<CR>
nnoremap <leader>lgr :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>lgt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_documentHighlight()<CR>
nnoremap <leader>lH :call LanguageClient#textDocument_clearDocumentHighlight()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>ls :LanguageClientStart<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_hover()<CR>
autocmd FileType haskell nnoremap <buffer> <silent> <leader>lt <Plug>InteroGenericType
autocmd FileType scala nnoremap <buffer> <silent> <leader>lt :EnType<CR>
