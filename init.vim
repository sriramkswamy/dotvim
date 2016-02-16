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

" Buffer behaviour {{{
	set title
	" Turn on numbering and relativenumber
	set number " Can be toggled with 'con'
	set relativenumber " Can be toggled with 'cor'
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
	set cursorline " Can be toggled with 'coc'
	" Ex commands
	set wildmenu
	set wildmode=list:longest,full
	set completeopt=menuone,longest,preview
	set history=50
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
	set foldmethod=manual
	set foldnestmax=10
	set nofoldenable
	set foldlevel=2
	" Enable mouse
	set mouse=a
	" Set list characters - Can be toggled with 'col'
	set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:␣
	set listchars+=trail:-
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
	" Set splits to the right
	set splitright
	set splitbelow
	" Gui fonts
	set guifont=Fira\ Mono:h12

	" Set leader
	let mapleader="\<Space>"

	" This is basically because of the memory I developed from my Emacs experiments
	nnoremap <Leader>d :
	vnoremap <Leader>d :

	" <C-v> puts it in operator pending mode, I think and the best part is 'I'
	" and 'A' work and is very useful
	nnoremap    v    <C-V>
	nnoremap  <C-V>    v

	" Help
	nnoremap <Leader>x :help<Space>

	" Kill, save or quit
	nnoremap <silent> <Leader>k :bd!<CR>
	nnoremap <silent> <Leader>w :w<CR>
	nnoremap <silent> <Leader>q :q<CR>

	" Put me in command history instead
	nnoremap <silent> Q q:

	" Keep me in visual mode
	vnoremap <silent> > >gv
	vnoremap <silent> < <gv

	" Put me in search history instead
	nnoremap <silent> M q/

	" 'Zoom' into the current buffer
	nnoremap <silent> Z :only<CR>

	" Navigate in insert mode
	inoremap <silent> <C-f> <right>
	inoremap <silent> <C-b> <left>

	" Toggle few options - inspired by unimpaired
	nnoremap con :<C-u>setlocal number!<CR>
	nnoremap cor :<C-u>setlocal relativenumber!<CR>
	nnoremap cow :<C-u>setlocal wrap!<CR>
	nnoremap coc :<C-u>setlocal cursorline!<CR>
	nnoremap col :<C-u>setlocal list!<CR>
	nnoremap cos :<C-u>setlocal spell!<CR>
	nnoremap coi :<C-u>setlocal ignorecase!<CR>
	nnoremap cob :set background=<C-R>=&background == 'dark' ? 'light' : 'dark'<CR><CR>
	nnoremap coh :setlocal hlsearch!<CR>

	" Map some more stuff similar to unimpaired
	nnoremap <silent> coj :setlocal colorcolumn=<CR>
	nnoremap <silent> cof :setlocal colorcolumn=80,100<CR>

	" Escape out of insert mode, because iTerm2 delays it assuming <Esc> to be an escape sequence
	inoremap <silent> <C-g> <Esc>

	" Readline-ish bindings in Command-line mode
	cnoremap <C-a> <Home>
	cnoremap <C-e> <End>

	" Colorscheme
	Plug 'NLKNguyen/papercolor-theme'

	" Undotree
	Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
	let g:undotree_WindowLayout = 2
	nnoremap <silent> U :UndotreeToggle<CR>
"}}}

