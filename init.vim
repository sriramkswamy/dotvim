set nocompatible " be iMproved
filetype off " required

" Autoinstall vim-plug {{{
	if has('nvim')
		if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall
		endif
	else
		if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall
		endif
	endif
" }}}

if has('nvim')
	call plug#begin('~/.config/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

" Interfaces {{{
	Plug 'Shougo/unite.vim'
	autocmd FileType unite call s:unite_my_settings()
	function! s:unite_my_settings()
		imap <buffer> <TAB>   <Plug>(unite_select_previous_line)
		imap <silent><buffer><expr> <C-s>     unite#do_action('split')
		imap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
	endfunction
	Plug 'Shougo/vimproc.vim', {'do': 'make'} " For 'async' and grep
	let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places
"}}}

" Buffer behaviour {{{
	set title
	" Leader and Local leader
	let mapleader="\<Space>"
	" Turn on numbering and relativenumber
	set number " Can be toggled with unimpaired's 'con'
	set relativenumber " Can be toggled with unimpaired's 'cor'
	" Automatically read and write buffers
	set autoread
	set autowrite
	" Hide unloaded buffers
	set hidden
	" Automatically scroll when I reach within 3 lines towards end of screen
	set sidescrolloff=3
	set scrolloff=3
	" Sync with OS clipboard
	set clipboard=unnamed
	" Color the current line
	set cursorline " Can be toggled with unimpaired's 'coc'
	" Ex commands
	set wildmenu
	set wildmode=list:longest,full
	set completeopt=menuone,longest,preview
	set history=1000
	" Undo history
	set undolevels=1000
	set undodir=~/.vim/undodir
	set undofile
	set undoreload=10000
	" Don't show bells
	set noerrorbells
	set novisualbell
	" No backups
	set nobackup
	set noswapfile
	set nowb
	let g:session_autosave = 'no'
	" Fold options
	set foldmethod=indent
	set foldnestmax=10
	set nofoldenable
	set foldlevel=2
	" Enable mouse
	set mouse=a
	" Set list characters - Can be toggled with unimpaired's 'col'
	set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:␣
	set showbreak=↪
	" Easier Regex
	set magic
	" Redraw lazily
	set nolazyredraw
	" Automatically wrap left and right when moving over lines
	set whichwrap+=<,>,h,l
	" Don't delay when you hit esc in terminal vim, this may make arrow keys not work well during ssh
	set timeoutlen=1000 ttimeoutlen=5
	" Show command and mode at the bottom
	set showcmd
	set showmode
	" Show statusline always
	set statusline=%t
	set laststatus=2
	" Set splits to the right
	set splitright
	" Gui fonts
	set guifont=Courier\ New:h14

	" This is basically because of the memory I developed from my Emacs experiments
	nnoremap <Leader>d :
	vnoremap <Leader>d :

	" Kill, save or quit
	nnoremap <silent> <Leader>k :bd!<CR>
	nnoremap <silent> <Leader>w :w<CR>
	nnoremap <silent> <Leader>q :q<CR>

	" 'Zoom' into the current buffer
	nnoremap <silent> Z :only<CR>

	" Navigate in insert mode
	inoremap <silent> <C-f> <right>
	inoremap <silent> <C-b> <left>

	" Map some more stuff similar to unimpaired
	nnoremap <silent> coj :setlocal colorcolumn=<CR>
	nnoremap <silent> cof :setlocal colorcolumn=80,100<CR>

	" Escape out of insert mode, because iTerm2 delays it assuming <Esc> to be an escape sequence
	inoremap <silent> <C-g> <Esc>

	" Colorschemes collection
	Plug 'flazz/vim-colorschemes'

	" UNIX commands
	Plug 'tpope/vim-eunuch'
	" BASH bindings in Ex mode
	Plug 'tpope/vim-rsi'

	" Add quickfix and location list to unite
	" Much better narrowing
	Plug 'osyo-manga/unite-quickfix'

	" Interface for location/quickfix lists
	let g:unite_source_menu_menus.lists = {
		\ 'description' : 'List interface',
		\}
	let g:unite_source_menu_menus.lists.command_candidates = [
		\[' Location List', 'Unite -silent -direction=botright -buffer-name=loclist location_list'],
		\[' Quickfix List', 'Unite -silent -direction=botright -buffer-name=qflist quickfix'],
		\[' Dispatch List', 'Copen'],
		\[' Error list', 'Neomake'],
		\[' Marks', 'Marks'],
		\]
	nnoremap <silent> <Leader>l :Unite -silent -quick-match -buffer-name=lists menu:lists<CR>

	" Undotree
	Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
	let g:undotree_WindowLayout = 2
	nnoremap <silent> U :UndotreeToggle<CR>

	" Statusline - Light line
	Plug 'itchyny/lightline.vim'
"}}}

