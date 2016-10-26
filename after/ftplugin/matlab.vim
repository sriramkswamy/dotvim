""""""""""""""""""""""""""""""""""""
"  MATLAB specific configurations  "
""""""""""""""""""""""""""""""""""""
" dependencies
" tpope/vim-dispatch
" jebaum/vim-tmuxify

" matlab support - sort of
nnoremap <buffer> J :find <C-R><C-W><CR>
nnoremap <buffer> K :Dispatch /Applications/MATLAB_R2016a.app/bin/matlab -nodesktop -nosplash -r "help <cword>; quit"<CR>

" debug helpers
" set breakpoint at the current line
nnoremap <buffer> mmb :let @m = "dbstop at " . line('.') . " in " . expand('%')<CR>:TxSend(@m)<CR>
" step next
nnoremap <buffer> mmn :let @m = "dbstep"<CR>:TxSend(@m)<CR>
" step in
nnoremap <buffer> mmi :let @m = "dbstep in"<CR>:TxSend(@m)<CR>
" step out
nnoremap <buffer> mmo :let @m = "dbstep out"<CR>:TxSend(@m)<CR>
" unset breakpoint at the current line
nnoremap <buffer> mmu :let @m = "dbclear at " . line('.') . " in " . expand('%')<CR>:TxSend(@m)<CR>
" delete all breakpoints
nnoremap <buffer> mma :let @m = "dbclear all"<CR>:TxSend(@m)<CR>
" continue until next breakpoint or end of program
nnoremap <buffer> mmc :let @m = "dbcont"<CR>:TxSend(@m)<CR>
" put me in debug mode if there is an error
nnoremap <buffer> mmk :let @m = "dbstop on error"<CR>:TxSend(@m)<CR>
" quit debugging mode
nnoremap <buffer> mmq :let @m = "dbquit"<CR>:TxSend(@m)<CR>

" variable viewing
" show the GUI workspace
nnoremap <buffer> mmw :let @m = "workspace"<CR>:TxSend(@m)<CR>
" open the current variable in the GUI variable viewer
nnoremap <buffer> mmj :let @m = "openvar('" . expand('<cword>') . "')"<CR>:TxSend(@m)<CR>
" type of the variable
nnoremap <buffer> mmt :let @m = "whos " . expand('<cword>')<CR>:TxSend(@m)<CR>
" metadata on variables
" size of the variable at point
nnoremap <buffer> mms :let @m = "size(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" length of the variable at point
nnoremap <buffer> mml :let @m = "length(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" number of elements in the variable at point
nnoremap <buffer> mme :let @m = "numel(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" mean of the variable at point
nnoremap <buffer> mmm :let @m = "mean(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" sum of the variable at point
nnoremap <buffer> mm= :let @m = "sum(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" cumulative sum of the variable at point
nnoremap <buffer> mm+ :let @m = "cumsum(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" list all variables in the current working space
nnoremap <buffer> mmv :let @m = "whos"<CR>:TxSend(@m)<CR>

" simple plotting
" plot the vector
nnoremap <buffer> mmp :let @m = "plot(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" plot the matrix as a surface plot
nnoremap <buffer> mmf :let @m = "surf(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" plot the matrix as a mesh plot
nnoremap <buffer> mmg :let @m = "mesh(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>

" help
" show brief help on the function at point
nnoremap <buffer> mmh :let @m = "help " . expand('<cword>')<CR>:TxSend(@m)<CR>
" open the complete GUI documentation of the function at point
nnoremap <buffer> mmd :let @m = "doc " . expand('<cword>')<CR>:TxSend(@m)<CR>

" other useful commands
" clear screen
nnoremap <buffer> mmx :let @m = "clc"<CR>:TxSend(@m)<CR>
" exit matlab
nnoremap <buffer> mmX :let @m = "exit"<CR>:TxSend(@m)<CR>
" run the current file
nnoremap <buffer> mmr :let @m = "run " . expand('%')<CR>:TxSend(@m)<CR>
