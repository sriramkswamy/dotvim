" eclim projects
" create a new project
nnoremap <buffer> <Space>mc :ProjectCreate <C-r>=expand("%:p:h")<CR> -n java
" list all the projects
nnoremap <buffer> <Space>ml :ProjectList<CR>
" build the project
nnoremap <buffer> <Space>mm :ProjectBuild<CR>
" run the project
nnoremap <buffer> <Space>mr :ProjectRun<CR>
" run list
nnoremap <buffer> <Space>mf :ProjectRunList<CR>
" Import
nnoremap <buffer> <Space>mi :ProjectImport<Space>
" close/quit
nnoremap <buffer> <Space>mq :ProjectClose<CR>
" delete
nnoremap <buffer> <Space>mx :ProjectDelete<CR>
" grep
nnoremap <buffer> <Space>ms :ProjectGrep<Space>
" tree toggle
nnoremap <buffer> <Space>mt :ProjectTreeToggle<CR>
" todo
nnoremap <buffer> <Space>md :ProjectTodo<CR>
" natures
nnoremap <buffer> <Space>mo :ProjectNatures<CR>
" nature add
nnoremap <buffer> <Space>ma :ProjectNatureAdd<Space>
" nature remove/erase
nnoremap <buffer> <Space>mu :ProjectNatureRemove<Space>
" problems
nnoremap <buffer> <Space>mp :ProjectProblems<CR>
" jump to
nnoremap <buffer> <Space>mj :ProjectOpen<CR>
" info
nnoremap <buffer> <Space>mk :ProjectInfo<CR>
" refresh
nnoremap <buffer> <Space>mg :ProjectRefreshAll<CR>
" rename
nnoremap <buffer> <Space>mn :ProjectRename<Space>
" settings
nnoremap <buffer> <Space>mw :ProjectSettings<CR>
" new source entry
nnoremap <buffer> <Space>me :NewSrcEntry<Space>
" variable list
nnoremap <buffer> <Space>mv :VariableList<CR>

" eclim java
" run the project
nnoremap <buffer> mm :Java<CR>
" check style
nnoremap <buffer> my :CheckStyle<CR>
" search/grep
nnoremap <buffer> mw :JavaSearch -p<Space>
" search current word
nnoremap <buffer> mj :JavaSearch<CR>
" generate doc
nnoremap <buffer> mk :JavaDocComment<CR>
" preview doc
nnoremap <buffer> md :JavaDocPreview<CR>
" search doc
nnoremap <buffer> mv :JavaDocSearch<Space>
" format
nnoremap <buffer> mf :JavaFormat<CR>
" heirarchy
nnoremap <buffer> mh :JavaCallHeirarchy!<CR>
" import
nnoremap <buffer> mi :JavaImport<Space>

" create classes, methods, etc
" class
nnoremap <buffer> mec :JavaNew class<Space>
" interface
nnoremap <buffer> mei :JavaNew interface<Space>
" abstract
nnoremap <buffer> mea :JavaNew abstract<Space>
" enum
nnoremap <buffer> mee :JavaNew enum<Space>
" @interface
nnoremap <buffer> meI :JavaNew @interface<Space>
" constructor
nnoremap <buffer> mek :JavaConstructor<CR>
" getter
nnoremap <buffer> meo :JavaGet<CR>
" setter
nnoremap <buffer> mes :JavaSet<CR>
" getter and setter
nnoremap <buffer> meb :JavaGetSet<CR>

" testing
" current file
nnoremap <buffer> mtf :JUnit %<CR>
" star command
nnoremap <buffer> mts :JUnit *<CR>
" pattern/package
nnoremap <buffer> mtt :JUnit<Space>

" debugging
" start
nnoremap <buffer> mgg :JavaDebugStart localhost 1044
" set breakpoint
nnoremap <buffer> mgs :JavaDebugBreakpointToggle!<CR>
" list breakpoints
nnoremap <buffer> mgl :JavaDebugBreakpointList!<CR>
" remove breakpoint
nnoremap <buffer> mgu :JavaDebugBreakpointRemove<CR>
" remove all breakpoints
nnoremap <buffer> mga :JavaDebugBreakpointRemove!<CR>
" step over
nnoremap <buffer> mgn :JavaDebugStep over<CR>
" step in
nnoremap <buffer> mgi :JavaDebugStep into<CR>
" step return
nnoremap <buffer> mgf :JavaDebugStep return<CR>
" status
nnoremap <buffer> mge :JavaDebugStatus<CR>
" stop
nnoremap <buffer> mgq :JavaDebugStop<CR>
