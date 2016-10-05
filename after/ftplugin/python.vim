" Syntax checking
setlocal errorformat=%f:%l:\ %m
setlocal makeprg=pylint\ --reports=n\ --output-format=parseable
