function s:lazyload(plugin, file_types)
  execute "autocmd FileType " . a:file_types . " packadd " . a:plugin
endfunction

call s:lazyload("LanguageClient", "rust")
call s:lazyload("bundler", "ruby")
call s:lazyload("ensime", "java,scala")
call s:lazyload("fireplace", "clojure")
call s:lazyload("intero-neovim", "haskell")
call s:lazyload("jedi", "python")
call s:lazyload("parinfer", "clojure,lisp,racket")
call s:lazyload("racer", "rust")
call s:lazyload("rake", "ruby")
call s:lazyload("textobj-rubyblock", "ruby")
