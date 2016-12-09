" set compiler
nnoremap <buffer> gC :compiler! rake<CR>
" Documentation
nnoremap <buffer> K :call ri#LookupNameUnderCursor()<CR>
