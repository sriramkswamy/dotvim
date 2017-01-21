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
nnoremap <buffer> mw :let @m = "open -a /Applications/Markoff.app " . expand('%')<CR>:TxSend(@m)<CR>
" view the resulting pdf document
nnoremap <buffer> mj :let @m = "open " . expand('%:r') . ".pdf"<CR>:TxSend(@m)<CR>
" browse the resulting html document
nnoremap <buffer> mb :let @m = "open -a /Applications/Safari.app " . expand('%:r') . ".html"<CR>:TxSend(@m)<CR>

" convert markdown to other formats
nnoremap <buffer> <Space>mp :Dispatch! pandoc % -V geometry:margin=2cm -o %:r.pdf<CR>
nnoremap <buffer> <Space>mo :Dispatch! pandoc % -o %:r.org<CR>
nnoremap <buffer> <Space>mr :Dispatch! pandoc % -o %:r.rst<CR>
nnoremap <buffer> <Space>mx :Dispatch! pandoc % -o %:r.tex<CR>
nnoremap <buffer> <Space>me :Dispatch! pandoc % -o %:r.epub<CR>
nnoremap <buffer> <Space>mh :Dispatch! pandoc % -o %:r.html<CR>
nnoremap <buffer> <Space>ml :Dispatch! multimarkdown -t opml % > %:r.opml<CR>
