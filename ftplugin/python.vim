" jedi support
" goto assignment
nnoremap <buffer> ma call jedi#goto_assignments()
" goto definition
nnoremap <buffer> md call jedi#goto_definitions()
" rename
nnoremap <buffer> mn call jedi#rename()
" visual rename
vnoremap <buffer> mn call jedi#rename_visual()
" jump
nnoremap <buffer> J :call jedi#goto()<CR>

" run the current file
nnoremap <buffer> mm :let @m = "run " . expand('%')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" clear the variables
nnoremap <buffer> mu :let @m = "%reset -f"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" exit python
nnoremap <buffer> mq :let @m = "exit()"<CR>:Tmux send-keys '<C-r>m' C-m<CR>

" debugging
" vebugger
nnoremap <buffer> <Space>hd :VBGstartPDB3<Space>
" set break point
nnoremap <buffer> mds :call SetBreakpoint()<CR>:normal! Oimport ipdb; ipdb.set_trace()<CR>j
" unset break point
nnoremap <buffer> mdu :call UnsetBreakpoint()<CR>:normal! kdd<CR>
" next line
nnoremap <buffer> mdn :let @m = "n"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" step in
nnoremap <buffer> mdi :let @m = "s"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" continue
nnoremap <buffer> mdc :let @m = "c"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" run till end of subroutine
nnoremap <buffer> mdr :let @m = "r"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" print the value
nnoremap <buffer> mdv :let @m = "p " . expand('<cword>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" which class am i in
nnoremap <buffer> mdw :let @m = "p self"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" list where i am
nnoremap <buffer> mdl :let @m = "l"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" quit debugging
nnoremap <buffer> mdq :call RemoveAllBreakpoints()<CR>:let @m = "q"<CR>:Tmux send-keys '<C-r>m' C-m<CR>

" metadata
" sort the imports
nnoremap <buffer> mi :sort i /\w\+/<CR>
vnoremap <buffer> mi :sort i /\w\+/<CR>
" get the shape of the matrix/object
nnoremap <buffer> mz :let @m = expand('<cword>') . ".shape"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" dimensions of the variable at point
nnoremap <buffer> mX :let @m = expand('<cword>') . ".ndim"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" get the size of object
nnoremap <buffer> mx :let @m = expand('<cword>') . ".size"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" get the length of the object
nnoremap <buffer> ml :let @m = "len(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" get the type of the object
nnoremap <buffer> mw :let @m = "type(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" get the type of the object
vnoremap <buffer> mw "my:let @m = "type(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" get the type of the object (from space to space)
nnoremap <buffer> mW :let @m = "type(" . expand('<cWORD>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" get the sum of the matrix/object
nnoremap <buffer> m= :let @m = expand('<cword>') . ".sum()"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" get the cumulative sum of the matrix/object
nnoremap <buffer> m+ :let @m = expand('<cword>') . ".cumsum()"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" get the mean of the matrix/object
nnoremap <buffer> me :let @m = expand('<cword>') . ".mean()"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" list all in interactive workspace
nnoremap <buffer> maa :let @m = "whos"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" list all locals
nnoremap <buffer> mal :let @m = "locals()"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" list all in scope
nnoremap <buffer> mag :let @m = "globals()"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" list all globals
nnoremap <buffer> mas :let @m = "dir()"<CR>:Tmux send-keys '<C-r>m' C-m<CR>

" plotting
" line plot
nnoremap <buffer> mgg :let @m = "plt.plot(" . expand('<cword>') . "); plt.show()"<CR>:Tmux send-keys '<C-r>m' C-m<CR>

" set format options
setlocal formatprg=yapf
