" Abolish
cabbrev S Subvert
cabbrev %S %Subvert

" Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep --sort path'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ALE
let g:ale_python_auto_pipenv = 1
autocmd FileType haskell let b:ale_linters = ['stack_ghc']
autocmd FileType javascript let b:ale_linters = ['eslint', 'tsserver']

" Blockle
let g:blockle_mapping = '<leader>rb'

" Easytags
set tags=./tags,tags
let g:easytags_auto_highlight = 0
let g:easytags_async = 1
let g:easytags_dynamic_files = 1

" Ensime
autocmd FileType scala nnoremap <buffer> <silent> <leader>t :EnType<CR>

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
let g:fzf_command_prefix = 'Fzf'
map <C-P> :FzfFiles<CR>

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Haskell
let g:haskell_backpack = 1                " enable highlighting of backpack keywords
let g:haskell_enable_arrowsyntax = 1      " enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " enable highlighting of `pattern`
let g:haskell_enable_quantification = 1   " enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " enable highlighting of `mdo` and `rec`
let g:haskell_enable_static_pointers = 1  " enable highlighting of `static`
let g:haskell_enable_typeroles = 1        " enable highlighting of type roles

" indentLine
let g:indentLine_char = '┃'
let g:indentLine_color_term = 18
autocmd FileType markdown,nerdtree IndentLinesDisable

" jedi
let g:jedi#popup_on_dot = 0

" JSON
let g:vim_json_syntax_conceal = 0

" LanguageClient
let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \}
autocmd FileType rust nnoremap <buffer> <silent> <leader>t :call LanguageClient#textDocument_hover()<CR>

" Markdown
let g:vim_markdown_folding_disabled=1
autocmd FileType markdown set conceallevel=0

" NERDCommenter
let NERDSpaceDelims = 1
map <leader>/ <plug>NERDCommenterToggle

" NERDTree
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
autocmd FileType nerdtree set conceallevel=0

" Python mode syntax
let g:pymode_syntax_all = 0
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_string_format = 0
let g:pymode_syntax_string_formatting = 0
let g:pymode_syntax_string_templates = 0

" Python PEP8 Indent
let g:python_pep8_indent_hang_closing = 1

" Rust syntax
let g:rust_recommended_style=0

" Signify
let g:signify_update_on_focusgained = 1

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
