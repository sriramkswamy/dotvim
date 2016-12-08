" debug helpers
" set breakpoint at the current line
nnoremap <buffer> mgs :normal! Obrowser()<CR>j
" unset breakpoint at the current line
nnoremap <buffer> mgu :normal! kdd<CR>
" step next
nnoremap <buffer> mgn :let @m = "n"<CR>:TxSend(@m)<CR>
" step in
nnoremap <buffer> mgi :let @m = "s"<CR>:TxSend(@m)<CR>
" step out
nnoremap <buffer> mgo :let @m = "f"<CR>:TxSend(@m)<CR>
" continue until next breakpoint or end of program
nnoremap <buffer> mgc :let @m = "c"<CR>:TxSend(@m)<CR>
" unset breakpoint at the current line
nnoremap <buffer> mga :let @m = "undebug(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" delete all breakpoints
nnoremap <buffer> mgd :let @m = "debug(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" rerun with debug
nnoremap <buffer> mgr :let @m = "options(error = browser)"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mgk :let @m = "options(error = NULL)"<CR>:TxSend(@m)<CR>
" get the traceback
nnoremap <buffer> mgw :let @m = "where"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mgt :let @m = "traceback()"<CR>:TxSend(@m)<CR>
" quit debugging mode
nnoremap <buffer> mgq :let @m = "Q"<CR>:TxSend(@m)<CR>
" quit r
nnoremap <buffer> mk :let @m = "q()"<CR>:TxSend(@m)<CR>
" metadata on variables
" size of the variable at point
nnoremap <buffer> mz :let @m = "dim(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" length of the variable at point
nnoremap <buffer> ml :let @m = "length(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" mean of the variable at point
nnoremap <buffer> me :let @m = "mean(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" get the type of the object
nnoremap <buffer> mw :let @m = "typeof(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" get the type of the object (from space to space)
nnoremap <buffer> mW :let @m = "typeof(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
" sum of the variable at point
nnoremap <buffer> m= :let @m = "sum(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" cumulative sum of the variable at point
nnoremap <buffer> m+ :let @m = "cumsum(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
