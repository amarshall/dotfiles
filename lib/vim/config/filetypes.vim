" Delete trailing whitespace
func! DeleteTrailingWhitespace()
  exec "normal mZ"
  %s/\s\+$//e
  exec "normal `Z"
endfunc
autocmd BufWritePre *.{c,cpp,h,hpp,m,mm} :call DeleteTrailingWhitespace()
autocmd BufWritePre *.{erb,feature,haml,rb,yml} :call DeleteTrailingWhitespace()
autocmd BufWritePre *.{css,html,js,json,less,scss,xml} :call DeleteTrailingWhitespace()
autocmd BufWritePre *.{clj,java,php,rs} :call DeleteTrailingWhitespace()

" Associate some filetypes with their proper syntax
autocmd BufRead,BufNewFile *.applescript set filetype=applescript
autocmd BufRead,BufNewFile *.avsc set filetype=json
autocmd BufRead,BufNewFile *.dockerignore set filetype=conf
autocmd BufRead,BufNewFile *.prawn set filetype=ruby
autocmd BufRead,BufNewFile *.pyi set filetype=python
autocmd BufRead,BufNewFile *.txt set filetype=text
autocmd BufRead,BufNewFile Containerfile set filetype=dockerfile
autocmd BufRead,BufNewFile gitconfig set filetype=gitconfig
autocmd BufRead,BufNewFile gitignore set filetype=conf
autocmd BufRead * if getline(1) =~# '\v^#!.+[/ ]R(script)?$' | setfiletype r | endif

autocmd FileType clojure set iskeyword-=.

autocmd FileType mail setlocal textwidth=0
autocmd FileType mail setlocal wrapmargin=0

autocmd FileType gitcommit,mail,markdown,text set spell

autocmd FileType scss setlocal iskeyword=@,48-57,_,-,?,!,192-255

" Enable soft-wrapping for text files
autocmd FileType eruby,html,markdown,tex,text,xhtml setlocal wrap linebreak nolist

autocmd FileType bindzone setlocal nolist
autocmd FileType bindzone setlocal noexpandtab
autocmd FileType bindzone setlocal shiftwidth=8
autocmd FileType bindzone setlocal tabstop=8

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim), or when inside a git commit
autocmd BufReadPost *
  \ if &filetype != "gitcommit" && &filetype != "gitrebase" && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