" Statusline - from scrooloose {{{
	" Basic setup
	set statusline =%#identifier#
	set statusline+=[%f]    "tail of the filename
	set statusline+=%*

	"display a warning if fileformat isnt unix
	set statusline+=%#warningmsg#
	set statusline+=%{&ff!='unix'?'['.&ff.']':''}
	set statusline+=%*

	"display a warning if file encoding isnt utf-8
	set statusline+=%#warningmsg#
	set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
	set statusline+=%*

	set statusline+=%y      "filetype

	"read only flag
	set statusline+=%#identifier#
	set statusline+=%r
	set statusline+=%*

	"modified flag
	set statusline+=%#warningmsg#
	set statusline+=%m
	set statusline+=%*

	"display a warning if &paste is set
	set statusline+=%#error#
	set statusline+=%{&paste?'[paste]':''}
	set statusline+=%*

	"display a warning if &paste is set
	set statusline+=%#error#
	set statusline+=%{&paste?'[paste]':''}
	set statusline+=%*

	set statusline+=%=      "left/right separator
	set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
	set statusline+=%c,     "cursor column
	set statusline+=%l      "cursor line/total lines
	set statusline+=\ %P    "percent through file
	set laststatus=2

	"return the syntax highlight group under the cursor ''
	function! StatuslineCurrentHighlight()
	  let name = synIDattr(synID(line('.'),col('.'),1),'name')
	  if name == ''
		return ''
	  else
		return '[' . name . ']'
	  endif
	endfunction

	"return '[\s]' if trailing white space is detected
	"return '' otherwise
	function! StatuslineTrailingSpaceWarning()
	  if !exists("b:statusline_trailing_space_warning")
		if !&modifiable
		  let b:statusline_trailing_space_warning = ''
		  return b:statusline_trailing_space_warning
		endif
		if search('\s\+$', 'nw') != 0
		  let b:statusline_trailing_space_warning = '[\s]'
		else
		  let b:statusline_trailing_space_warning = ''
		endif
	  endif
	  return b:statusline_trailing_space_warning
	endfunction
	set statusline+=%{StatuslineTrailingSpaceWarning()}
	"recalculate the trailing whitespace warning when idle, and after saving
	autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

	" Neomake
	set statusline+=\ %#ErrorMsg#%{neomake#statusline#LoclistStatus(':\ ')}
"}}}

" Unite {{{
	Plug 'Shougo/unite.vim'
	autocmd FileType unite call s:unite_my_settings()
	function! s:unite_my_settings()
		imap <buffer> <TAB>   <Plug>(unite_select_previous_line)
		imap <silent><buffer><expr> <C-s>     unite#do_action('split')
		imap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
	endfunction
	let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places

	" Unite default functionality maps
	nnoremap <silent> <Leader>f :UniteWithBufferDir -direction=botright -buffer-name=findfile -start-insert directory directory/new<CR>
	nnoremap <silent> <Leader>u :Unite -direction=botright -buffer-name=bufswitch -start-insert buffer buffer_tab<CR>
	nnoremap <silent> <Leader>, :Unite -buffer-name=mapping mapping<CR>
	nnoremap <silent> <Leader>. :Unite -direction=botright -buffer-name=resume resume<CR>
	nnoremap <silent> <Leader><Leader> :Unite -direction=botright -buffer-name=lines -start-insert line<CR>
	nnoremap <silent> <Leader>b :Unite -direction=botright -buffer-name=lines -start-insert line:args<CR>
	nnoremap <silent> <Leader>p :UniteWithProjectDir -start-insert -buffer-name=project -direction=botright file_rec file/new<CR>
	inoremap <C-l> <C-o>:Unite -buffer-name=snippets -start-insert ultisnips<CR>

	" Vimfiler - fancier than netrw and integrates with Unite
	Plug 'Shougo/vimfiler.vim', {'on': 'VimFilerExplorer'}
	let g:vimfiler_as_default_explorer = 1
	nnoremap <silent> <Leader>n :VimFilerExplorer -project<CR>

	" Outline
	Plug 'Shougo/unite-outline'
	nnoremap <silent> t :Unite -buffer-name=outline -vertical -winwidth=35 outline<CR>

	" Unite oldfiles
	Plug 'Shougo/neomru.vim'
	nnoremap <silent> <Leader>r :Unite -start-insert -buffer-name=oldfiles -direction=botright file_mru<CR>

	" Unite yank history
	Plug 'Shougo/neoyank.vim'
	nnoremap <silent> <Leader>y :Unite -direction=botright -buffer-name=yankhistory history/yank<CR>
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
	" Dictionary
	set dictionary+=/usr/share/dict/words
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
	nnoremap <silent> gS Do<Esc>p^d0==k$

	" Switch between stuff
	Plug 'AndrewRadev/switch.vim'
	let g:switch_mapping = "\\"
	let g:switch_custom_definitions =
				\ [
				\   ['TODO', 'DONE', 'HOLD', 'CANCELLED'],
				\   ['*', '/', '+', '-', '%', '^']
				\ ]
	autocmd FileType gitrebase let b:switch_custom_definitions =
				\ [
				\   [ 'pick', 'reword', 'edit', 'squash', 'fixup', 'exec' ]
				\ ]
	autocmd FileType tex,plaintex let b:switch_custom_definitions =
				\ [
				\    [ '\\tiny', '\\scriptsize', '\\footnotesize', '\\small', '\\normalsize', '\\large', '\\Large', '\\LARGE', '\\huge', '\\Huge' ],
				\    [ '\\displaystyle', '\\scriptstyle', '\\scriptscriptstyle', '\\textstyle' ],
				\    [ '\\part', '\\chapter', '\\section', '\\subsection', '\\subsubsection', '\\paragraph', '\\subparagraph' ],
				\    [ 'part:', 'chap:', 'sec:', 'subsec:', 'subsubsec:' ],
				\    [ 'article', 'report', 'book', 'letter', 'slides' ],
				\    [ 'a4paper', 'a5paper', 'b5paper', 'executivepaper', 'legalpaper', 'letterpaper', 'beamer', 'subfiles', 'standalone' ],
				\    [ 'onecolumn', 'twocolumn' ],
				\    [ 'oneside', 'twoside' ],
				\    [ 'draft', 'final' ],
				\    [ 'AnnArbor', 'Antibes', 'Bergen', 'Berkeley',
				\      'Berlin', 'Boadilla', 'CambridgeUS', 'Copenhagen', 'Darmstadt',
				\      'Dresden', 'Frankfurt', 'Goettingen', 'Hannover', 'Ilmenau',
				\      'JuanLesPins', 'Luebeck', 'Madrid', 'Malmoe', 'Marburg',
				\      'Montpellier', 'PaloAlto', 'Pittsburgh', 'Rochester', 'Singapore',
				\      'Szeged', 'Warsaw' ]
				\ ]

	" Better '.' command
	Plug 'tpope/vim-repeat'
	" Mainly for 'Subvert' command coercions 'crs' for snake_case, 'crc' for camelCase, etc.
	Plug 'tpope/vim-abolish'
	" Better 'ga' command
	Plug 'tpope/vim-characterize'
	" Common *nix commands within Vim. 'Sudo' is pretty useful
	Plug 'tpope/vim-eunuch'
