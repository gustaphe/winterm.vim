" Vim global plugin to set sensible cursors for Windows Terminal
" Last Change:  2022-08-08
" Maintainer:   David Gustavsson <david.e.gustavsson@gmail.com>
" License:      This file is placed in the public domain.
if exists('g:loaded_winterm')
    finish
endif
let g:loaded_winterm = 1

let g:winterm_dll = expand('<sfile>:h:h').'/bin/libcursor'

let g:winterm_nCursor = 2
let g:winterm_iCursor = 5
let g:winterm_rCursor = 4
let g:winterm_RCursor = 4

au InsertEnter * :if v:insertmode ==? 'i' | call libcall(g:winterm_dll, 'setCursorType', g:winterm_iCursor) | else | call libcall(g:winterm_dll, 'setCursorType', g:winterm_RCursor) | endif
au InsertLeave * :call libcall(g:winterm_dll, 'setCursorType', g:winterm_nCursor)
au VimLeave * :call libcall(g:winterm_dll, 'setCursorType', g:winterm_nCursor)
nnoremap <silent> r <Cmd>call libcall(g:winterm_dll, 'setCursorType', g:winterm_rCursor)<bar>au TextChanged,CursorMoved * ++once :call libcall(g:winterm_dll, 'setCursorType', g:winterm_nCursor)<cr>r
