" taskpaper navigation bindings
nmap <buffer> mr <Plug>TaskPaperShowToday
nmap <buffer> mf <Plug>TaskPaperFocusProject
nmap <buffer> mj <Plug>TaskPaperNextProject
nmap <buffer> mk <Plug>TaskPaperPreviousProject

" taskpaper task bindings
nmap <buffer> mm <Plug>TaskPaperToggleDone
nmap <buffer> mx <Plug>TaskPaperToggleCancelled
nmap <buffer> mv <Plug>TaskPaperShowCancelled
nmap <buffer> mu <Plug>TaskPaperArchiveDone
nmap <buffer> mp <Plug>TaskPaperMoveToProject

" search and fold
nmap <buffer> K <Plug>TaskPaperSearchKeyword
nmap <buffer> J <Plug>TaskPaperSearchTag
nmap <buffer> mz <Plug>TaskPaperFoldProjects
nmap <buffer> mn <Plug>TaskPaperFoldNotes

" tags
nnoremap <buffer> md :<C-u>call taskpaper#toggle_tag('due')<CR>
nnoremap <buffer> mh :<C-u>call taskpaper#toggle_tag('high', '')<CR>
nnoremap <buffer> mc :<C-u>call taskpaper#toggle_tag('critical', '')<CR>
nnoremap <buffer> ml :<C-u>call taskpaper#toggle_tag('low', '')<CR>
nmap <buffer> mt <Plug>TaskPaperToggleToday
