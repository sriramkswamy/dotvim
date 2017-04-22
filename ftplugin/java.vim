" eclim projects
" create a new project
nnoremap <buffer> mpc :ProjectCreate <C-r>=expand("%:p:h")<CR> -n java
" list all the projects
nnoremap <buffer> mpl :ProjectList<CR>
" build the project
nnoremap <buffer> mpb :ProjectBuild<CR>
" run the project
nnoremap <buffer> mpr :ProjectRun<CR>
" run list
nnoremap <buffer> mpf :ProjectRunList<CR>
" Import
nnoremap <buffer> mpi :ProjectImport<Space>
" close/quit
nnoremap <buffer> mpq :ProjectClose<CR>
" delete
nnoremap <buffer> mpx :ProjectDelete<CR>
" grep
nnoremap <buffer> mps :ProjectGrep<Space>
" tree toggle
nnoremap <buffer> mpt :ProjectTreeToggle<CR>
" todo
nnoremap <buffer> mpd :ProjectTodo<CR>
" natures
nnoremap <buffer> mpo :ProjectNatures<CR>
" nature add
nnoremap <buffer> mpa :ProjectNatureAdd<Space>
" nature remove/erase
nnoremap <buffer> mpu :ProjectNatureRemove<Space>
" problems
nnoremap <buffer> mpp :ProjectProblems<CR>
" jump to
nnoremap <buffer> mpj :ProjectOpen<CR>
" info
nnoremap <buffer> mpk :ProjectInfo<CR>
" refresh
nnoremap <buffer> mpg :ProjectRefreshAll<CR>
" rename
nnoremap <buffer> mpn :ProjectRename<Space>
" settings
nnoremap <buffer> mpw :ProjectSettings<CR>
" new source entry
nnoremap <buffer> mpe :NewSrcEntry<Space>
" variable list
nnoremap <buffer> mpv :VariableList<CR>

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
