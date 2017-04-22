" maps
" current column title
nnoremap <buffer> mw :WhatColumn!<CR>
" current column number
nnoremap <buffer> mn :WhatColumn<CR>
" total number of columns
nnoremap <buffer> ml :NRColumns<CR>
" search in column
nnoremap <buffer> m/ :SearchInColumn //<Left>
" arrange columns
nnoremap <buffer> ma :ArrangeColumn<CR>
" unarrange columns
nnoremap <buffer> mu :UnArrangeColumn<CR>
" delete column
nnoremap <buffer> md :DeleteColumn<Space>
" header toggle
nnoremap <buffer> mh :HeaderToggle<CR>
" vheader toggle
nnoremap <buffer> mv :VHeaderToggle<CR>
" sort columns
nnoremap <buffer> mo :Sort<CR>
" copy columns
nnoremap <buffer> my :Column<CR>
" move columns
nnoremap <buffer> mj :MoveColumn<CR>
" sum of a column
nnoremap <buffer> m= :SumCol<CR>
" mean of a column
nnoremap <buffer> me :AvgCol<CR>
" analyze a column
nnoremap <buffer> mz :Analyze<CR>
" fold a column
nnoremap <buffer> mf :VertFold<CR>
" unfold a column
nnoremap <buffer> mk :VertFold!<CR>
" transpose
nnoremap <buffer> mt :Transpose<CR>
" substitute in columns
nnoremap <buffer> ms :%Substitute //<Left>
" count values
nnoremap <buffer> mc :CountCol<CR>
" max values
nnoremap <buffer> mx :MaxCol<CR>
" min values
nnoremap <buffer> mi :MinCol<CR>
" duplicate columns
nnoremap <buffer> mp :DupColumn<CR>
