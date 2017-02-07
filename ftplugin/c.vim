" Single file C compilation with different flags
" simple
nnoremap <buffer> <Space>ms :Dispatch! cd %:p:h <bar> gcc -Wall -g -o %:p:r.out %<CR>
" with math support
nnoremap <buffer> <Space>mm :Dispatch! cd %:p:h <bar> gcc! -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %<CR>
" openmp
nnoremap <buffer> <Space>mo :Dispatch! cd %:p:h <bar> gcc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %<CR>
" mpi
nnoremap <buffer> <Space>mi :Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %<CR>
" hybrid
nnoremap <buffer> <Space>mh :Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %<CR>
" armadillo
nnoremap <buffer> <Space>ma :Dispatch! cd %:p:h <bar> gcc -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g -o %:p:r.out %<CR>

" debugging
" call gdb
nnoremap <buffer> mgg :let @m = "gdb"<CR>:TxSend(@m)<CR>
" set breakpoint in current line
nnoremap <buffer> mgs :call SetBreakpoint()<CR>:let @m = "break " . expand('%') . ":" . line('.')<CR>:TxSend(@m)<CR>
" unset breakpoint in current line
nnoremap <buffer> mgu :call UnsetBreakpoint()<CR>:let @m = "clear " . expand('%') . ":" . line('.')<CR>:TxSend(@m)<CR>
" set breakpoint in current function
nnoremap <buffer> mgf :call SetBreakpoint()<CR>:let @m = "break " . expand('%') . ":" . line('<cword>')<CR>:TxSend(@m)<CR>
" unset breakpoint in current function
nnoremap <buffer> mgd :call UnsetBreakpoint()<CR>:let @m = "break " . expand('%') . ":" . line('<cword>')<CR>:TxSend(@m)<CR>
" set breakpoint in current class method
nnoremap <buffer> mgm :call SetBreakpoint()<CR>:let @m = "break " . expand('%') . ":" . line('<cword>')<CR>:TxSend(@m)<CR>
" unset breakpoint in current class method
nnoremap <buffer> mgb :call UnsetBreakpoint()<CR>:let @m = "break " . expand('%') . ":" . line('<cword>')<CR>:TxSend(@m)<CR>
" clear all breakpoints
nnoremap <buffer> mga :call RemoveAllBreakpoints()<CR>:let @m = "delete"<CR>:TxSend(@m)<CR>
" next line
nnoremap <buffer> mgn :let @m = "n"<CR>:TxSend(@m)<CR>
" continue
nnoremap <buffer> mgc :let @m = "c"<CR>:TxSend(@m)<CR>
" run
nnoremap <buffer> mgr :let @m = "r"<CR>:TxSend(@m)<CR>
" list all breakpoints
nnoremap <buffer> mgl :let @m = "info breakpoints"<CR>:TxSend(@m)<CR>
" step in
nnoremap <buffer> mgi :let @m = "s"<CR>:TxSend(@m)<CR>
" go one level up
nnoremap <buffer> mgk :let @m = "up"<CR>:TxSend(@m)<CR>
" print value of variable
nnoremap <buffer> mgp :let @m = "p " . expand('<cWORD>')<CR>:TxSend(@m)<CR>
" print value of the pointer variable
nnoremap <buffer> mgo :let @m = "p * " . expand('<cWORD>')<CR>:TxSend(@m)<CR>
" quit debugger
nnoremap <buffer> mgq :call RemoveAllBreakpoints()<CR>:let @m = "q"<CR>:TxSend(@m)<CR>
