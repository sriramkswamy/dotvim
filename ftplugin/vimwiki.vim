" some settings for markdown files
setlocal wrap
setlocal spell

" Ultisnips add tex snippets
UltiSnipsAddFiletypes markdown.tex

" pandoc
" convert to html
nnoremap <buffer> mm :let @m = "pandoc " . expand('%') . " -o " . expand('%:r') . ".html && open -a /Applications/Safari.app " . expand('%:r') . ".html"<CR>:TxSend(@m)<CR>
" convert to pdf
nnoremap <buffer> mf :let @m = "pandoc " . expand('%') . " -V geometry:margin=2cm -o " . expand('%:r') . ".pdf && open " . expand('%:r') . ".pdf"<CR>:TxSend(@m)<CR>
" convert to rst with toc
nnoremap <buffer> mq :let @m = "pandoc " . expand('%') . " -o " . expand('%:r') . ".rst"<CR>:TxSend(@m)<CR>

" Vim Wiki local maps
" links
nnoremap <buffer> md :VimwikiBacklinks<CR>
nnoremap <buffer> mp :VimwikiGenerateLinks<CR>
nnoremap <buffer> mo :VimwikiCheckLinks<CR>
nmap <buffer> md <Plug>VimwikiDeleteLink
nmap <buffer> mr <Plug>VimwikiRenameLink
nmap <buffer> <CR> <Plug>VimwikiVSplitLink
nmap <buffer> <C-t> <Plug>VimwikiGoBackLink
nmap <buffer> mn <Plug>VimwikiNextLink
nmap <buffer> mN <Plug>VimwikiPrevLink
nmap <buffer> mz <Plug>VimwikiNormalizeLink
vmap <buffer> mz <Plug>VimwikiNormalizeLinkVisual

" Checklists
nmap <buffer> mx <Plug>VimwikiToggleListItem
nmap <buffer> mcr <Plug>VimwikiRemoveSingleCB
nmap <buffer> mcR <Plug>VimwikiRemoveCBInList
nmap <buffer> mcl <Plug>VimwikiIncreaseLvlSingleItem
nmap <buffer> mcL <Plug>VimwikiIncreaseLvlWholeItem
nmap <buffer> mch <Plug>VimwikiDecreaseLvlSingleItem
nmap <buffer> mcH <Plug>VimwikiDecreaseLvlWholeItem
nmap <buffer> mcn <Plug>VimwikiRenumberList
nmap <buffer> mcN <Plug>VimwikiRenumberAllLists

" lines
nnoremap <buffer> ml- :VimwikiChangeSymbolTo -<CR>
nnoremap <buffer> ml- :VimwikiChangeSymbolInListTo -<CR>
nnoremap <buffer> ml* :VimwikiChangeSymbolTo *<CR>
nnoremap <buffer> ml* :VimwikiChangeSymbolInListTo *<CR>
nnoremap <buffer> ml# :VimwikiChangeSymbolTo #<CR>
nnoremap <buffer> ml# :VimwikiChangeSymbolInListTo #<CR>
nnoremap <buffer> mln :VimwikiChangeSymbolTo 1.<CR>
nnoremap <buffer> mlN :VimwikiChangeSymbolInListTo 1.<CR>
nnoremap <buffer> mll :VimwikiChangeSymbolTo c)<CR>
nnoremap <buffer> mlL :VimwikiChangeSymbolInListTo c)<CR>
nnoremap <buffer> mlc :VimwikiChangeSymbolTo A)<CR>
nnoremap <buffer> mlC :VimwikiChangeSymbolInListTo A)<CR>
nnoremap <buffer> mli :VimwikiChangeSymbolTo i)<CR>
nnoremap <buffer> mlI :VimwikiChangeSymbolInListTo i)<CR>
nnoremap <buffer> mlr :VimwikiChangeSymbolTo I)<CR>
nnoremap <buffer> mlR :VimwikiChangeSymbolInListTo I)<CR>

" tables
nnoremap <buffer> mtt :VimwikiTable<CR>
nmap <buffer> mtl <Plug>VimwikiTableMoveColumnLeft
nmap <buffer> mth <Plug>VimwikiTableMoveColumnRight
" diary
nmap <buffer> mu <Plug>VimwikiDiaryGenerateLinks
nmap <buffer> mk <Plug>VimwikiDiaryPrevDay
nmap <buffer> mj <Plug>VimwikiDiaryNextDay
" headers
nmap <buffer> mh <Plug>VimwikiAddHeaderLevel
nmap <buffer> me <Plug>VimwikiRemoveHeaderLevel
" search
nnoremap <buffer> ms :VimwikiSearch //<Left>
nnoremap <buffer> mi :VimwikiTOC<CR>
nnoremap <buffer> mg :VimwikiGoto<Space>
" tags
nnoremap <buffer> mv :VimwikiRebuildTags<CR>
nnoremap <buffer> ma :VimwikiSearchTags<CR>
nnoremap <buffer> mw :VimwikiGenerateTags<CR>
