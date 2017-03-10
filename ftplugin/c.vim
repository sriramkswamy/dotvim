" rtags
" jump to parent
nnoremap <buffer> mu :call rtags#JumpToParent()<CR>
" find reference
nnoremap <buffer> mk :call rtags#FindRefsOfWordUnderCursor()<CR>
" find symbol
nnoremap <buffer> mj :call rtags#FindSymbolsOfWordUnderCursor()<CR>
" find virtuals
nnoremap <buffer> mv :call rtags#FindVirtuals()<CR>
" reindex file
nnoremap <buffer> mx :call rtags#ReindexFile()<CR>
" rename symbol
nnoremap <buffer> mn :call rtags#RenameSymbolUnderCursor()<CR>
" list projects
nnoremap <buffer> ml :call rtags#ProjectList()<CR>
" jump
nnoremap <buffer> J :call rtags#JumpTo(g:SAME_WINDOW)<CR>
" information
nnoremap <buffer> K :call rtags#SymbolInfo()<CR>

" Single file C compilation with different flags
" simple
nnoremap <buffer> <Space>ms :let @m = "g++ -O3 -Wall -g " . expand('%') . "-o " . expand('%:p:r') . ".out"<CR>:TxSend(@m)<CR>
" intel compiler
nnoremap <buffer> <Space>mc :let @m = "icc -fast -O3 -Wall -g " . expand('%') . "-o " . expand('%:p:r') . ".in"<CR>:TxSend(@m)<CR>
" with math support
nnoremap <buffer> <Space>mm :let @m = "g++ -Wall -lgsl -lcblas -llapack -O2 -g " . expand('%') . "-o " . expand('%:p:r') . ".out"<CR>:TxSend(@m)<CR>
" openmp
nnoremap <buffer> <Space>mo :let @m = "g++ -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g " . expand('%') . "-o " . expand('%:p:r') . ".out"<CR>:TxSend(@m)<CR>
" mpi
nnoremap <buffer> <Space>mi :let @m = "mpic++ -Wall -lgsl -lcblas -llapack -O2 -g " . expand('%') . "-o " . expand('%:p:r') . ".out"<CR>:TxSend(@m)<CR>
" hybrid
nnoremap <buffer> <Space>mh :let @m = "mpic++ -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g " . expand('%') . "-o " . expand('%:p:r') . ".out"<CR>:TxSend(@m)<CR>
" armadillo
nnoremap <buffer> <Space>ma :let @m = "g++ -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g " . expand('%') . "-o " . expand('%:p:r') . ".out"<CR>:TxSend(@m)<CR>
" run gcc compiled binary
nnoremap <buffer> <Space>mr :let @m = "./" . expand('%:p:r') . ".out"<CR>:TxSend(@m)<CR>
" run icc compiled binary
nnoremap <buffer> <Space>mx :let @m = "./" . expand('%:p:r') . ".in"<CR>:TxSend(@m)<CR>

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
