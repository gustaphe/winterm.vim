" Vim global plugin to set sensible cursors for Windows Terminal
" Last Change:  2022-08-08
" Maintainer:   David Gustavsson <david.e.gustavsson@gmail.com>
" License:      This file is placed in the public domain.
if exists('g:loaded_winterm')
    finish
endif
let g:loaded_winterm = 1

if !exists('g:winterm_dll')
    let g:winterm_dll = expand('<sfile>:h:h').'/bin/libcursor'
endif

if !exists('g:winterm_nCursor')
    let g:winterm_nCursor = 2
endif
if !exists('g:winterm_iCursor')
    let g:winterm_iCursor = 5
endif
if !exists('g:winterm_rCursor')
    let g:winterm_rCursor = 4
endif
if !exists('g:winterm_RCursor')
    let g:winterm_RCursor = 4
endif
if !exists('g:winterm_eCursor')
    let g:winterm_eCursor = 0
endif

au VimEnter,VimResume * call libcall(g:winterm_dll, 'setCursorType', g:winterm_nCursor)
au VimLeave,VimSuspend * call libcall(g:winterm_dll, 'setCursorType', g:winterm_eCursor)
au InsertEnter * :if v:insertmode ==? 'i' | call libcall(g:winterm_dll, 'setCursorType', g:winterm_iCursor) | else | call libcall(g:winterm_dll, 'setCursorType', g:winterm_RCursor) | endif
au InsertLeave * :call libcall(g:winterm_dll, 'setCursorType', g:winterm_nCursor)
au VimLeave * :call libcall(g:winterm_dll, 'setCursorType', g:winterm_nCursor)
nnoremap <silent> r <Cmd>call libcall(g:winterm_dll, 'setCursorType', g:winterm_rCursor)<bar>au TextChanged,CursorMoved * ++once :call libcall(g:winterm_dll, 'setCursorType', g:winterm_nCursor)<cr>r
