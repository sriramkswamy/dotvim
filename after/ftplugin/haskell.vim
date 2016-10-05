" Syntax checking
setl errorformat=%E%f:%l:%c:,%C\ %.%m,%Z,%f:%l:%c:%m
setl makeprg=ghc\ --make\ %