"}}}

" Text objects, operators and motions {{{
	" Move the current line
	nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
	nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

	" Blank line
	nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
	nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

	" Better surround - cs/ds/ys(to add surrounding)
	Plug 'tpope/vim-surround'

	" Custom text objects
	Plug 'kana/vim-textobj-user'
	" Operate on comments - (operator)ic/ac/aC - doesn't work on python docstrings
	Plug 'glts/vim-textobj-comment'
	" Improves builtin sentence textobject for prose - (operator)is/as
	Plug 'reedes/vim-textobj-sentence'
	" Operate on the entire line - (operator)il/al - mostly used with custom operators
	Plug 'kana/vim-textobj-line'
	" Operate on the indented blocks - (operator)ii/ai
	Plug 'kana/vim-textobj-indent'
	" Operate on functions in variable segments (between - or _ or camelCase) - (operator)iv/av
	Plug 'Julian/vim-textobj-variable-segment'
	" Operate on functions in C, Java and Vim - (operator)if/af
	Plug 'kana/vim-textobj-function'
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
	" Operate on arguments - (operator)i,/a,
	Plug 'AndrewRadev/sideways.vim'
	nnoremap [, :SidewaysLeft<cr>
	nnoremap ], :SidewaysRight<cr>
	omap a, <Plug>SidewaysArgumentTextobjA
	xmap a, <Plug>SidewaysArgumentTextobjA
	omap i, <Plug>SidewaysArgumentTextobjI
	xmap i, <Plug>SidewaysArgumentTextobjI

	" From romainl
	for char in [ '.', ':', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '`' ]
	    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
	    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
	    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
	    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
	endfor

	" Easy commenting - gc(motion/textobject)
	Plug 'tpope/vim-commentary'
	autocmd FileType matlab setlocal commentstring=%\ %s
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
	nnoremap <silent> <Leader>j :Unite -direction=botright -silent -buffer-name=jumptoany -start-insert menu:jumptoany<CR>
"}}}

