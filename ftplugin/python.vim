" jedi support
" goto assignment
nnoremap <buffer> ma call jedi#goto_assignments()
" goto definition
nnoremap <buffer> md call jedi#goto_definitions()
" rename
nnoremap <buffer> mn call jedi#rename()
" visual rename
nnoremap <buffer> mv call jedi#rename_visual()
" jump
nnoremap <buffer> J :call jedi#goto()<CR>

" run the current file
nnoremap <buffer> mm :let @m = "run " . expand('%')<CR>:TxSend(@m)<CR>
" clear the variables
nnoremap <buffer> mu :let @m = "%reset -f"<CR>:TxSend(@m)<CR>
" exit python
nnoremap <buffer> mk :let @m = "exit()"<CR>:TxSend(@m)<CR>
" debugging
" set break point
nnoremap <buffer> mgs :call SetBreakpoint()<CR>:normal! Oimport ipdb; ipdb.set_trace()<CR>j
" unset break point
nnoremap <buffer> mgu :call UnsetBreakpoint()<CR>:normal! kdd<CR>
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
nnoremap <buffer> mgq :call RemoveAllBreakpoints()<CR>:let @m = "q"<CR>:TxSend(@m)<CR>

" metadata
" sort the imports
nnoremap <buffer> mi :sort i /\w\+/<CR>
vnoremap <buffer> mi :sort i /\w\+/<CR>
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
" get the type of the object
vnoremap <buffer> mw "my:let @m = "type(<C-R>m)"<CR>:TxSend(@m)<CR>
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

" plotting
" line plot
nnoremap <buffer> mfp :let @m = "plt.plot(" . expand('<cword>') . "); plt.show()"<CR>:TxSend(@m)<CR>

" set format options
setlocal formatprg=yapf
