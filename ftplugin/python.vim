" run the current file
nnoremap <buffer> mm :let @m = "run " . expand('%')<CR>:TxSend(@m)<CR>
" clear the variables
nnoremap <buffer> mu :let @m = "%reset -f"<CR>:TxSend(@m)<CR>
" exit python
nnoremap <buffer> mk :let @m = "exit()"<CR>:TxSend(@m)<CR>
" debugging
" set break point
nnoremap <buffer> mgs :normal! Oimport ipdb; ipdb.set_trace()<CR>j
" unset break point
nnoremap <buffer> mgu :normal! kdd<CR>
" next line
nnoremap <buffer> mgn :let @m = "n"<CR>:TxSend(@m)<CR>
" step in
nnoremap <buffer> mgi :let @m = "s"<CR>:TxSend(@m)<CR>
" continue
nnoremap <buffer> mgc :let @m = "c"<CR>:TxSend(@m)<CR>
" run till end of subroutine
nnoremap <buffer> mgr :let @m = "r"<CR>:TxSend(@m)<CR>
" print the value
nnoremap <buffer> mgv :let @m = "p " . expand('<cword>')<CR>:TxSend(@m)<CR>
" which class am i in
nnoremap <buffer> mgw :let @m = "p self"<CR>:TxSend(@m)<CR>
" list where i am
nnoremap <buffer> mgl :let @m = "l"<CR>:TxSend(@m)<CR>
" quit debugging
nnoremap <buffer> mgq :let @m = "q"<CR>:TxSend(@m)<CR>
" metadata
" get the shape of the matrix/object
nnoremap <buffer> mz :let @m = expand('<cword>') . ".shape"<CR>:TxSend(@m)<CR>
" dimensions of the variable at point
nnoremap <buffer> md :let @m = expand('<cword>') . ".ndim"<CR>:TxSend(@m)<CR>
" get the size of object
nnoremap <buffer> mv :let @m = expand('<cword>') . ".size"<CR>:TxSend(@m)<CR>
" get the length of the object
nnoremap <buffer> ml :let @m = "len(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" get the type of the object
nnoremap <buffer> mw :let @m = "type(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" get the type of the object (from space to space)
nnoremap <buffer> mW :let @m = "type(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
" get the sum of the matrix/object
nnoremap <buffer> m= :let @m = expand('<cword>') . ".sum()"<CR>:TxSend(@m)<CR>
" get the cumulative sum of the matrix/object
nnoremap <buffer> m+ :let @m = expand('<cword>') . ".cumsum()"<CR>:TxSend(@m)<CR>
" get the mean of the matrix/object
nnoremap <buffer> me :let @m = expand('<cword>') . ".mean()"<CR>:TxSend(@m)<CR>
" list all in interactive workspace
nnoremap <buffer> maa :let @m = "whos"<CR>:TxSend(@m)<CR>
" list all locals
nnoremap <buffer> mal :let @m = "locals()"<CR>:TxSend(@m)<CR>
" list all in scope
nnoremap <buffer> mag :let @m = "globals()"<CR>:TxSend(@m)<CR>
" list all globals
nnoremap <buffer> mas :let @m = "dir()"<CR>:TxSend(@m)<CR>