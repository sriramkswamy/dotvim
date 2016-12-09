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
