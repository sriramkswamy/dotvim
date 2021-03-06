" outline
nnoremap <buffer> t :lvimgrep /^\s*\(struct\\|class\\|properties\\|classdef\).*/ %<CR>

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

" make
nnoremap <buffer> mm :AsyncRun make<CR>:copen<CR>
" build
nnoremap <buffer> mb :AsyncRun make -C build<CR>:copen<CR>
" cmake
nnoremap <buffer> mcb :AsyncRun cd build && cmake ..<CR>:copen<CR>
nnoremap <buffer> mcc :AsyncRun cmake .<CR>:copen<CR>

" Single file C compilation with different flags
" simple
nnoremap <buffer> mss :let @m = "gcc -O3 -Wall -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" simple with math support
nnoremap <buffer> msm :let @m = "gcc -O3 -Wall -lcblas -llapack -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" openmp without math
nnoremap <buffer> moo :let @m = "gcc -O3 -Wall -fopenmp -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" openmp with math
nnoremap <buffer> mom :let @m = "gcc -O3 -Wall -lcblas -llapack -fopenmp -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" armadillo simple
nnoremap <buffer> maa :let @m = "gcc -O3 -Wall -larmadillo -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" armadillo math
nnoremap <buffer> mam :let @m = "gcc -O3 -Wall -lcblas -llapack -larmadillo -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" intel compiler
nnoremap <buffer> mii :let @m = "icc -fast -O3 -Wall -g " . expand('%:t') . " -o " . expand('%:t:r') . ".in"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" intel compiler with openmp
nnoremap <buffer> mio :let @m = "icc -fast -O3 -Wall -fopenmp -g " . expand('%:t') . " -o " . expand('%:t:r') . ".in"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" armadillo intel
nnoremap <buffer> mia :let @m = "icc -O3 -Wall -larmadillo -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" cuda simple
nnoremap <buffer> muu :let @m = "nvcc -O3 -Wall -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" cuda math
nnoremap <buffer> mum :let @m = "nvcc -O3 -Wall -lcblas -llapack -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" cuda openmp
nnoremap <buffer> muo :let @m = "nvcc -O3 -Wall -fopenmp -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" mpi simple
nnoremap <buffer> mpp :let @m = "mpicc -O3 -Wall -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" mpi math
nnoremap <buffer> mpm :let @m = "mpicc -O3 -Wall -lcblas -llapack -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" hybrid math
nnoremap <buffer> mhm :let @m = "mpicc -O3 -Wall -lcblas -llapack -fopenmp -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" hybrid simple
nnoremap <buffer> mhh :let @m = "mpicc -O3 -Wall -fopenmp -g " . expand('%:t') . " -o " . expand('%:t:r') . ".out"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" run gcc compiled binary
nnoremap <buffer> mr :let @m = "./" . expand('%:t:r') . ".out "<CR>:Tmux send-keys '<C-r>m' C-m<S-Left><S-Left>
" run icc compiled binary
nnoremap <buffer> mi let @m = "./" . expand('%:t:r') . ".in "<CR>:Tmux send-keys '<C-r>m' C-m<S-Left><S-Left>
" run mpi compiled binary
nnoremap <buffer> me :let @m = "mpiexec ./" . expand('%:t:r') . ".out "<CR>:Tmux send-keys '<C-r>m' C-m<S-Left><S-Left>

" debugging
" call lldb
nnoremap <buffer> mdd :let @m = "lldb"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" create target
nnoremap <buffer> mde :let @m = "target create "<CR>:Tmux send-keys '<C-r>m' C-m<S-Left><S-Left>
" set breakpoint in current line
nnoremap <buffer> mds :call SetBreakpoint()<CR>:let @m = "breakpoint set --file " . expand('%') . " --line " . line('.')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" unset breakpoint in current line
nnoremap <buffer> mdx :call UnsetBreakpoint()<CR>:let @m = "breakpoint list"<CR>:TxSend(@m)<CR>:let @m = "breakpoint delete "<CR>:Tmux send-keys '<C-r>m' C-m<S-Left><S-Left>
" set breakpoint in current function
nnoremap <buffer> mdf :call SetBreakpoint()<CR>:let @m = "breakpoint set --name " line('<cword>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" set breakpoint in current class method
nnoremap <buffer> mdm :call SetBreakpoint()<CR>:let @m = "breakpoint set --method " . expand('%') . ":" . line('<cword>')<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" clear all breakpoints
nnoremap <buffer> mda :call RemoveAllBreakpoints()<CR>:let @m = "breakpoint delete"<CR>:TxSend(@m)<CR>:let @m = "Y"<CR>:Tmux send-keys '<C-r>m' C-m<CR>
" next line
nnoremap <buffer> mdn :let @m = "n"<CR>:TxSend(@m)<CR>
" continue
nnoremap <buffer> mdc :let @m = "c"<CR>:TxSend(@m)<CR>
" run
nnoremap <buffer> mdr :let @m = "r"<CR>:TxSend(@m)<CR>
" list all breakpoints
nnoremap <buffer> mdl :let @m = "breakpoint list"<CR>:TxSend(@m)<CR>
" step in
nnoremap <buffer> mdi :let @m = "s"<CR>:TxSend(@m)<CR>
" go one level up
nnoremap <buffer> mdk :let @m = "up"<CR>:TxSend(@m)<CR>
" print value of variable
nnoremap <buffer> mdp :let @m = "p "  . expand('<cWORD>'<CR>:TxSend(@m)<CR>
" print value of the pointer variable
nnoremap <buffer> mdo :let @m = "p * "  . expand('<cWORD>'<CR>:TxSend(@m)<CR>
" quit debugger
nnoremap <buffer> mdq :call RemoveAllBreakpoints()<CR>:let @m = "q"<CR>:TxSend(@m)<CR>

" get all the signs for breakpoints in vim {{{2
nnoremap <buffer> mdv :sign list mybreakpoint<CR>
