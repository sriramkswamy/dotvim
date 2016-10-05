" Syntax checking
setlocal errorformat=%EIn\ %f\ line\ %l:,%Z%m
setlocal makeprg=shellcheck

" Sample
" installmac|5 error|  local fmt="$1"; shift
" ||   ^-- SC2039: In POSIX sh, 'local' is undefined.
" ||
" ||
