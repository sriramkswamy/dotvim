" nvim-r plugin
" maps
nnoremap <buffer> K :call RAction("help")<CR>
" goto next chunk
nmap <buffer> mj <Plug>RNextRChunk
" goto previous chunk
nmap <buffer> mk <Plug>RPreviousRChunk
" open the current generated pdf
nmap <buffer> ma <Plug>ROpenPDF
" list all variables in the current working space
nmap <buffer> mb <Plug>RMakePDFKb
" run the current file
nmap <buffer> mm <Plug>RMakePDFK
" repl interaction
" send the current chunk
nmap <buffer> mss <Plug>RDSendChunk
