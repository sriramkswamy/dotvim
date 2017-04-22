" some settings for markdown files
setlocal wrap
setlocal spell

" pandoc
" convert to html
nnoremap <buffer> mh :let @m = "pandoc " . expand('%') . " -o " . expand('%:r') . ".html"<CR>:TxSend(@m)<CR>
" convert to pdf with toc
nnoremap <buffer> mm :let @m = "pandoc " . expand('%') . " -V geometry:margin=2cm -o " . expand('%:r') . ".pdf"<CR>:TxSend(@m)<CR>
" convert to latex with toc
nnoremap <buffer> mt :let @m = "pandoc " . expand('%') . " -o " . expand('%:r') . ".tex"<CR>:TxSend(@m)<CR>
" convert to rst with toc
nnoremap <buffer> me :let @m = "pandoc " . expand('%') . " -o " . expand('%:r') . ".rst"<CR>:TxSend(@m)<CR>
" convert to org with toc
nnoremap <buffer> mg :let @m = "pandoc " . expand('%') . " -o " . expand('%:r') . ".org"<CR>:TxSend(@m)<CR>
" open with markoff
nnoremap <buffer> mf :let @m = "open -a /Applications/Markoff.app " . expand('%')<CR>:TxSend(@m)<CR>
" view the resulting pdf document
nnoremap <buffer> mj :let @m = "open " . expand('%:r') . ".pdf"<CR>:TxSend(@m)<CR>
" browse the resulting html document
nnoremap <buffer> mb :let @m = "open -a /Applications/Safari.app " . expand('%:r') . ".html"<CR>:TxSend(@m)<CR>

" blog - hexo
" hexo generate and start server - view the blog
nnoremap <buffer> mv :let @m = "hexo generate && hexo server"<CR>:TxSend(@m)<CR>
" hexo deploy
nnoremap <buffer> md :let @m = "hexo deploy"<CR>:TxSend(@m)<CR>
" hexo publish
nnoremap <buffer> mi :let @m = "hexo publish"<CR>:TxSend(@m)<CR>
" hexo write
nnoremap <buffer> mw :!hexo new ""<Left>
" hexo clean
nnoremap <buffer> mu :let @m = "hexo clean"<CR>:TxSend(@m)<CR>

" convert markdown to other formats
nnoremap <buffer> mm :Dispatch! pandoc % -V geometry:margin=2cm -o %:r.pdf<CR>
nnoremap <buffer> mo :Dispatch! pandoc % -o %:r.org<CR>
nnoremap <buffer> mr :Dispatch! pandoc % -o %:r.rst<CR>
nnoremap <buffer> mx :Dispatch! pandoc % -o %:r.tex<CR>
nnoremap <buffer> mk :Dispatch! pandoc % -o %:r.epub<CR>
nnoremap <buffer> mh :Dispatch! pandoc % -o %:r.html<CR>
nnoremap <buffer> ml :Dispatch! multimarkdown -t opml % > %:r.opml<CR>
