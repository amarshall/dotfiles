"=============================================================================
" regreplop.vim - a operator to replace something with a register
"=============================================================================
"
" Author:  Takahiro SUZUKI <takahiro.suzuki.ja@gmDELETEMEail.com>
" Version: 1.1 (Vim 7.1)
" Licence: MIT Licence
"
"=============================================================================
" Document: {{{1
"
"-----------------------------------------------------------------------------
" Description:
"   This plugin provides a operator to replace something(motion/visual) with a
"   specified register.
"   By default, the operator is mapped at
"     <Plug>ReplaceMotion  " for normal mode
"     <Plug>ReplaceLine    " for normal mode (replace a line)
"     <Plug>ReplaceVisual  " for visual mode
"   and if there are no key mapping for <C-K>, <C-K> is mapped to these
"   operators. (and <C-K><C-K> for ReplaceLine)
"
"   If you want to map them to another keys, add like below in your vimrc.
"     nmap YOURKEY <Plug>ReplaceMotion
"     nmap YOURKEY <Plug>ReplaceLine
"     vmap YOURKEY <Plug>ReplaceVisual
"
"-----------------------------------------------------------------------------
" Installation:
"   Place this file in /usr/share/vim/vim*/plugin or ~/.vim/plugin/
"   Now replacing operator <C-K> is available.
"
"-----------------------------------------------------------------------------
" Examples:
"   in normal mode:
"      <C-K>iw     " replaces inner word with default register
"      "a<C-K>iw   " replaces inner word with register a
"      <C-K>$      " replaces whole text right the cursor
"      <C-K><C-K>  " replaces the line under cursor
"
"   in visual mode:
"      <C-K>       " replace visual selection with default register
"      "a<C-K>     " replace visual selection with register a
"
"-----------------------------------------------------------------------------
" ChangeLog:
"   1.1:
"     - added ReplaceLine (default: <C-K><C-K>)
"   1.0.1:
"     - code refinement
"   1.0:
"     - Initial release
"
" }}}1
"=============================================================================

" replace selection with register
function! s:ReplaceMotion(type, ...)
  let reg = empty(s:lastreg) ? '"' : s:lastreg
  let op_mode = 'v'      " default: character
  let marks   = '<>'     " default: visual mode

  if !a:0 " normal mode
    let marks = '[]'
    if a:type == 'line'
      let op_mode = 'V'
      call setreg(reg[:-2], getreg(reg), getregtype(reg))
    endif
  endif

  let ai_back = &autoindent
  exe 'normal! `'.marks[1].'$'
  exe 'normal! `'.marks[0].'"_c'.op_mode.'`'.marks[1]."\<C-R>".reg."\<ESC>"
endfunction

function! s:ReplaceLine(type, ...)
  let reg = empty(s:lastreg) ? '"' : s:lastreg
  exe 'normal! "_d' . (s:lastcnt==1 ? 'd' : s:lastcnt.'j')
  if getregtype(reg)=='V'
    " linewise
    exe 'normal! "'.reg.'P'
  else
    " emulate linewise
    exe "normal! O\<C-R>".reg."\<ESC>"
  endif
endfunction

function! s:SaveReg()
  let s:lastreg = v:register
  let s:lastcnt = v:count1
endfunction

" default mapping
if !hasmapto('<Plug>ReplaceMotion', 'n')
  nmap <silent> <C-K> <Plug>ReplaceMotion
endif
if !hasmapto('<Plug>ReplaceLine', 'n')
  nmap <silent> <C-K><C-K> <Plug>ReplaceLine
endif
if !hasmapto('<Plug>ReplaceVisual', 'v')
  vmap <silent> <C-K> <Plug>ReplaceVisual
endif

" export the plugin mapping
nnoremap <silent> <Plug>ReplaceMotion :<C-U>call <SID>SaveReg()<CR><ESC>:set opfunc=<SID>ReplaceMotion<CR>g@
nnoremap <silent> <Plug>ReplaceLine :<C-U>call <SID>SaveReg()<CR><ESC>:call <SID>ReplaceLine('line')<CR>
vnoremap <silent> <Plug>ReplaceVisual :<C-U>call <SID>SaveReg()<CR><ESC>:call <SID>ReplaceMotion('', 1)<CR>

" vim: set foldmethod=marker et ts=2 sts=2 sw=2:
