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
nnoremap <buffer> K :AsyncRun /Applications/MATLAB_R2016a.app/bin/matlab -nodesktop -nosplash -r "help <cword>; quit"<CR>:copen<CR>

" debug helpers
nnoremap <buffer> mdq :call RemoveAllBreakpoints()<CR>:let @m = "Q"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" set breakpoint at the current line
nnoremap <buffer> mds :call SetBreakpoint()<CR>:let @m = "dbstop at " . line('.') . " in " . expand('%')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" step next
nnoremap <buffer> mdn :let @m = "dbstep"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" debugging status
nnoremap <buffer> mdl :let @m = "dbstatus"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" step in
nnoremap <buffer> mdi :let @m = "dbstep in"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" step out
nnoremap <buffer> mdo :let @m = "dbstep out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" unset breakpoint at the current line
nnoremap <buffer> mdu :call UnsetBreakpoint()<CR>:let @m = "dbclear at " . line('.') . " in " . expand('%')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" delete all breakpoints
nnoremap <buffer> mda :call RemoveAllBreakpoints()<CR>:let @m = "dbclear all"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" continue until next breakpoint or end of program
nnoremap <buffer> mdc :let @m = "dbcont"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" put me in debug mode if there is an error or warning
nnoremap <buffer> mde :let @m = "dbstop on error"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mdw :let @m = "dbstop on warning"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" exit debug mode without removing breakpoints
nnoremap <buffer> mdk :let @m = "dbquit"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" quit debugging mode and remove all breakpoints
nnoremap <buffer> mdq :call RemoveAllBreakpoints()<CR>:let @m = "dbclear all; dbquit"<CR>:Tmux send-keys '<C-r>m' C-m<CR>

" get all the signs for breakpoints in vim {{{2
nnoremap <buffer> mdv :sign list mybreakpoint<CR>

" variable viewing
" open in GUI
nnoremap <buffer> mk :let @m = "edit " . expand('<cword>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mK :let @m = "edit " . expand('%:r')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" show the GUI workspace
nnoremap <buffer> mb :let @m = "workspace"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" open the current variable in the GUI variable viewer
nnoremap <buffer> mj :let @m = "openvar('" . expand('<cword>') . "')"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mJ :let @m = "openvar('" . expand('<cWORD>') . "')"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> mj "my:let @m = "openvar('<C-R>m')"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" type of the variable
nnoremap <buffer> mw :let @m = "whos " . expand('<cword>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mW :let @m = "whos " . expand('<cWORD>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> mw "my:let @m = "whos <C-R>m"<CR>:Tmux send-keys '<C-r>m' C-m<CR>

" metadata on variables
" size of the variable at point
nnoremap <buffer> mz :let @m = "size(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mZ :let @m = "size(" . expand('<cWORD>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> mz "my:let @m = "size(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" length of the variable at point
nnoremap <buffer> ml :let @m = "length(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mL :let @m = "length(" . expand('<cWORD>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> ml "my:let @m = "length(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" number of elements in the variable at point
nnoremap <buffer> mv :let @m = "numel(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mV :let @m = "numel(" . expand('<cWORD>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> mv "my:let @m = "numel(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" fieldnames of the variable at point
nnoremap <buffer> m? :let @m = "fieldnames(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> m? "my:let @m = "fieldnames(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" dimensions of the variable at point
nnoremap <buffer> md :let @m = "ndim(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mD :let @m = "ndim(" . expand('<cWORD>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> md "my:let @m = "ndim(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" mean of the variable at point
nnoremap <buffer> me :let @m = "mean(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mE :let @m = "mean(" . expand('<cWORD>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> me "my:let @m = "mean(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" sum of the variable at point
nnoremap <buffer> m= :let @m = "sum(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> m= "my:let @m = "sum(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" cumulative sum of the variable at point
nnoremap <buffer> m+ :let @m = "cumsum(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> m+ "my:let @m = "cumsum(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" list all variables in the current working space
nnoremap <buffer> ma :let @m = "whos"<CR>:Tmux send-keys '<C-r>m' C-m<CR>

" simple plotting
" plot the vector
nnoremap <buffer> mgp :let @m = "plot(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mgP :let @m = "plot(" . expand('<cWORD>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> mgp "my:let @m = "plot(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" plot the matrix as a mesh plot
nnoremap <buffer> mgm :let @m = "mesh(" . expand('<cword>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mgM :let @m = "mesh(" . expand('<cWORD>') . ")"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> mgm "my:let @m = "mesh(<C-R>m)"<CR>:Tmux send-keys '<C-r>m' C-m<CR>

" help
" add to current path
nnoremap <buffer> my :CopyFilePath<CR>:let @m = "addpath('<C-r>*')"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mY :CopyFilePath<CR>:let @m = "addpath(genpath('<C-r>*'))"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> my "my:let @m = "addpath('<C-r>m')"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" show brief help on the function at point
nnoremap <buffer> mh :let @m = "help " . expand('<cword>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mH :let @m = "help " . expand('<cWORD>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> mh "my:let @m = "help <C-R>m"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" open the complete GUI documentation of the function at point
nnoremap <buffer> mi :let @m = "doc " . expand('<cword>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
nnoremap <buffer> mI :let @m = "doc " . expand('<cWORD>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
vnoremap <buffer> mi "my:let @m = "doc <C-R>m"<CR>:Tmux send-keys '<C-r>m' C-m<CR>

" other useful commands
" clear screen
nnoremap <buffer> mc :let @m = "clc"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" clear variable list
nnoremap <buffer> mu :let @m = "clear all"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" run the current file
nnoremap <buffer> mm :let @m = expand('%:r')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
