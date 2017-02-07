" nvim-r plugin
" maps
nnoremap <buffer> K :call RAction("help")<CR>
" variable viewing
" what's the object
nmap <buffer> mh <Plug>RObjectPr
" show object
nmap <buffer> mH <Plug>RObjectStr
" show output
nmap <buffer> ma <Plug>RShowRout
" open the current variable in csv format
nmap <buffer> mj <Plug>RViewDF
" summary of the variable
nmap <buffer> my <Plug>RSummary
" list all variables in the current working space
nmap <buffer> mb <Plug>RListSpace
" update browser
nmap <buffer> mu <Plug>RUpdateObjBrowser
" open lists
nmap <buffer> m[ <Plug>ROpenLists
" close lists
nmap <buffer> m] <Plug>RCloseLists
" repl interaction
" run the current file
nmap <buffer> mm <Plug>RSendFile
" send the current para
nmap <buffer> msap <Plug>REDSendParagraph
" send the current function
nmap <buffer> msaf <Plug>RDSendFunction
" send the current function
nmap <buffer> msif <Plug>RDSendFunction
" send the current line
nmap <buffer> mss <Plug>RDSendLine
" send the current line and insert output
nmap <buffer> m<Space> <Plug>RDSendLineAndInsertOutput
" send the current selection
vmap <buffer> ms <Plug>REDSendSelection
" send the current selection and insert output
vmap <buffer> m<Space> <Plug>RSendSelAndInsertOutput
" simple plotting
" plot the vector
nmap <buffer> mfp <Plug>RPlot
" help
" show brief help on the function at point
nmap <buffer> m? <Plug>RObjectNames
" change the working directory
nmap <buffer> m~ <Plug>RSetwd
" other useful commands
" clear screen
nmap <buffer> mc <Plug>RClearConsole
" clear everything
nmap <buffer> mC <Plug>RClearAll

" debug helpers
" set breakpoint at the current line
nnoremap <buffer> mgs :call SetBreakpoint()<CR>:normal! Obrowser()<CR>j
" unset breakpoint at the current line
nnoremap <buffer> mgu :call UnsetBreakpoint()<CR>:normal! kdd<CR>
" step next
nnoremap <buffer> mgn :let @m = "n"<CR>:TxSend(@m)<CR>
" step in
nnoremap <buffer> mgi :let @m = "s"<CR>:TxSend(@m)<CR>
" step out
nnoremap <buffer> mgo :let @m = "f"<CR>:TxSend(@m)<CR>
" continue until next breakpoint or end of program
nnoremap <buffer> mgc :let @m = "c"<CR>:TxSend(@m)<CR>
" unset breakpoint at the current line
nnoremap <buffer> mga :call UnsetBreakpoint()<CR>:let @m = "undebug(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" delete all breakpoints
nnoremap <buffer> mgd :call SetBreakpoint()<CR>:let @m = "debug(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" rerun with debug
nnoremap <buffer> mgr :let @m = "options(error = browser)"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mgk :let @m = "options(error = NULL)"<CR>:TxSend(@m)<CR>
" get the traceback
nnoremap <buffer> mgw :let @m = "where"<CR>:TxSend(@m)<CR>
nnoremap <buffer> mgt :let @m = "traceback()"<CR>:TxSend(@m)<CR>
" quit debugging mode
nnoremap <buffer> mgq :call RemoveAllBreakpoints()<CR>:let @m = "Q"<CR>:TxSend(@m)<CR>
" quit r
nnoremap <buffer> mk :let @m = "q()"<CR>:TxSend(@m)<CR>
" metadata on variables
" size of the variable at point
nnoremap <buffer> mz :let @m = "dim(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" length of the variable at point
nnoremap <buffer> ml :let @m = "length(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" mean of the variable at point
nnoremap <buffer> me :let @m = "mean(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" get the type of the object
nnoremap <buffer> mw :let @m = "typeof(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" get the type of the object (from space to space)
nnoremap <buffer> mW :let @m = "typeof(" . expand('<cWORD>') . ")"<CR>:TxSend(@m)<CR>
" sum of the variable at point
nnoremap <buffer> m= :let @m = "sum(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
" cumulative sum of the variable at point
nnoremap <buffer> m+ :let @m = "cumsum(" . expand('<cword>') . ")"<CR>:TxSend(@m)<CR>
