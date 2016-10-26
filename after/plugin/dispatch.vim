"""""""""""""""""""""""""""""""""""
"  Some useful dispatch commands  "
"""""""""""""""""""""""""""""""""""
" dependencies
" tpope/vim-dispatch

" regenerate ctags
nnoremap dc :Dispatch! ctags -R %:p:h<CR>

" post file as gist or clipboard as gist
nnoremap gp :Dispatch! gist % -cd ""<Left>
nnoremap gP :Dispatch! gist -Pcd ""<Left>

" asynchrous git operations
command! GitPush Dispatch! git push
command! GitPull Dispatch! git pull

" Single file C++ compilation with different flags
command! GppSimple Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -g -o %:p:r.out %
command! GppSingle Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GppOpenmp Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GppMpi Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpic++ -std=c++11 -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GppHybrid Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpic++ -std=c++11 -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GppArmadillo Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g -o %:p:r.out %

" Single file C compilation with different flags
command! GccSimple Dispatch! cd %:p:h <bar> gcc -std=c++11 -Wall -g -o %:p:r.out %
command! GccSingle Dispatch! cd %:p:h <bar> gcc! -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GccOpenmp Dispatch! cd %:p:h <bar> gcc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GccMpi Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GccHybrid Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GccArmadillo Dispatch! cd %:p:h <bar> gcc -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g -o %:p:r.out %

" count the number of words in the document
command! TexCount Dispatch! texcount %

" convert markdown to other formats
command! ConvertToPDF Dispatch! pandoc % -V geometry:margin=2cm -o %:r.pdf
command! ConvertToOrg Dispatch! pandoc % -o %:r.org
command! ConvertToRst Dispatch! pandoc % -o %:r.rst
command! ConvertToLatex Dispatch! pandoc % -o %:r.tex
command! ConvertToEpub3 Dispatch! pandoc % -o %:r.epub
command! ConvertToHTML5 Dispatch! pandoc % -o %:r.html
command! ConvertToOPML Dispatch! multimarkdown -t opml % > %:r.opml

" start rtags when in c or cpp files
autocmd FileType c,cpp :Dispatch! rdm &<CR>