" FileTypes {{{
	" File is large from 5mb - Vim wiki
	let g:LargeFile = 1024 * 1024 * 5
	augroup LargeFile
	autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
	augroup END
	function LargeFile()
		" no syntax highlighting etc
		set eventignore+=FileType
		" save memory when other file is viewed
		setlocal bufhidden=unload
		" is read-only (write with :w new_filename)
		setlocal buftype=nowrite
		" no undo possible
		setlocal undolevels=-1
		" display message
		autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed."
	endfunction

	" Ignore list
	set wildignore=/tmp/*,*.swp,*.bak,*.pyc,*.class,*.tmp,*.aux,*.mp4,*.pdf,*.cache,*.synctex.gz
	set wildignore+=*.gradle,*.plist,*.avi,*.mp3,*.flv,*.mkv,*.sparseimage,*.db,*.tbz,*.zip,*.so,*.crash
	set wildignore+=*.fls,*.latexmk_db,*.toc,*.mobi,*.epub,*.fdb_latexmk,*.apk,*.xmi,*.lic,*.iso,*.pages
	set wildignore+=*.key,*.pptx,*.xlsx,*.docx,*.rar

	" Recoginze extensions
	autocmd BufNewFile,BufReadPost *.rkt,*.rktl set filetype=scheme
	autocmd BufNewFile,BufReadPost *.md,*.mkd set filetype=markdown
	autocmd BufNewFile,BufReadPost *.clj set filetype=clojure
	autocmd BufNewFile,BufReadPost *.jl set filetype=julia
	autocmd BufNewFile,BufReadPost *.m set filetype=matlab
	autocmd BufNewFile,BufRead *.plt set filetype=gnuplot
	autocmd BufNewFile,BufRead *.r,*.R set filetype=R

	" TeX and Markdown support
	let g:tex_flavor='latex'
	let g:vim_markdown_disabled = 1
	let g:vim_markdown_math = 1
"}}}

" Text editing {{{
	set encoding=utf-8
	" Don't wrap the lines - Can be toggled with unimpaired's 'cow'
	set nowrap
	" Use backspace for multiple purposes while moving
	set backspace=indent,eol,start
	" Indentation
	set autoindent
	set smartindent
	set smarttab
	set tabstop=4
	set shiftwidth=4
	set shiftround
	" Max text width
	set textwidth=80
	" Don't include headers, use ctags
	set complete-=i

	" vim-omnicomplete activation
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd filetype html,markdown,ctp set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd filetype python set omnifunc=pythoncomplete#Complete
	autocmd filetype vim set omnifunc=syntaxcomplete#Complete
	autocmd filetype xml set omnifunc=xmlcomplete#CompleteTags
	autocmd filetype cpp set omnifunc=ccomplete#CompleteTags
	" Close after auto completion
	autocmd CompleteDone * pclose

	" Make 'Y' work like 'C' and 'D'
	nnoremap <silent> Y y$
	" Elementary splitting
	nnoremap <silent> gs Do<Esc>p^d0==k$

	" Dictionary toggle
	inoremap <silent> <C-d> <C-x><C-k>

	" Brackets and tag matching
	Plug 'jiangmiao/auto-pairs'

	" Trailing whitespace
	Plug 'ntpeters/vim-better-whitespace'
	let g:better_whitespace_filetypes_blacklist=['diff', 'qf', 'gitcommit', 'unite', 'vimfiler', 'help']
	autocmd FileType unite DisableWhitespace
	autocmd FileType vimfiler DisableWhitespace

	" Switch between some stuff - should define more as I go on
	Plug 'AndrewRadev/switch.vim', {'on': 'Switch'}
	let g:switch_mapping = "\\"
	let g:switch_custom_definitions =
		\ [
		\   ['TODO', 'DONE', 'NEXT', 'WAITING', 'HOLD', 'CANCELLED'],
		\   ['+', '-'],
		\   ['/', '*'],
		\ ]

	" Better '.' command
	Plug 'tpope/vim-repeat'
	" Mainly for the 'Subvert' command and coercions 'crs' for snake_case, 'crc' for camelCase, etc.
	Plug 'tpope/vim-abolish'
	" Better 'ga' command
	Plug 'tpope/vim-characterize'
	" Better number manipulation in dates
	Plug 'tpope/vim-speeddating'
	" Better A and I in visual block
	Plug 'kana/vim-niceblock'

	" Narrow region like in Emacs
	Plug 'chrisbra/NrrwRgn'
	vnoremap <Leader>] :NR<CR>
	nnoremap <Leader>] :NR<CR>
	nnoremap <Leader>[ :WidenRegion<CR>

	" Toggle registers - fancy
	Plug 'junegunn/vim-peekaboo'

	" Unicode stuff
	Plug 'sanford1/unite-unicode'
	inoremap <C-k> <C-o>:Unite -direction=botright -buffer-name=uuni -start-insert unicode<CR>
"}}}

" Text objects and operators {{{
	" Operate on 'pairs' - ]([)<Space>, ]([)e, ]([)l, ]([)q, ]([)b, ]([)f, ]([)a, ]([)t - uppercase for first/last
	Plug 'tpope/vim-unimpaired' " Also useful while toggling a few options

	" Semantic split/Join - gS and gJ
	Plug 'AndrewRadev/splitjoin.vim'

	" Move stuff sideways - in function calls or lists
	" Also adds text objects for arguments - (operator)i,/a, - in my case
	Plug 'AndrewRadev/sideways.vim'
	nnoremap <silent> [, :SidewaysLeft<CR>
	nnoremap <silent> ], :SidewaysRight<CR>
	omap a, <Plug>SidewaysArgumentTextobjA
	xmap a, <Plug>SidewaysArgumentTextobjA
	omap i, <Plug>SidewaysArgumentTextobjI
	xmap i, <Plug>SidewaysArgumentTextobjI

	" Better surround - cs/ds/ys(to add surrounding)
	Plug 'tpope/vim-surround'

	" Custom text objects
	Plug 'kana/vim-textobj-user'
	" Operate between characters - (operator)ie{char}/ae{char}
	Plug 'thinca/vim-textobj-between'
	let g:textobj_between_no_default_key_mappings = 1
	xmap ae <Plug>(textobj-between-a)
	omap ae <Plug>(textobj-between-a)
	xmap ie <Plug>(textobj-between-i)
	omap ie <Plug>(textobj-between-i)
	" Operate on comments - (operator)ic/ac/aC - doesn't work on python docstrings
	Plug 'glts/vim-textobj-comment'
	" Improves builtin sentence textobject for prose - (operator)is/as
	Plug 'reedes/vim-textobj-sentence'
	" Operate on the entire line - (operator)il/al - mostly used with custom operators
	Plug 'kana/vim-textobj-line'
	" Operate on the last searched pattern - (operator)i/ or a/
	Plug 'kana/vim-textobj-lastpat'
	" Operate on the indented blocks - (operator)ii/ai
	Plug 'kana/vim-textobj-indent'
	" Operate on functions in variable segments (between - or _ or camelCase) - (operator)iv/av
	Plug 'Julian/vim-textobj-variable-segment'
	" Operate on functions in C, Java and Vim - (operator)if/af
	Plug 'kana/vim-textobj-function'
	" Operate on functions in python - (operator)iy/ay and (operator)id/ad for class
	" Movement commands of ]([)pf and ]([)pc are added
	Plug 'bps/vim-textobj-python'
	let g:textobj_python_no_default_key_mappings = 1
	xmap ay <Plug>(textobj-python-funtion-a)
	omap ay <Plug>(textobj-python-funtion-a)
	xmap iy <Plug>(textobj-python-funtion-i)
	omap iy <Plug>(textobj-python-funtion-i)
	xmap ad <Plug>(textobj-python-class-a)
	omap ad <Plug>(textobj-python-class-a)
	xmap id <Plug>(textobj-python-class-i)
	omap id <Plug>(textobj-python-class-i)
	" Operate on the latex objects - (operator)i$/a$, i\/a\, iq/aq, iQ/aQ, ie/ae
	Plug 'rbonvall/vim-textobj-latex'
	" Operate on the entire file - (operator)ia/aa
	Plug 'kana/vim-textobj-entire'
	let g:textobj_entire_no_default_key_mappings = 1
	omap ia <plug>(textobj-entire-i)
	omap aa <plug>(textobj-entire-a)
	xmap ia <plug>(textobj-entire-i)
	xmap aa <plug>(textobj-entire-a)
	" Operate on URLs - (operator)iu/au
	Plug 'mattn/vim-textobj-url'
	" Operate on folds - (operator)iz/az
	Plug 'kana/vim-textobj-fold'
	" Operate on HTML/XML attributes - (operator)ix/ax
	Plug 'whatyouhide/vim-textobj-xmlattr'

	" Easy commenting - gc(motion/textobject)
	Plug 'tpope/vim-commentary'
	autocmd FileType matlab setlocal commentstring=%\ %s

	" Exchange stuff - cx(motion/textobject) - note that this is not a normal operator
	Plug 'tommcdo/vim-exchange'
	" 'ee' instead of 'w' because of my mapping of 'w' to ':vs'
	nmap [w cxiwge.
	nmap ]w cxiwee.
	nmap [W cxiWgE.
	nmap ]W cxiWEE.

	" Custom operators
	Plug 'kana/vim-operator-user'
	" Replace with contents of a register - {choose register}_(motion/textobject)
	" Works beautifully with 'peekaboo'
	Plug 'kana/vim-operator-replace'
	map _  <Plug>(operator-replace)
"}}}

" Multiple cursors - fancy {{{
	Plug 'terryma/vim-multiple-cursors'
	let g:multi_cursor_use_default_mapping=0
	let g:multi_cursor_next_key='<C-n>'
	let g:multi_cursor_prev_key='<C-p>'
	let g:multi_cursor_skip_key='<C-x>'
	let g:multi_cursor_quit_key='<C-g>'
"}}}

" Eclim - Eclipse plus Vim {{{
	let g:EclimCompletionMethod = 'omnifunc'
	let g:EclimShowQuickfixSigns = 0
	let g:EclimShowLoclistSigns = 0
	let g:EclimShowCurrentError = 0
	let g:EclimShowCurrentErrorBalloon = 0
"}}}

" Autocompletion {{{
	" VimCompletesMe - Minimalistic tab completion
	Plug 'ajh17/VimCompletesMe'
	autocmd FileType text,markdown,latex,tex let b:vcm_tab_complete = 'dict'
"}}}

" Snippets {{{
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Snippets collection
	" better key bindings for UltiSnipsExpandTrigger
	let g:UltiSnipsExpandTrigger = "<C-j>"
	let g:UltiSnipsJumpForwardTrigger = "<C-j>"
	let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
	let g:UltiSnipsListSnippets = "<C-h>"
"}}}

" Interface for Semantic Navigation {{{
	let g:unite_source_menu_menus.jumptoany= {
		\ 'description' : 'Jump to anything',
		\}
	let g:unite_source_menu_menus.jumptoany.command_candidates = [
		\['Jedi GoTo Command', 'call jedi#goto()'],
		\['Jedi GoTo Assignment', 'call jedi#goto_assignments()'],
		\['Jedi GoTo Definition', 'call jedi#goto_definitions()'],
		\['Jedi Rename', 'call jedi#rename()'],
		\['Jedi Rename Visual', 'call jedi#rename_visual()'],
		\['Eclim Project Create in directory', 'exe "ProjectCreate . -n " input("language: ")'],
		\['Eclim Project List', 'ProjectList'],
		\['Eclim Project New Source', 'exe "NewSrcEntry " input("source: ")'],
		\['Eclim Project Validate', 'Validate'],
		\['Eclim Java New Project', 'exe "NewProjectEntry " input("project: ")'],
		\['Eclim Java New Jar', 'exe "NewJarEntry " input("jar: ")'],
		\['Eclim Java New Var', 'exe "NewVarEntry " input("var: ")'],
		\['Eclim Java Create Variables', 'exe "VariableCreate " input("var: ")'],
		\['Eclim Java Delete Variables', 'exe "VariableDelete " input("var: ")'],
		\['Eclim Java List Variables', 'VariableList'],
		\['Eclim Java Maven Initialize', 'MvnRepo'],
		\['Eclim Java Maven Classpath',  'exe "Mvn " input("path: ")'],
		\['Eclim Java Ivy Initialize',  'exe "IvyRepo " input("path: ")'],
		\['Eclim Java Search', 'exe "JavaSearch " input("string: ")'],
		\['Eclim Java Context Search', 'JavaSearchContext'],
		\['Eclim Java Echo Classpath',  'exe "JavaClasspath " input("delimiter(optional): ")'],
		\['Eclim Java Project Status', 'Jps'],
		\['Eclim Java Debug Start',  'exe "JavaDebugStart " input("port: ")'],
		\['Eclim Java Toggle Breakpoint', 'JavaBreakpointToggle'],
		\['Eclim Java List Breakpoint', 'JavaBreakpointList'],
		\['Eclim Java Remove Breakpoint', 'JavaBreakpointRemove'],
		\['Eclim Java Debug Step',  'exe "JavaDebugStep " input("into/over/return: ")'],
		\['Eclim Java Debug Status', 'JavaDebugStatus'],
		\['Eclim Java Debug Suspend', 'JavaDebugThreadSuspendAll'],
		\['Eclim Java Debug Resume', 'JavaDebugThreadResumeAll'],
		\['Eclim Java Debug Stop', 'JavaDebugStop'],
		\['Eclim Java Doc Comment', 'JavaDocComment'],
		\['Eclim Java Doc Preview', 'JavaDocPreview'],
		\['Eclim Java Doc Search',  'exe "JavaDocSearch " input("string: ")'],
		\['Eclim Java Doc Execute', 'JavaDoc'],
		\['Eclim Java Code Format', 'JavaFormat'],
		\['Eclim Java Refactor Rename',  'exe "JavaRename " input("name: ")'],
		\['Eclim Java Refactor Move',  'exe "JavaMove " input("destination: ")'],
		\['Eclim Java Refactor Undo', 'RefactorUndo'],
		\['Eclim Java Refactor Undo Peek', 'RefactorUndoPeek'],
		\['Eclim Java Refactor Redo', 'RefactorRedo'],
		\['Eclim Java Refactor Redo Peek', 'RefactorRedoPeek'],
		\['Eclim Java Class Heirarchy', 'JavaHeirarchy'],
		\['Eclim Java Call Heirarchy', 'JavaCallHeirarchy'],
		\['Eclim Java Import', 'JavaImport'],
		\['Eclim Java Import Organized', 'JavaImportOrganized'],
		\['Eclim Java Getter', 'JavaGet'],
		\['Eclim Java Setter', 'JavaSet'],
		\['Eclim Java Getter and Setter', 'JavaGetSet'],
		\['Eclim Java Override/Implement', 'JavaImpl'],
		\['Eclim Java Delegate', 'JavaDelegate'],
		\['Eclim Java Unit Test', 'exe "JUnit " input("testname: ")'],
		\['Eclim Java Unit Find Test', 'JUnitFindTest'],
		\['Eclim Java Unit Test Results', 'JUnitResult'],
		\['Eclim Java Unit Test Stubs', 'JUnitImpl'],
		\['Eclim Java Ant Run', 'exe "Ant " input("target: ")'],
		\['Eclim Java Ant Doc', 'AntDoc'],
		\['Eclim Ruby New Library', 'exe "NewLibEntry " input("library: ")'],
		\['Eclim Ruby New Project', 'exe "NewProjectEntry " input("project: ")'],
		\['Eclim Ruby Add Interpreter', 'exe "RubyInterpreterAdd " input("interpreter: ")'],
		\['Eclim Ruby Remove Interpreter', 'exe "RubyInterpreterRemove " input("interpreter: ")'],
		\['Eclim Ruby Interpreter List', 'RubyInterpreterList'],
		\['Eclim Ruby Search', 'exe "RubySearch " input("string: ")'],
		\['Eclim Ruby Context Search', 'RubySearchContext'],
		\]
	nnoremap <silent> <Leader>j :Unite -direction=botright -silent -buffer-name=jumptoany menu:jumptoany<CR>
"}}}

" File/Buffer navigation {{{
	" Path for the builtin 'find' command
	set path=.,**

	" I use 'e','E','b' and 'B' for normal movements - tried changing but muscle memorized
	" I use 'cc' and 'cl' instead of 's' and 'S' - that seems more natural to me
	nnoremap <silent> w :vsplit<CR>
	nnoremap <silent> W :split<CR>
"}}}

" FZF - Blazingly fast fuzzy finder - for use in projects {{{
	Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}

	Plug 'junegunn/fzf.vim'
	nnoremap <silent> Q :History:
	nnoremap <silent> t :BTags<CR>
	nnoremap <silent> T :Tags<CR>
	nnoremap <silent> <Leader><Leader> :BLines<CR>
	nnoremap <silent> <Leader>b :Lines<CR>
	nnoremap <silent> <Leader>p :Files<CR>
	nnoremap <silent> <Leader>r :History<CR>
	nnoremap <silent> <Leader>u :Buffers<CR>
	nnoremap <silent> <Leader>x :Helptags<CR>
	nnoremap <silent> <Leader>/ :Locate<Space>
	inoremap <C-l> <C-o>:Snippets<CR>
"}}}

" Unite {{{
	nnoremap <silent> <Leader>. :Unite -direction=botright -buffer-name=resume resume<CR>

	" Unite yank history
	Plug 'Shougo/neoyank.vim'
	nnoremap <silent> <Leader>y :Unite -direction=botright -buffer-name=yankhistory history/yank<CR>
"}}}

" Project management {{{
	" Root to the project directory
	Plug 'airblade/vim-rooter'
	let g:rooter_disable_map = 1
	let g:rooter_patterns = ['.git/', '.svn/', '.hg/']
	let g:rooter_use_lcd = 1
	let g:rooter_change_directory_for_non_project_files = 1
	let g:rooter_silent_chdir = 1

	" Unite
	nnoremap <silent> <Leader>f :UniteWithBufferDir -direction=botright -buffer-name=findfile -start-insert directory directory/new<CR>

	" Vimfiler - fancier than netrw and integrates with Unite
	Plug 'Shougo/vimfiler.vim', {'on': 'VimFilerExplorer'}
	let g:vimfiler_as_default_explorer = 1
	nnoremap <silent> <Leader>n :VimFilerExplorer -project<CR>

	" Traverse files within a project - create a .projections.json first
	Plug 'tpope/vim-projectionist'
	nnoremap <Leader><Tab> :A<CR>
"}}}

" Motion {{{
	" Auto-center
	nnoremap <silent> <C-o> <C-o>zz
	nnoremap <silent> <C-i> <C-i>zz
	nnoremap <silent> G Gzz
	nnoremap <silent> k gk
	nnoremap <silent> j gj

	" '%' matching
	set showmatch
	" Tags for movement
	set tags=./tags;,tags

	" Occasionally I want to jump to that very precise point
	" Remaps 's' and 'S' and I'm cool with that
	Plug 'justinmk/vim-sneak'
"}}}

" Tags {{{
	" Auto generate tags and take care of it
	Plug 'ludovicchabant/vim-gutentags'
"}}}

" VCS changes {{{
	" Also adds text objects ah/ih for changeset but normal vim-diff changeset motions hold - ]([)c
	Plug 'mhinz/vim-signify'
	let g:signify_sign_change = '~'
	let g:signify_vcs_list = ['git', 'svn', 'hg', 'bzr', 'perforce']
	omap ih <Plug>(signify-motion-inner-pending)
	xmap ih <Plug>(signify-motion-inner-visual)
	omap ah <Plug>(signify-motion-outer-pending)
	xmap ah <Plug>(signify-motion-outer-visual)
	nnoremap <silent> gy :SignifyToggleHighlight<CR>
"}}}

" Git wrapper {{{
	" Git runtime files
	Plug 'tpope/vim-git'
	" Wrapper
	Plug 'tpope/vim-fugitive'
	autocmd BufReadPost fugitive://* set bufhidden=delete " Delete all fugitive buffers except this
	nnoremap <silent> gb :Gblame<CR>
	" Use this like a time machine - Traverse using unimpaired's ]q, [q, ]Q and [Q
	nnoremap <silent> gl :Glog<CR>
	" Gitk
	Plug 'gregsexton/gitv', {'on': 'Gitv'}
	nnoremap <silent> gv :Gitv<CR>

	" Support BitBucket in fugitive's Gbrowse
	Plug 'tommcdo/vim-fubitive', {'on': 'Gbrowse'}
	" Extend the blame command
	Plug 'tommcdo/vim-fugitive-blame-ext', {'on': 'Gblame'}
	" Extend the merge and branch commands
	Plug 'idanarye/vim-merginal'
	nnoremap <silent> gm :MerginalToggle<CR>

	" Interface for Git
	let g:unite_source_menu_menus.git = {
		\ 'description' : 'Fugitive interface',
		\}
	let g:unite_source_menu_menus.git.command_candidates = [
		\[' git status', 'Gstatus'],
		\[' git diff', 'Gvdiff'],
		\[' git commit', 'Gcommit'],
		\[' git stage/add', 'Gwrite'],
		\[' git checkout', 'Gread'],
		\[' git rm', 'Gremove'],
		\[' git cd', 'Gcd'],
		\[' git push', 'exe "Git! push -u origin " input("branch: ")'],
		\[' git pull', 'exe "Git! pull " input("branch: ")'],
		\[' git fetch', 'Gfetch'],
		\[' git merge', 'Gmerge'],
		\[' git browse', 'Gbrowse'],
		\[' git head', 'Gedit HEAD^'],
		\[' git parent', 'edit %:h'],
		\[' git log commit buffers', 'Glog --'],
		\[' git log current file', 'Glog -- %'],
		\[' git log last n commits', 'exe "Glog -" input("num: ")'],
		\[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
		\[' git log until date', 'exe "Glog --until=" input("day: ")'],
		\[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
		\[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
		\[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
		\[' git mv', 'exe "Gmove " input("destination: ")'],
		\[' git grep',  'exe "Ggrep " input("string: ")'],
		\[' git prompt', 'exe "Git! " input("command: ")'],
		\] " Append ' --' after log to get commit info commit buffers
	nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git menu:git<CR>
"}}}

" Searching {{{
	" Auto-center
	nnoremap <silent> n nzz
	nnoremap <silent> * *zz
	nnoremap <silent> # #zz
	nnoremap <silent> g* g*zz
	nnoremap <silent> g# g#zz

	" Ignore case sensitivity
	set ignorecase " Can be toggled with unimpaired's 'coi'
	set smartcase
	" Highlight search incrementally
	set hlsearch " Can be toggled with unimpaired's 'coh'
	set incsearch
	nnoremap <Leader>h :nohl<CR>
	" Grep
	set grepprg=grep\ -nH\ $*

	" '*' in visual mode
	Plug 'thinca/vim-visualstar'

	" See what you are changing with OverCommandLine
	Plug 'osyo-manga/vim-over'
	nnoremap <Leader>v :OverCommandLine<CR>

	" Anzu - search counter and a useful Unite backend
	Plug 'osyo-manga/vim-anzu'
	nmap n <Plug>(anzu-n-with-echo)
	nmap N <Plug>(anzu-N-with-echo)
	nmap * <Plug>(anzu-star-with-echo)
	nmap # <Plug>(anzu-sharp-with-echo)
	nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
	nnoremap <silent> <Leader>i :Unite -direction=botright -silent -buffer-name=uniteanzu anzu<CR>
"}}}

" Grep {{{
	" Search across multiple files in the code base
	if executable('ag')
		" Use ag in unite grep source.
		let g:unite_source_grep_command = 'ag'
		let g:unite_source_grep_default_opts =
		\ '-i --vimgrep --hidden --ignore ' .
		\ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
		let g:unite_source_grep_recursive_opt = ''
	elseif executable('ack-grep')
		" Use ack in unite grep source.
		let g:unite_source_grep_command = 'ack-grep'
		let g:unite_source_grep_default_opts =
		\ '-i --no-heading --no-color -k -H'
		let g:unite_source_grep_recursive_opt = ''
	endif
	nnoremap <silent> <Leader>e :UniteWithCursorWord -direction=botright -buffer-name=extract grep:-iR<CR>
	vnoremap <Leader>e :UniteWithCursorWord -direction=botright -buffer-name=extract grep:-iR<CR>
"}}}

" Languages/Syntax {{{
	" Covers most cases with auto-loading
	Plug 'sheerun/vim-polyglot'
	" C/C++ autocompletion
	Plug 'justmao945/vim-clang'
	let g:clang_c_options = '-std=gnu11'
	let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
	let g:clang_diagsopt = ''   " disable diagnostics
	" Python autocompletion
	Plug 'davidhalter/jedi-vim'
	let g:jedi#goto_command = ""
	let g:jedi#goto_assignments_command = ""
	let g:jedi#goto_definitions_command = ""
	let g:jedi#documentation_command = "K"
	let g:jedi#usages_command = ""
	let g:jedi#completions_command = "<C-Space>"
	let g:jedi#rename_command = ""
	" LaTeX already included in polyglot
	let g:LatexBox_Folding = 1
	" HTML
	Plug 'rstacruz/sparkup'
	" VimL
	Plug 'tpope/vim-scriptease', {'for': 'vim'}
	" Lisp
	Plug 'wlangstroth/vim-racket', {'for': ['lisp', 'scheme', 'racket']}
	" CSS
	Plug 'ap/vim-css-color', {'for': ['css','sass','scss','less']}
	" SQL
	Plug 'vim-scripts/dbext.vim', {'for': 'sql'}
"}}}

" Syntax checking {{{
Plug 'benekastah/neomake' " Async operations for Neovim
if has('nvim')
	autocmd! BufWritePost * Neomake
endif
"}}}

" Interface for markdown/pandoc {{{
	" Tables like org mode - also adds i|/a| as text objects
	Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeEnable'}
	autocmd FileType markdown TableModeEnable

	" Easy alignment - gz operator
	" I use it interactively
	Plug 'junegunn/vim-easy-align'
	xmap gz <Plug>(EasyAlign)
	nmap gz <Plug>(EasyAlign)

	" Interface for pandoc commands
	let g:unite_source_menu_menus.mdpandoc = {
		\ 'description' : 'Pandoc and Markdown interface',
		\}
	let g:unite_source_menu_menus.mdpandoc.command_candidates = [
		\[' mdpandoc neomake pdf', 'NeomakeSh pandoc % -V geometry:margin=2cm -o (%:r).pdf'],
		\[' mdpandoc neomake org', 'NeomakeSh pandoc % -o (%:r).org'],
		\[' mdpandoc neomake rst', 'NeomakeSh pandoc % -o (%:r).rst'],
		\[' mdpandoc neomake latex', 'NeomakeSh pandoc % -o (%:r).tex'],
		\[' mdpandoc neomake epub3', 'NeomakeSh pandoc % -o (%:r).epub'],
		\[' mdpandoc neomake html5', 'NeomakeSh pandoc % -o (%:r).html'],
		\[' mdpandoc dispatch pdf', 'Dispatch! pandoc % -V geometry:margin=2cm -o (%:r).pdf'],
		\[' mdpandoc dispatch org', 'Dispatch! pandoc % -o (%:r).org'],
		\[' mdpandoc dispatch rst', 'Dispatch! pandoc % -o (%:r).rst'],
		\[' mdpandoc dispatch latex', 'Dispatch! pandoc % -o (%:r).tex'],
		\[' mdpandoc dispatch epub3', 'Dispatch! pandoc % -o (%:r).epub'],
		\[' mdpandoc dispatch html5', 'Dispatch! pandoc % -o (%:r).html'],
		\[' Table csv to table', 'Tableize'],
		\[' Table delimiter to table', 'exe "Tableize/" input("delimiter: ") '],
		\[' Table add formula', 'TableAddFormula'],
		\[' Table evaluate formula', 'TableEvalFormulaLine'],
		\]
	nnoremap <silent> <Leader>o :Unite -silent -buffer-name=mdpandoc -direction=botright -start-insert menu:mdpandoc<CR>
"}}}

" REPL {{{
	let g:C_UseTool_cmake = 'yes'
	let g:C_UseTool_doxygen = 'yes'

	" Go to normal mode
	if has('nvim')
		tnoremap <C-g> <C-\><C-n>
	endif

	" Awesome 'async' substitute - useful when in Tmux
	Plug 'tpope/vim-dispatch'

	" Compilation menu
	let g:unite_source_menu_menus.umake = {
		\ 'description' : 'Compilation menu',
		\} " Note that Neomake is already plugged in near syntastic
	let g:unite_source_menu_menus.umake.command_candidates = [
	\[' Dispatch! g++ make', 'Dispatch!'],
	\[' Dispatch! g++ single', 'Dispatch! g++ -Wall -lgsl -lcblas -llapack -g %'],
	\[' Dispatch! g++ openmp', 'Dispatch! g++ -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' Dispatch! g++ mpi', 'Dispatch! /usr/local/openmpi/bin/mpic++ -Wall -lgsl -lcblas -llapack -g %'],
	\[' Dispatch! g++ hybrid', 'Dispatch! /usr/local/openmpi/bin/mpic++ -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' NeomakeSh g++ make', 'NeomakeSh make'],
	\[' NeomakeSh g++ single', 'NeomakeSh g++ -Wall -lgsl -lcblas -llapack -g %'],
	\[' NeomakeSh g++ openmp', 'NeomakeSh g++ -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' NeomakeSh g++ mpi', 'NeomakeSh /usr/local/openmpi/bin/mpic++ -Wall -lgsl -lcblas -llapack -g %'],
	\[' NeomakeSh g++ hybrid', 'NeomakeSh /usr/local/openmpi/bin/mpic++ -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' Dispatch! gcc make', 'Dispatch'],
	\[' Dispatch! gcc single', 'Dispatch gcc! -Wall -lgsl -lcblas -llapack -g %'],
	\[' Dispatch! gcc openmp', 'Dispatch! gcc -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' Dispatch! gcc mpi', 'Dispatch! /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -g %'],
	\[' Dispatch! gcc hybrid', 'Dispatch! /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' NeomakeSh gcc make', 'NeomakeSh make'],
	\[' NeomakeSh gcc single', 'NeomakeSh gcc -Wall -lgsl -lcblas -llapack -g %'],
	\[' NeomakeSh gcc openmp', 'NeomakeSh gcc -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' NeomakeSh gcc mpi', 'NeomakeSh /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -g %'],
	\[' NeomakeSh gcc hybrid', 'NeomakeSh /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' Eclim Java', 'Java'],
	\]
	nnoremap <silent> <Leader>m :Unite -direction=botright -buffer-name=umake -start-insert menu:umake<CR>

	" Launch appropriate REPL
	Plug 'benmills/vimux'
	
	" Interface for Tmux
	let g:unite_source_menu_menus.tmux = {
		\ 'description' : 'Tmux interaction',
		\}
	let g:unite_source_menu_menus.tmux.command_candidates = [
		\[' tmux list sessions', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:list-sessions'],
		\[' tmux list windows', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:list-windows'],
		\[' tmux list panes', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:list-panes'],
		\[' tmux list clients', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:list-clients'],
		\[' tmux list keys', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:list-keys'],
		\[' tmux list commands', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:list-commands'],
		\[' tmux list buffers', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:list-buffers'],
		\[' tmux show buffer', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:show-buffer'],
		\[' tmux show options', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:show-options'],
		\[' tmux show window options', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:show-window-options'],
		\[' tmux show environment', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:show-environment'],
		\[' tmux show messages', 'Unite -silent -buffer-name=tmux output/shellcmd:tmux:show-messages'],
		\[' tmux run R', 'call VimuxRunCommandInDir("R",0)'],
		\[' tmux run julia', 'call VimuxRunCommandInDir("julia",0)'],
		\[' tmux run matlab', 'call VimuxRunCommandInDir("matlab",0)'],
		\[' tmux run scheme', 'call VimuxRunCommandInDir("racket",0)'],
		\[' tmux run python', 'call VimuxRunCommandInDir("ipython",0)'],
		\[' tmux run shell', 'call VimuxRunCommandInDir("pwd",0)'],
		\]
	nnoremap <silent> <Leader>t :Unite -direction=botright -silent -buffer-name=tmux -start-insert menu:tmux<CR>
"}}}

	" Send to Tmux - super useful
	Plug 'jpalardy/vim-slime'
	let g:slime_target = "tmux"
	let g:slime_python_ipython = 1
	nnoremap <silent> <Leader>s :SlimeSend<CR>
	vnoremap <silent> <Leader>s :SlimeSend<CR>

	" Tmux and Vim navigation
	" Arrows = Vim splits outside Tmux and Tmux splits inside Tmux
	" C-<key> for Vim splits when in Tmux
	Plug 'christoomey/vim-tmux-navigator'
	let g:tmux_navigator_no_mappings = 1
	nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
	nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
	nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
	nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
	" Ugly hack to make sure C-h gets parsed correctly
	if has('nvim')
		nmap <silent> <BS> :<C-u>TmuxNavigateLeft<CR>
	endif

	" Zoom and split when in Tmux(>v1.8)
	if exists('$TMUX')
		nnoremap <silent> <Leader>z :call system("tmux resize-pane -Z")<CR>
		nnoremap <silent> + :call system("tmux split-window -h")<CR>
		nnoremap <silent> - :call system("tmux split-window -v")<CR>
	endif
"}}}

" Fancy stuff - completely useless but what the heck {{{
	" Notes - not completely useless
	Plug 'Shougo/junkfile.vim'
	let g:junkfile#directory = "~/Dropbox/notes"

	" Approximate Colorschemes
	Plug 'godlygeek/csapprox'

	" Gists
	Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
	let g:gist_open_browser_after_post = 1
	let g:gist_clip_command = 'pbcopy'

	" Google
	Plug 'szw/vim-g'
	nnoremap <Leader>\ :Google<Space>
	vnoremap <Leader>\ :Google<CR>

	" Troll stopper
	Plug 'vim-utils/vim-troll-stopper'

	" Browse dash docsets
	Plug 'rizzatti/dash.vim'
	nnoremap <Leader>c :Dash<Space>
	vnoremap <Leader>c :Dash
"}}}

call plug#end()

" Enable fuzzy matching and sorting in all Unite functions
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" More Unite menus {{{
	" Interface for OS interaction
	let g:unite_source_menu_menus.osinteract = {
		\ 'description' : 'OS interaction and configs',
		\}
	let g:unite_source_menu_menus.osinteract.command_candidates = [
		\[' generate tags in buffer dir', 'cd %:p:h | Dispatch! ctags .'],
		\[' cd to buffer directory', 'cd %:p:h'],
		\[' cd to project directory', 'Rooter'],
		\[' create .projections.json', 'cd %:p:h | e .projections.json'],
		\[' Source vimrc', 'so $MYVIMRC'],
		\[' Edit vimrc', 'e $MYVIMRC'],
		\[' Scratch notes', 'Unite -buffer-name=unotes -start-insert junkfile'],
		\[' Colorschemes', 'Colors'],
		\]
	nnoremap <silent> <Leader>a :Unite -silent -buffer-name=osinteract -quick-match menu:osinteract<CR>
"}}}

" Setup plugins, indents and syntax
filetype plugin indent on
syntax on

" Set colorscheme
set background=light " Can be toggled with unimpaired's 'cob'
colorscheme lucius