" File/Buffer navigation {{{
	" Path for the builtin 'find' command
	set path=.,**

	" I use 'e','E','b' and 'B' for normal movements - tried changing but muscle memorized
	nnoremap <silent> w :vsplit<CR>
	nnoremap <silent> W :split<CR>

	" Quickfix and Location list maps
	nnoremap <Leader>l :lopen<CR>
	nnoremap <Leader>c :copen<CR>

	" Filter from quickfix list
	function! GrepQuickFix(pat)
		let all = getqflist()
		for d in all
			if bufname(d['bufnr']) !~ a:pat && d['text'] !~ a:pat
				call remove(all, index(all,d))
			endif
		endfor
		call setqflist(all)
	endfunction
	command! -nargs=* QFilter call GrepQuickFix(<q-args>)

	" Filter from location list - doesn't work, read help
	function! GrepLocList(pat)
	  let all = getloclist(^)
	  for d in all
		if bufname(d['bufnr']) !~ a:pat && d['text'] !~ a:pat
		  call remove(all, index(all,d))
		endif
	  endfor
	  call setloclist(^)
	endfunction
	command! -nargs=* LFilter call GrepLocList(<q-args>)

	" Unimpaired inspired mappings
	nnoremap [q :cprevious<CR>
	nnoremap ]q :cnext<CR>
	nnoremap [Q :cfirst<CR>
	nnoremap ]Q :clast<CR>
	nnoremap [l :lprevious<CR>
	nnoremap ]l :lnext<CR>
	nnoremap [L :lfirst<CR>
	nnoremap ]L :llast<CR>
	nnoremap [b :bprevious<CR>
	nnoremap ]b :bnext<CR>
	nnoremap [B :bfirst<CR>
	nnoremap ]B :blast<CR>
	nnoremap [a :previous<CR>
	nnoremap ]a :next<CR>
	nnoremap [A :first<CR>
	nnoremap ]A :last<CR>
	nnoremap [t :tprevious<CR>
	nnoremap ]t :tnext<CR>
	nnoremap [T :tfirst<CR>
	nnoremap ]T :tlast<CR>

	" I use 'f' and 'F' for normal movements - tried changing but muscle memorized
	nnoremap T :tag *

	" Auto-center
	nnoremap <silent> <C-o> <C-o>zz
	nnoremap <silent> <C-i> <C-i>zz
	nnoremap <silent> G Gzz
	nnoremap <silent> k gk
	nnoremap <silent> j gj

	" '%' matching
	runtime macros/matchit.vim
	set showmatch
	" Tags for movement
	set tags=./tags;,tags;

	" Move across closed folds using ]z and [z
	function! NextClosedFold(dir)
		let cmd = 'norm!z' . a:dir
		let view = winsaveview()
		let [l0, l, open] = [0, view.lnum, 1]
		while l != l0 && open
			exe cmd
			let [l0, l] = [l, line('.')]
			let open = foldclosed(l) < 0
		endwhile
		if open
			call winrestview(view)
		endif
	endfunction
	nnoremap <silent> ]z :call NextClosedFold('j')<CR>
	nnoremap <silent> [z :call NextClosedFold('k')<CR>

	" I use 'cc' and 'cl' instead of 's' and 'S' - that seems more natural to me
	Plug 'justinmk/vim-sneak'
"}}}

" Project management {{{
	" Root to the project directory
	Plug 'airblade/vim-rooter'
	let g:rooter_manual_only = 1
	let g:rooter_disable_map = 1
	let g:rooter_patterns = ['.git/', '.svn/', '.hg/']
	let g:rooter_use_lcd = 1
	let g:rooter_change_directory_for_non_project_files = 1
	let g:rooter_silent_chdir = 1

	" Traverse files within a project - create a .projections.json first
	Plug 'tpope/vim-projectionist'
	nnoremap <Leader><Tab> :A<CR>

	" For large projects
	Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
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

" Git {{{
	" Wrapper
	Plug 'tpope/vim-fugitive'
	autocmd BufReadPost fugitive://* set bufhidden=delete " Delete all fugitive buffers except this
	nnoremap <silent> gb :Gblame<CR>
	" Use this like a time machine - Traverse using unimpaired's ]q, [q, ]Q and [Q
	nnoremap <silent> gl :Glog<CR>

	" Gitk
	Plug 'gregsexton/gitv', {'on': 'Gitv'}
	nnoremap <silent> gV :Gitv<CR>

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
		\[' git push', 'Dispatch! git push -u origin'],
		\[' git pull', 'Dispatch! git pull -u origin'],
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
	nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git -start-insert menu:git<CR>
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
	" Grep
	set grepprg=grep\ -nH\ $*

	" '*' in visual mode
	Plug 'thinca/vim-visualstar'
"}}}

" Grep {{{
    " Vim grepper
	Plug 'mhinz/vim-grepper'
    " Mimic :grep and make ag the default tool.
	let g:grepper = {
	  \ 'tools': ['ag', 'git', 'grep'],
	  \ 'open':  0,
	  \ 'jump':  1,
	  \ }
	" Maps
	nnoremap <Leader>e :Grepper -tool ag -noswitch<CR>
	nmap gs <plug>(GrepperOperator)
	xmap gs <plug>(GrepperOperator)
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
	let g:jedi#completions_command = "<C-Leader>"
	let g:jedi#rename_command = ""
	" LaTeX already included in polyglot
	let g:LatexBox_Folding = 1
	" Prose
	Plug 'reedes/vim-wordy'
	nnoremap [k :PrevWordy<CR>
	nnoremap ]k :NextWordy<CR>
"}}}

" Syntax checking {{{
	Plug 'benekastah/neomake' " Async operations for Neovim
	nnoremap <Leader>= :Neomake!<CR>
	if has('nvim')
	  autocmd! BufWritePost * Neomake
	endif
"}}}

" Interface for markdown/pandoc {{{
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
		\[' tex word count', 'Dispatch! texcount %'],
		\[' notes', 'VimFiler ~/Dropbox/notes'],
		\[' mdpandoc dispatch pdf', 'Dispatch! pandoc % -V geometry:margin=2cm -o (%:r).pdf'],
		\[' mdpandoc dispatch org', 'Dispatch! pandoc % -o (%:r).org'],
		\[' mdpandoc dispatch rst', 'Dispatch! pandoc % -o (%:r).rst'],
		\[' mdpandoc dispatch latex', 'Dispatch! pandoc % -o (%:r).tex'],
		\[' mdpandoc dispatch epub3', 'Dispatch! pandoc % -o (%:r).epub'],
		\[' mdpandoc dispatch html5', 'Dispatch! pandoc % -o (%:r).html'],
		\[' Wordy weak', 'Wordy weak'],
		\[' Wordy redundant', 'Wordy redundant'],
		\[' Wordy problematic', 'Wordy problematic'],
		\[' Wordy weasel', 'Wordy weasel'],
		\[' Wordy puffery', 'Wordy puffery'],
		\[' Wordy business', 'Wordy business-jargon'],
		\[' Wordy art', 'Wordy art-jargon'],
		\[' Wordy passive', 'Wordy passive-voice'],
		\[' Wordy being', 'Wordy being'],
		\[' Wordy colloquial', 'Wordy colloquial'],
		\[' Wordy idiomatic', 'Wordy idiomatic'],
		\[' Wordy similies', 'Wordy similies'],
		\[' Wordy opinions', 'Wordy opinions'],
		\[' Wordy contractions', 'Wordy contractions'],
		\[' Wordy synonyms', 'Wordy said-synonyms'],
		\[' Wordy vague', 'Wordy vague-time'],
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
	nnoremap <Leader>v :Copen<CR>
	nnoremap <Leader>i :Dispatch!<Space>

	" Compilation menu
	let g:unite_source_menu_menus.umake = {
		\ 'description' : 'Compilation menu',
		\} " Note that Neomake is already plugged in near syntastic
	let g:unite_source_menu_menus.umake.command_candidates = [
	\[' Dispatch! g++ make', 'Dispatch! make'],
	\[' Dispatch! g++ single', 'Dispatch! g++ -Wall -lgsl -lcblas -llapack -g %'],
	\[' Dispatch! g++ openmp', 'Dispatch! g++ -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' Dispatch! g++ mpi', 'Dispatch! /usr/local/openmpi/bin/mpic++ -Wall -lgsl -lcblas -llapack -g %'],
	\[' Dispatch! g++ hybrid', 'Dispatch! /usr/local/openmpi/bin/mpic++ -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' Dispatch! gcc make', 'Dispatch! make'],
	\[' Dispatch! gcc single', 'Dispatch! gcc! -Wall -lgsl -lcblas -llapack -g %'],
	\[' Dispatch! gcc openmp', 'Dispatch! gcc -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' Dispatch! gcc mpi', 'Dispatch! /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -g %'],
	\[' Dispatch! gcc hybrid', 'Dispatch! /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -fopenmp -g %'],
	\[' Eclim Java', 'Java'],
	\]
	nnoremap <silent> <Leader>m :Unite -direction=botright -buffer-name=umake -start-insert menu:umake<CR>
"}}}

" Tmux stuff {{{
	" Launch appropriate REPL
	Plug 'benmills/vimux'

	" Interface for common shell commands
	let g:unite_source_menu_menus.common = {
		\ 'description' : 'Common shell commands',
		\}
	let g:unite_source_menu_menus.common.command_candidates = [
		\[' matlab dbcont', 'call VimuxRunCommand("dbcont",1)'],
		\[' matlab dbstep', 'call VimuxRunCommand("dbstep",1)'],
		\[' matlab dbstop', 'exe "VimuxRunCommand(\"dbstop at" input("line: ") "in" input("file: ")"\",1)"'],
		\[' matlab dbstatus', 'call VimuxRunCommand("dbstatus",1)'],
		\[' matlab dbclear all', 'call VimuxRunCommand("dbclear all",1)'],
		\[' matlab dbquit', 'call VimuxRunCommand("dbquit",1)'],
		\[' matlab workspace', 'call VimuxRunCommand("workspace",1)'],
		\[' matlab clc', 'call VimuxRunCommand("clc",1)'],
		\[' cpp default', 'call VimuxRunCommand("./a.out",1)'],
		\[' cpp exe', 'exe"VimuxRunCommand(\"./"input("file: ")"\",1)"'],
		\[' cpp fpe', 'call VimuxRunCommand("./FPE.exe",1)'],
		\[' shell clear', 'call VimuxRunCommand("clear",1)'],
		\]
	nnoremap <silent> <Leader>h :Unite -direction=botright -silent -buffer-name=common -start-insert menu:common<CR>

	" Interface for Tmux and Vimux
	let g:unite_source_menu_menus.tmux = {
		\ 'description' : 'Tmux interaction',
		\}
	let g:unite_source_menu_menus.tmux.command_candidates = [
		\[' vimux run command', 'exe "VimuxRunCommand(\"" input("command: ") "\")"'],
		\[' vimux last command', 'VimuxRunLastCommand'],
		\[' vimux run R', 'call VimuxRunCommandInDir("R",0)'],
		\[' vimux run julia', 'call VimuxRunCommandInDir("julia",0)'],
		\[' vimux run matlab', 'call VimuxRunCommandInDir("matlab",0)'],
		\[' vimux run scheme', 'call VimuxRunCommandInDir("racket",0)'],
		\[' vimux run python', 'call VimuxRunCommandInDir("ipython",0)'],
		\[' vimux run shell', 'call VimuxRunCommandInDir("pwd",0)'],
		\[' vimux runner zoom', 'VimuxZoomRunner'],
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
		\]
	nnoremap <silent> <Leader>t :Unite -direction=botright -silent -buffer-name=tmux -start-insert menu:tmux<CR>

	" Send to Tmux - super useful
	Plug 'jpalardy/vim-slime'
	let g:slime_target = "tmux"
	let g:slime_python_ipython = 1
	nnoremap <silent> <Leader>s :SlimeSend<CR>
	vnoremap <silent> <Leader>s :SlimeSend<CR>

	" Zoom and split when in Tmux(>v1.8)
	if exists('$TMUX')
		nnoremap <silent> <Leader>z :call system("tmux resize-pane -Z")<CR>
		nnoremap <silent> + :call system("tmux split-window -h")<CR>
		nnoremap <silent> - :call system("tmux split-window -v")<CR>
	endif
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
		\[' generate tags in buffer dir', 'cd %:p:h | Dispatch! ctags -R .'],
		\[' cd to buffer directory', 'cd %:p:h'],
		\[' cd to project directory', 'Rooter'],
		\[' create .projections.json', 'cd %:p:h | e .projections.json'],
		\[' Source vimrc', 'so $MYVIMRC'],
		\[' Edit vimrc', 'e $MYVIMRC'],
		\[' Current iTunes Song', 'Unite -silent -buffer-name=itunes output/shellcmd:osascript:~/applescripts/itunes.scpt'],
		\[' Colors', 'exe "colorscheme "'],
		\]
	nnoremap <silent> <Leader>a :Unite -silent -buffer-name=osinteract -quick-match menu:osinteract<CR>
"}}}

" Setup plugins, indents and syntax
filetype plugin indent on
syntax on

" Set colorscheme
set background=light
colorscheme PaperColor
