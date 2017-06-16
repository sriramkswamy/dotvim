" some settings for markdown files
setlocal wrap
setlocal spell
setlocal formatoptions-=t

" Ultisnips add tex snippets
UltiSnipsAddFiletypes markdown.tex

" pandoc
" convert to html
nnoremap <buffer> mm :let @m = "pandoc " . expand('%') . " -o " . expand('%:r') . ".html && open -a /Applications/Safari.app " . expand('%:r') . ".html"<CR>:TxSend(@m)<CR>
" convert to pdf
nnoremap <buffer> mf :let @m = "pandoc " . expand('%') . " -V geometry:margin=2cm -o " . expand('%:r') . ".pdf && open " . expand('%:r') . ".pdf"<CR>:TxSend(@m)<CR>
" convert to rst with toc
nnoremap <buffer> mu :let @m = "pandoc " . expand('%') . " -o " . expand('%:r') . ".rst"<CR>:TxSend(@m)<CR>

" Vim Wiki local maps
" links
nnoremap <buffer> mlb :VimwikiBacklinks<CR>
nnoremap <buffer> mls :VimwikiGenerateLinks<CR>
nnoremap <buffer> mll :VimwikiCheckLinks<CR>
nmap <buffer> mld <Plug>VimwikiDeleteLink
nmap <buffer> mlr <Plug>VimwikiRenameLink
nmap <buffer> <CR> <Plug>VimwikiVSplitLink
nmap <buffer> <C-t> <Plug>VimwikiGoBackLink
nmap <buffer> mlj <Plug>VimwikiNextLink
nmap <buffer> mlk <Plug>VimwikiPrevLink
nmap <buffer> mz <Plug>VimwikiNormalizeLink
vmap <buffer> mz <Plug>VimwikiNormalizeLinkVisual

" Checklists
nmap <buffer> mx <Plug>VimwikiToggleListItem
nmap <buffer> mbr <Plug>VimwikiRemoveSingleCB
nmap <buffer> mbR <Plug>VimwikiRemoveCBInList
nmap <buffer> mbl <Plug>VimwikiIncreaseLvlSingleItem
nmap <buffer> mbL <Plug>VimwikiIncreaseLvlWholeItem
nmap <buffer> mbh <Plug>VimwikiDecreaseLvlSingleItem
nmap <buffer> mbH <Plug>VimwikiDecreaseLvlWholeItem
nmap <buffer> mbn <Plug>VimwikiRenumberList
nmap <buffer> mbN <Plug>VimwikiRenumberAllLists

" lines
nnoremap <buffer> ml- :VimwikiChangeSymbolTo -<CR>
nnoremap <buffer> ml- :VimwikiChangeSymbolInListTo -<CR>
nnoremap <buffer> ml* :VimwikiChangeSymbolTo *<CR>
nnoremap <buffer> ml* :VimwikiChangeSymbolInListTo *<CR>
nnoremap <buffer> ml# :VimwikiChangeSymbolTo #<CR>
nnoremap <buffer> ml# :VimwikiChangeSymbolInListTo #<CR>
nnoremap <buffer> mln :VimwikiChangeSymbolTo 1.<CR>
nnoremap <buffer> mlN :VimwikiChangeSymbolInListTo 1.<CR>
nnoremap <buffer> mla :VimwikiChangeSymbolTo c)<CR>
nnoremap <buffer> mlA :VimwikiChangeSymbolInListTo c)<CR>
nnoremap <buffer> mlu :VimwikiChangeSymbolTo A)<CR>
nnoremap <buffer> mlU :VimwikiChangeSymbolInListTo A)<CR>
nnoremap <buffer> mli :VimwikiChangeSymbolTo i)<CR>
nnoremap <buffer> mlI :VimwikiChangeSymbolInListTo i)<CR>
nnoremap <buffer> mlc :VimwikiChangeSymbolTo I)<CR>
nnoremap <buffer> mlC :VimwikiChangeSymbolInListTo I)<CR>

" tables
nnoremap <buffer> mtt :VimwikiTable<CR>
nmap <buffer> mtl <Plug>VimwikiTableMoveColumnLeft
nmap <buffer> mth <Plug>VimwikiTableMoveColumnRight
" diary
nmap <buffer> mwl <Plug>VimwikiDiaryGenerateLinks
nmap <buffer> mwk <Plug>VimwikiDiaryPrevDay
nmap <buffer> mwj <Plug>VimwikiDiaryNextDay
" headers
nmap <buffer> mh <Plug>VimwikiAddHeaderLevel
nmap <buffer> me <Plug>VimwikiRemoveHeaderLevel
" search
nnoremap <buffer> m/ :VimwikiSearch //<Left>
nnoremap <buffer> mi :VimwikiTOC<CR>
nnoremap <buffer> mg :VimwikiGoto<Space>
" tags
nnoremap <buffer> mtr :VimwikiRebuildTags<CR>
nnoremap <buffer> mts :VimwikiSearchTags<CR>
nnoremap <buffer> mtg :VimwikiGenerateTags<CR>
