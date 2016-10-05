" Syntax checking
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
setlocal makeprg=jshint

" Sample
" filename.js|12 col 1| Use the function form of ...
" filename.js|14 col 22| 'require' is not defined.
" filename.js|25 col 9| 'window' is not defined.
" filename.js|42 col 1| 'module' is not defined.
" ||
" || 4 errors
