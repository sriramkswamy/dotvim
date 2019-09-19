" " normal syntax support
"  CompilerSet makeprg=/Applications/MATLAB_R2016a.app/bin/maci64/mlint\ -id\ %\ %<
"  CompilerSet errorformat=
"                 \%-P==========\ %f\ ==========,
"                 \%-G%>==========\ %s\ ==========,
"                 \%-G%>L\ %l\ (C\ %c):\ MDOTM%m,
"                 \L\ %l\ (C\ %c):\ %m,
"                 \L\ %l\ (C\ %c-%*[0-9]):\ %m,
"                 \%-Q

" matlab support - sort of
nnoremap <buffer> J :find <C-R><C-W><CR>
nnoremap <buffer> K :AsyncRun /home/sriramkrish92/MATLAB/bin/matlab -nodesktop -nosplash -r "help <cword>; quit"<CR>:copen<CR>

" outline
nnoremap <buffer> t :lvimgrep /^\s*\(function\\|methods\\|properties\\|classdef\).*/ %<CR>

" debug helpers
nnoremap <buffer> mgq :call RemoveAllBreakpoints()<CR>:let @m = "Q"<CR>:TxSend(@m)<CR>
" set breakpoint at the current line
nnoremap <buffer> mgs :call SetBreakpoint()<CR>:let @m = "dbstop at " . line('.') . " in " . expand('%')<CR>:TxSend(@m)<CR>
" step next
nnoremap <buffer> mgn :let @m = "dbstep"<CR>:TxSend(@m)<CR>
" debugging status
nnoremap <buffer> mgl :let @m = "dbstatus"<CR>:TxSend(@m)<CR>
" step in
nnoremap <buffer> mgi :let @m = "dbstep in"<CR>:TxSend(@m)<CR>
" step out
nnoremap <buffer> mgo :let @m = "dbstep out"<CR>:TxSend(@m)<CR>
" unset breakpoint at the current line
nnoremap <buffer> mgu :call UnsetBreakpoint()<CR>:let @m = "dbclear at " . line('.') . " in " . expand('%')<CR>:TxSend(@m)<CR>
" delete all breakpoints
nnoremap <buffer> mga :call RemoveAllBreakpoints()<CR>:let @m = "dbclear all"<CR>:TxSend(@m)<CR>
" continue until next breakpoint or end of program
nnoremap <buffer> mgc :let @m = "dbcont"<CR>:TxSend(@m)<CR>
" put me in debug mode if there is an error or warning
nnoremap <buffer> mge :let @m = "dbstop on error"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mgw :let @m = "dbstop on warning"<CR>:TxSend(@m)<CR>
" exit debug mode without removing breakpoints
nnoremap <buffer> mgk :let @m = "dbquit"<CR>:TxSend(@m)<CR>
" quit debugging mode and remove all breakpoints
nnoremap <buffer> mgq :call RemoveAllBreakpoints()<CR>:let @m = "dbclear all; dbquit"<CR>:TxSend(@m)<CR>

" get all the signs for breakpoints in vim {{{2
nnoremap <buffer> mgv :sign list mybreakpoint<CR>

" variable viewing
" open in GUI
nnoremap <buffer> mk :let @m = "edit " . expand('<cword>')<CR>:TxSend(@m)<CR>
nnoremap <buffer> mK :let @m = "edit " . expand('%:r')<CR>:TxSend(@m)<CR>
" show the GUI workspace
nnoremap <buffer> mb :let @m = "workspace"<CR>:TxSend(@m)<CR>
" open the current variable in the GUI variable viewer
nnoremap <buffer> mj :let @m = "openvar('" . expand('<cword>') . "')"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mJ :let @m = "openvar('" . expand('<cWORD>') . "')"<CR>:TxSend(@m)<CR>
vnoremap <buffer> mj "my:let @m = "openvar('<C-R>m')"<CR>:TxSend(@m)<CR>
" type of the variable
nnoremap <buffer> mw :let @m = "whos " . expand('<cword>')<CR>:TxSend(@m)<CR>
nnoremap <buffer> mW :let @m = "whos " . expand('<cWORD>')<CR>:TxSend(@m)<CR>
vnoremap <buffer> mw "my:let @m = "whos <C-R>m"<CR>:TxSend(@m)<CR>

