" taskpaper navigation bindings
nmap <buffer> mt <Plug>TaskPaperToggleToday
nmap <buffer> mf <Plug>TaskPaperFocusProject
nmap <buffer> mj <Plug>TaskPaperNextProject
nmap <buffer> mk <Plug>TaskPaperPreviousProject

" taskpaper task bindings
nmap <buffer> md <Plug>TaskPaperToggleDone
nmap <buffer> mc <Plug>TaskPaperToggleCancelled
nmap <buffer> mx <Plug>TaskPaperShowCancelled
nmap <buffer> mh <Plug>TaskPaperArchiveDone
nmap <buffer> mp <Plug>TaskPaperMoveToProject

" search and fold
nmap <buffer> K <Plug>TaskPaperSearchKeyword
nmap <buffer> J <Plug>TaskPaperSearchTag
nmap <buffer> mz <Plug>TaskPaperFoldProjects
nmap <buffer> mn <Plug>TaskPaperFoldNotes

" tags
nnoremap <buffer> ma :normal! A<Space>@due()<CR>$i
nmap <buffer> ml <Plug>TaskPaperShowToday
