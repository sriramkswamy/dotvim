" nvim-r plugin
" maps
nnoremap <buffer> K :call call RAction("help")<CR>
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
nnoremap <buffer> mds :call SetBreakpoint()<CR>:normal! Obrowser()<CR>j
" unset breakpoint at the current line
nnoremap <buffer> mdu :call UnsetBreakpoint()<CR>:normal! kdd<CR>
" step next
nnoremap <buffer> mdn :call g:SendCmdToR("n")<CR>
" step in
nnoremap <buffer> mdi :call g:SendCmdToR("s")<CR>
" step out
nnoremap <buffer> mdo :call g:SendCmdToR("f")<CR>
" continue until next breakpoint or end of program
nnoremap <buffer> mdc :call g:SendCmdToR("c")<CR>
" unset breakpoint at the current line
nnoremap <buffer> mda :call UnsetBreakpoint()<CR>:call RAction("undebug")<CR>
" delete all breakpoints
nnoremap <buffer> mdd :call SetBreakpoint()<CR>:call RAction("debug")<CR>
" rerun with debug
nnoremap <buffer> mdr :call g:SendCmdToR("options(error = browser)")<CR>
nnoremap <buffer> mdk :call g:SendCmdToR("options(error = NULL)")<CR>
" get the traceback
nnoremap <buffer> mdw :call g:SendCmdToR("where")<CR>
nnoremap <buffer> mdt :call g:SendCmdToR("traceback()")<CR>
" quit debugging mode
nnoremap <buffer> mdq :call RemoveAllBreakpoints()<CR>:call g:SendCmdToR("Q")<CR>

" start r
nmap mr <Plug>RStart
" quit r
nmap <buffer> mq <Plug>RClose<CR>
" metadata on variables
" size of the variable at point
nnoremap <buffer> mz :call RAction("dim")<CR>
" length of the variable at point
nnoremap <buffer> ml :call RAction("length")<CR>
" mean of the variable at point
nnoremap <buffer> me :call RAction("mean")<CR>
" get the type of the object
nnoremap <buffer> mw :call RAction("typeof")<CR>
" get the type of the object
vnoremap <buffer> mw :call RAction("typeof", "v")<CR>
" sum of the variable at point
nnoremap <buffer> m= :call RAction("sum")<CR>
" cumulative sum of the variable at point
nnoremap <buffer> m+ :call RAction("cumsum")<CR>

" operator-ish bindings
" send the current subword
nmap <buffer> msav vav<Plug>RESendSelection
nmap <buffer> msiv viv<Plug>RESendSelection
" send the current word
nmap <buffer> msaw vaw<Plug>RESendSelection
nmap <buffer> msiw viw<Plug>RESendSelection
" send the current para
nmap <buffer> msap <Plug>REDSendParagraph
nmap <buffer> msip <Plug>REDSendParagraph
" send the current function
nmap <buffer> msaf <Plug>RDSendFunction
nmap <buffer> msif <Plug>RDSendFunction
" send the current line
nmap <buffer> mss <Plug>RDSendLine
nmap <buffer> msil Plug>RDSendLine
nmap <buffer> msal Plug>RDSendLine