" metadata on variables
" size of the variable at point
nnoremap <buffer> mz :let @m = "size(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mZ :let @m = "size(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> mz "my:let @m = "size(<C-R>m)"<CR>:TxSend(@m)<CR>
" length of the variable at point
nnoremap <buffer> ml :let @m = "length(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mL :let @m = "length(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> ml "my:let @m = "length(<C-R>m)"<CR>:TxSend(@m)<CR>
" number of elements in the variable at point
nnoremap <buffer> mv :let @m = "numel(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mV :let @m = "numel(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> mv "my:let @m = "numel(<C-R>m)"<CR>:TxSend(@m)<CR>
" fieldnames of the variable at point
nnoremap <buffer> m? :let @m = "fieldnames(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> m? "my:let @m = "fieldnames(<C-R>m)"<CR>:TxSend(@m)<CR>
" dimensions of the variable at point
nnoremap <buffer> md :let @m = "ndim(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mD :let @m = "ndim(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> md "my:let @m = "ndim(<C-R>m)"<CR>:TxSend(@m)<CR>
" mean of the variable at point
nnoremap <buffer> me :let @m = "mean(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mE :let @m = "mean(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> me "my:let @m = "mean(<C-R>m)"<CR>:TxSend(@m)<CR>
" sum of the variable at point
nnoremap <buffer> m= :let @m = "sum(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> m= "my:let @m = "sum(<C-R>m)"<CR>:TxSend(@m)<CR>
" cumulative sum of the variable at point
nnoremap <buffer> m+ :let @m = "cumsum(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> m+ "my:let @m = "cumsum(<C-R>m)"<CR>:TxSend(@m)<CR>
" list all variables in the current working space
nnoremap <buffer> ma :let @m = "whos"<CR>:TxSend(@m)<CR>

" simple plotting
" plot the vector
nnoremap <buffer> mfp :let @m = "plot(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mfP :let @m = "plot(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> mfp "my:let @m = "plot(<C-R>m)"<CR>:TxSend(@m)<CR>
" plot the matrix as a mesh plot
nnoremap <buffer> mfm :let @m = "mesh(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mfM :let @m = "mesh(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
vnoremap <buffer> mfm "my:let @m = "mesh(<C-R>m)"<CR>:TxSend(@m)<CR>

" help
" add to current path
nnoremap <buffer> my :CopyFilePath<CR>:let @m = "addpath('<C-r>*')"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mY :CopyFilePath<CR>:let @m = "addpath(genpath('<C-r>*'))"<CR>:TxSend(@m)<CR>
vnoremap <buffer> my "my:let @m = "addpath('<C-r>m')"<CR>:TxSend(@m)<CR>
" show brief help on the function at point
nnoremap <buffer> mh :let @m = "help " . expand('<cword>')<CR>:TxSend(@m)<CR>
nnoremap <buffer> mH :let @m = "help " . expand('<cWORD>')<CR>:TxSend(@m)<CR>
vnoremap <buffer> mh "my:let @m = "help <C-R>m"<CR>:TxSend(@m)<CR>
" open the complete GUI documentation of the function at point
nnoremap <buffer> mi :let @m = "doc " . expand('<cword>')<CR>:TxSend(@m)<CR>
nnoremap <buffer> mI :let @m = "doc " . expand('<cWORD>')<CR>:TxSend(@m)<CR>
vnoremap <buffer> mi "my:let @m = "doc <C-R>m"<CR>:TxSend(@m)<CR>

" other useful commands
if has('macunix')
    " run matlab
    nnoremap <buffer> mr :let @m = "matlab"<CR>:TxSend(@m)<CR>
elseif has('unix')
    " run matlab
    nnoremap <buffer> mr :let @m = "mat"<CR>:TxSend(@m)<CR>
endif
" clear screen
nnoremap <buffer> mc :let @m = "clc"<CR>:TxSend(@m)<CR>
" clear variable list
nnoremap <buffer> mu :let @m = "clear all"<CR>:TxSend(@m)<CR>
" run the current file
nnoremap <buffer> mm :let @m = expand('%:r')<CR>:TxSend(@m)<CR>
