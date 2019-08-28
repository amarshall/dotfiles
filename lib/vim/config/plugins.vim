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
let g:ale_echo_msg_format='%severity% <%linter%> %code: %%s'
let g:ale_echo_msg_error_str='[ERROR]'
let g:ale_echo_msg_info_str='[INFO]'
let g:ale_echo_msg_warning_str='[WARN]'
let g:ale_python_auto_pipenv = 1
autocmd FileType haskell let b:ale_linters = ['stack_ghc']
autocmd FileType javascript let b:ale_linters = ['eslint', 'tsserver']
autocmd FileType ruby let b:ale_linters = ['ruby', 'rubocop']

" Blockle
let g:blockle_mapping = '<leader>rb'

" EasyMotion
let g:EasyMotion_do_mapping = 0

" Easytags
set tags=./tags,tags
let g:easytags_auto_highlight = 0
let g:easytags_async = 1
let g:easytags_dynamic_files = 1

" Indent Guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_default_mapping = 0
autocmd VimEnter,Colorscheme * :hi link IndentGuidesOdd Normal
autocmd VimEnter,Colorscheme * :hi link IndentGuidesEven CursorLine

" Indexed Search
let g:indexed_search_show_index_mappings = 0

" fzf
let g:fzf_command_prefix = 'Fzf'
map <C-P> :FzfFiles<CR>

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

" Julia
let g:latex_to_unicode_tab = 0

" LanguageClient
let g:LanguageClient_serverCommands = {
      \ 'python': ['pyls'],
      \ 'ruby': ['solargraph', 'stdio'],
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \}
let g:LanguageClient_settingsPath = '.config/languageclient.json'

" Markdown
let g:vim_markdown_folding_disabled=1
autocmd FileType markdown set conceallevel=0

" NERDCommenter
let NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1

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

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_javascript_jshint_args = '--config '.expand('~/.jshintrc')

" TagList
if filereadable("/usr/local/bin/ctags")
  let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
endif

" Which Key
autocmd VimEnter * call which_key#register('<Space>', "g:which_key_map")
