" vim:set et sts=0 sw=4 ts=4 tw=80 foldmethod=marker:

set nocompatible " be iMproved
filetype off " required

" Auto install vim-plug {{{1
if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif
endif

" Start plugin installation {{{1
if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Buffer behaviour {{{1
" Set options {{{2
set title
" Turn on numbering and relativenumber
set number " Can be toggled with 'con'
augroup toggle_relative_number  " can be toggled normally with 'cor'
    autocmd!
    autocmd BufEnter * :setlocal relativenumber
    autocmd WinEnter * :setlocal relativenumber
    autocmd InsertEnter * :setlocal norelativenumber
    autocmd BufLeave * :setlocal norelativenumber
    autocmd WinLeave * :setlocal norelativenumber
    autocmd InsertLeave * :setlocal relativenumber
augroup END
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
set guifont=Fira\ Mono:h14
set guicursor+=a:blinkon0

" Maps without leader {{{2
" Window mode instead of ex mode
nnoremap <silent> m <C-w>
nnoremap <silent> mm <C-w><C-w>
" Keep me in visual mode
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" Add mark - frees up 'm' which I use for moving stuff
nnoremap + m
" Navigate in insert mode
inoremap <silent> <C-f> <right>
inoremap <silent> <C-b> <left>
" Complete tags - don't use if you need <C-]> (...but why?)
inoremap <silent> <C-]> <C-x><C-]>
" Omnicomplete - don't use this if you need <C-o> (useful...I prefer <Esc>)
inoremap <silent> <C-o> <C-x><C-o>
" Usercomplete - <C-d> seems similar to <C-w>
inoremap <silent> <C-d> <C-x><C-u>
" Dictionary - don't use this if you need <C-l> (I don't quite get <C-l>)
inoremap <silent> <C-l> <C-x><C-k>
" File complete - You can use this by typing <C-/>
inoremap <silent> <C-_> <C-x><C-f>
" <C-x><C-l> for line completion - rarely used
" Toggle few options - inspired by unimpaired
nnoremap con :<C-u>setlocal number!<CR>:set number?<CR>
nnoremap cor :<C-u>setlocal relativenumber!<CR>:set relativenumber?<CR>
nnoremap cow :<C-u>setlocal wrap!<CR>:set wrap?<CR>
nnoremap coc :<C-u>setlocal cursorline!<CR>:set cursorline?<CR>
nnoremap col :<C-u>setlocal list!<CR>:set list?<CR>
nnoremap cos :<C-u>setlocal spell!<CR>:set spell?<CR>
nnoremap coi :<C-u>setlocal ignorecase!<CR>:set ignorecase?<CR>
nnoremap coh :<C-u>setlocal hlsearch!<CR>:set hlsearch?<CR>
nnoremap cop :<C-u>setlocal paste!<CR>:set paste?<CR>
nnoremap cob :set background=<C-R>=&background == 'dark' ? 'light' : 'dark'<CR><CR>
nnoremap com :set colorcolumn=<C-R>=&colorcolumn == '80,100' ? '' : '80,100'<CR><CR>
nnoremap cof :set foldmethod=<C-R>=&foldmethod == 'expr' ? 'manual' : 'expr'<CR><CR>
" Readline-ish bindings in Command-line mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Leader and maps {{{2
" Set leader
let mapleader="\<Space>"
" This is basically because of the memory I developed from my Emacs experiments
nnoremap <Leader>d :
vnoremap <Leader>d :
" Help
nnoremap <Leader>x :help<Space>
" Folding
nnoremap <silent> ]z zj
nnoremap <silent> [z zk
nnoremap <silent> Z zM
nnoremap - zf
vnoremap - zf
" Kill, save or quit
nnoremap <silent> <Leader>k :bd!<CR>
nnoremap <silent> <Leader>w :update<CR>
nnoremap <silent> <Leader>q :q<CR>

" Plugins {{{2
" Colorscheme
Plug 'NLKNguyen/papercolor-theme'
" Undotree
Plug 'mbbill/undotree'
let g:undotree_WindowLayout = 2
nnoremap <silent> U :UndotreeToggle<CR>
" Preview the registers
Plug 'junegunn/vim-peekaboo'
" Better and more functional start screen
Plug 'mhinz/vim-startify'
let g:startify_bookmarks =[ '~/Documents/workspace', '~/.zshrc', '~/.zshenv', '~/.alias']
let g:startify_files_number = 10
let g:startify_update_oldfiles = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
            \ 'bundle/.*/doc',
            \ ]
let g:startify_custom_footer =
        \ ['', "   Vim is charityware. Please read ':help uganda'.", '']
" Markdown folding
Plug 'nelstrom/vim-markdown-folding'
let g:markdown_fold_style = 'nested'
nnoremap coF :FoldToggle<CR>

" File/Buffer navigation {{{1
" Set commands {{{2
" Path for the builtin 'find' command
set path=.,**
" Tags for movement
set tags=./tags;,tags;
" '%' matching
runtime macros/matchit.vim
set showmatch

" Maps without leader {{{2
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
nnoremap ]n /^<\+HEAD$<CR>
nnoremap [n ?^<\+HEAD$<CR>
" Tags
nnoremap T :tag *
" Auto-center
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz
nnoremap <silent> G Gzz
nnoremap <silent> k gk
nnoremap <silent> j gj
" Jumplist
nnoremap <C-p> <C-o>
nnoremap <C-n> <C-i>
" Folding
nnoremap <silent> <Tab> za
nnoremap <silent> <C-i> za
" Open the file with the correct application in the background - OS X only
nnoremap gF :!open -g -j <cfile><CR>

" Functions and commands {{{2
" Filter from quickfix list - someone's vimrc
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

" Common directory changes
command! CD cd %:p:h
command! LCD lcd %:p:h

" Alternate between header and source files - junegunn
function! s:A()
    let name = expand('%:r')
    let ext = tolower(expand('%:e'))
    let sources = ['c', 'cc', 'cpp', 'cxx']
    let headers = ['h', 'hh', 'hpp', 'hxx']
    for pair in [[sources, headers], [headers, sources]]
        let [set1, set2] = pair
        if index(set1, ext) >= 0
            for h in set2
                let aname = name.'.'.h
                for a in [aname, toupper(aname)]
                    if filereadable(a)
                        execute 'e' a
                        return
                    end
                endfor
            endfor
        endif
    endfor
endfunction
command! A call <sid>A()

" Next and previous indent - junegunn
function! s:indent_len(str)
    return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction
function! s:go_indent(times, dir)
    for _ in range(a:times)
        let l = line('.')
        let x = line('$')
        let i = s:indent_len(getline(l))
        let e = empty(getline(l))
    while l >= 1 && l <= x
      let line = getline(l + a:dir)
      let l += a:dir
      if s:indent_len(line) != i || empty(line) != e
        break
      endif
    endwhile
    let l = min([max([1, l]), x])
    execute 'normal! '. l .'G^'
  endfor
endfunction
nnoremap <silent> ]i :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> [i :<c-u>call <SID>go_indent(v:count1, -1)<cr>

" Go to project root - only for git - junegunn
function! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()

" Get TODO stuff - only from git repos - junegunn
function! s:todo() abort
    let entries = []
    for cmd in ['git grep -n -e TODO -e FIXME -e XXX 2> /dev/null',
                \ 'grep -rn -e TODO -e FIXME -e XXX * 2> /dev/null']
        let lines = split(system(cmd), '\n')
        if v:shell_error != 0 | continue | endif
        for line in lines
            let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
            call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
        endfor
        break
    endfor
    if !empty(entries)
        call setqflist(entries)
        copen
    endif
endfunction
command! Todo call s:todo()
nnoremap <Leader>t :Todo<CR>

" Leader maps {{{2
" Quickfix and Location list maps
nnoremap <silent> <Leader>l :lopen<CR>
nnoremap <silent> <Leader>h :copen<CR>
nnoremap <silent> <Leader>L :lclose<CR>
nnoremap <silent> <Leader>H :cclose<CR>
nnoremap <silent> <Leader>; q:
nnoremap <silent> <Leader>/ q/

" netrw {{{2
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
nnoremap <silent> <Leader>v :30Vexplore<CR>

" Plugins {{{2
" Google stuff
Plug 'szw/vim-g'
nnoremap gOO :Google<Space>
nnoremap goo :Googlef<Space>
nnoremap go :Googlef <cWORD><CR>
nnoremap gO :Google <cWORD><CR>
vnoremap gO :Google<CR>
vnoremap go :Googlef<CR>
" Open the documentation
Plug 'keith/investigate.vim'
let g:investigate_use_dash=1

" Statusline - from scrooloose {{{1
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
set statusline+=%c,     "cursor column
set statusline+=%l      "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

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

" Unite {{{1
" Defaults {{{2
Plug 'Shougo/unite.vim'
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    imap <buffer> <TAB>   <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')
    imap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
endfunction
let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places

" Unite default functionality maps
nnoremap <silent> <Leader>f :UniteWithBufferDir -buffer-name=findfile -start-insert file directory file/new directory/new<CR>
nnoremap <silent> <Leader>u :Unite -buffer-name=bufswitch -start-insert buffer buffer_tab<CR>
nnoremap <silent> <Leader>p :UniteWithProjectDir -start-insert -buffer-name=project file_rec file/new<CR>
nnoremap <silent> <Leader>n :UniteWithProjectDir -buffer-name=nav -vertical directory directory/new<CR>
nnoremap <silent> <Leader>, :Unite -buffer-name=mapping mapping<CR>
nnoremap <silent> <Leader>. :Unite -buffer-name=resume resume<CR>
nnoremap <silent> <C-o> :Unite -buffer-name=jumps -start-insert jump<CR>
inoremap <silent> <C-j> <C-o>:Unite -start-insert -buffer-name=ultisnips ultisnips<CR>

" Helper plugins {{{2
" Yank history
Plug 'Shougo/neoyank.vim'
nnoremap <silent> <Leader>y :Unite -buffer-name=yank history/yank<CR>
" Outline
Plug 'Shougo/unite-outline'
nnoremap <silent> t :Unite -buffer-name=outline -vertical -winwidth=35 outline<CR>
" Vim anzu - integrates with Unite too
Plug 'osyo-manga/vim-anzu'
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
nnoremap <Leader>n :Unite -buffer-name=anzu -horizontal -winheight=10 anzu<CR>

" Interfaces/Menus - The best part of Unite {{{2
" Interface for OS interaction{{{3
let g:unite_source_menu_menus.osinteract = {
            \ 'description' : 'OS interaction and configs',
            \}
let g:unite_source_menu_menus.osinteract.command_candidates = [
            \[' alternate file', 'A'],
            \[' cd to buffer dir', 'CD'],
            \[' cd to project dir', 'Root'],
            \[' ctags in current dir', 'Dispatch! ctags -R .'],
            \[' gist file', 'exe "Dispatch! gist -f % -d " input("description: ")'],
            \[' Edit vimrc', 'vsp $MYVIMRC'],
            \[' finder', 'Dispatch! open -a Finder .'],
            \[' session save', 'SSave'],
            \[' session load', 'SLoad'],
            \]
nnoremap <silent> <Leader>a :Unite -silent -buffer-name=osinteract -quick-match menu:osinteract<CR>

" Interface for semantic jumping {{{3
let g:unite_source_menu_menus.jumptoany= {
            \ 'description' : 'Jump to anything',
            \}
let g:unite_source_menu_menus.jumptoany.command_candidates = [
            \['cpp jump to', 'call rtags#JumpTo()'],
            \['cpp jump to parent', 'call rtags#JumpToParent()'],
            \['cpp reference', 'call rtags#FindRefsOfWordUnderCursor()'],
            \['cpp symbol', 'call rtags#FindSymbolsOfWordUnderCursor()'],
            \['cpp virtuals', 'call rtags#FindVirtuals()'],
            \['cpp reindex', 'call rtags#ReindexFile()'],
            \['cpp rename', 'call rtags#RenameSymbolUnderCursor()'],
            \['cpp projects', 'call rtags#ProjectList()'],
            \['py GoTo Command', 'call jedi#goto()'],
            \['py GoTo Assignment', 'call jedi#goto_assignments()'],
            \['py GoTo Definition', 'call jedi#goto_definitions()'],
            \['py Rename', 'call jedi#rename()'],
            \['py Rename Visual', 'call jedi#rename_visual()'],
            \['r Rename Visual', 'call jedi#rename_visual()'],
            \]
nnoremap <silent> <Leader>j :Unite -silent -buffer-name=jumptoany -start-insert menu:jumptoany<CR>

" Interface for Git and Fugitive {{{3
let g:unite_source_menu_menus.git = {
            \ 'description' : 'Git interface',
            \}
let g:unite_source_menu_menus.git.command_candidates = [
            \[' git status', 'Gstatus'],
            \[' git diff', 'Gvdiff'],
            \[' git stage/add', 'Gwrite'],
            \[' git commit', 'Gcommit'],
            \[' git checkout', 'Gread'],
            \[' git rm', 'Gremove'],
            \[' git cd', 'Gcd'],
            \[' git branch', 'Dispatch! git branch -a'],
            \[' git push', 'Dispatch! git push'],
            \[' git pull', 'Dispatch! git pull'],
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
nnoremap <silent> <Leader>o :Unite -silent -buffer-name=git -start-insert menu:git<CR>

" Interface for Notes {{{3
let g:unite_source_menu_menus.notes = {
            \ 'description' : 'notes interaction',
            \}
let g:unite_source_menu_menus.notes.command_candidates = [
            \[' dir', 'cd ~/Dropbox/notes | Unite -buffer-name=notes -start-insert directory file directory/new file/new'],
            \[' new note', 'vsplit ~/Dropbox/notes/notes.md'],
            \[' new expense', 'vsplit ~/Dropbox/notes/expenses.dat'],
            \[' tex word count', 'Dispatch! texcount %'],
            \[' pandoc pdf', 'Dispatch! pandoc % -V geometry:margin=2cm -o %:r.pdf'],
            \[' pandoc org', 'Dispatch! pandoc % -o %:r.org'],
            \[' pandoc rst', 'Dispatch! pandoc % -o %:r.rst'],
            \[' pandoc latex', 'Dispatch! pandoc % -o %:r.tex'],
            \[' pandoc epub3', 'Dispatch! pandoc % -o %:r.epub'],
            \[' pandoc html5', 'Dispatch! pandoc % -o %:r.html'],
            \]
nnoremap <silent> <Leader>e :Unite -silent -buffer-name=notes -start-insert menu:notes<CR>

" Interface for common build commands - keeps changeing {{{3
let g:unite_source_menu_menus.build = {
            \ 'description' : 'build things',
            \}
let g:unite_source_menu_menus.build.command_candidates = [
            \[' g++ make', 'Dispatch! make'],
            \[' g++ build', 'Dispatch! make -C build'],
            \[' g++ docs', 'Dispatch! make -C build doc'],
            \[' g++ latex', 'Dispatch! make -C docs/latex'],
            \[' g++ single', 'Dispatch! g++ -Wall -lgsl -lcblas -llapack -O2 -g %'],
            \[' g++ openmp', 'Dispatch! g++ -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g %'],
            \[' g++ mpi', 'Dispatch! /usr/local/openmpi/bin/mpic++ -Wall -lgsl -lcblas -llapack -O2 -g %'],
            \[' g++ hybrid', 'Dispatch! /usr/local/openmpi/bin/mpic++ -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g %'],
            \[' g++ armadillo', 'Dispatch! g++ -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g %'],
            \[' gcc make', 'Dispatch! make'],
            \[' gcc build', 'Dispatch! make -C build'],
            \[' gcc latex', 'Dispatch! make -C docs/latex'],
            \[' gcc docs', 'Dispatch! make -C build doc'],
            \[' gcc single', 'Dispatch! gcc! -Wall -lgsl -lcblas -llapack -O2 -g %'],
            \[' gcc openmp', 'Dispatch! gcc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g %'],
            \[' gcc mpi', 'Dispatch! /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -O2 -g %'],
            \[' gcc hybrid', 'Dispatch! /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g %'],
            \[' gcc armadillo', 'Dispatch! gcc -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g %'],
            \]
nnoremap <silent> <Leader>i :Unite -silent -buffer-name=build -start-insert menu:build<CR>

" Interface for common dispatch commands {{{3
let g:unite_source_menu_menus.dispatch = {
            \ 'description' : 'dispatch things',
            \}
let g:unite_source_menu_menus.dispatch.command_candidates = [
            \[' spot home', 'exe "Dispatch! mdfind -onlyin ~ " input("string: ")'],
            \[' spot doc', 'exe "Dispatch! mdfind -onlyin ~/Documents " input("string: ")'],
            \[' spot workspace', 'exe "Dispatch! mdfind -onlyin ~/Documents/workspace " input("string: ")'],
            \[' spot box', 'exe "Dispatch! mdfind -onlyin ~/Box\\ Sync " input("string: ")'],
            \[' spot dropbox', 'exe "Dispatch! mdfind -onlyin ~/Dropbox " input("string: ")'],
            \[' spot root', 'exe "Dispatch! mdfind -onlyin / " input("string: ")'],
            \[' locate', 'exe "Dispatch! locate " input("string: ")'],
            \]
nnoremap <silent> <Leader>r :Unite -silent -buffer-name=dispatch -start-insert menu:dispatch<CR>

" FileTypes {{{1
" Set commands {{{2
" Ignore list
set wildignore=/tmp/*,*.swp,*.bak,*.pyc,*.class,*.tmp,*.aux,*.mp4,*.pdf,*.cache,*.synctex.gz
set wildignore+=*.gradle,*.plist,*.avi,*.mp3,*.flv,*.mkv,*.sparseimage,*.db,*.tbz,*.zip,*.so,*.crash
set wildignore+=*.fls,*.latexmk_db,*.toc,*.mobi,*.epub,*.fdb_latexmk,*.apk,*.xmi,*.lic,*.iso,*.pages
set wildignore+=*.key,*.pptx,*.xlsx,*.docx,*.rar
" Dictionary
set dictionary+=/usr/share/dict/words

" File is large from 5mb - Vim wiki {{{2
let g:LargeFile = 1024 * 1024 * 5
augroup LargeFile
    autocmd!
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END
function! LargeFile()
    " no syntax highlighting etc
    set eventignore+=FileType
    " save memory when other file is viewed
    setlocal bufhidden=unload
    " is read-only (write with :w new_filename)
    setlocal buftype=nowrite
    " no undo possible
    setlocal undolevels=-1
    " display message
    autocmd! VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed."
endfunction

" Autocmds and let commands for filetypes {{{2
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

" Text editing {{{1
" Set commands {{{2
set encoding=utf-8
" Don't wrap the lines - Can be toggled with unimpaired's 'cow'
set nowrap
set linebreak
set nolist
" Use backspace for multiple purposes while moving
set backspace=indent,eol,start
" Indentation
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
" Max text width
set textwidth=80
" Don't include headers, use ctags
set complete-=i

" Maps without leader {{{2
" Make 'Y' work like 'C' and 'D'
nnoremap <silent> Y y$
" '&' remembers the flags of the last substitute
nnoremap & g&
" Elementary splitting
nnoremap gz Dop==k$
" Blank the current line
nnoremap crb cc
" %% for current buffer file name
" :: for current buffer file path
cnoremap %% <c-r>=expand('%')<cr>
cnoremap :: <c-r>=expand('%:p:h')<cr>/
" Easier pairs when required
inoremap {<Tab> {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [<Tab> []<Esc>i
inoremap [<CR> [<CR>]<Esc>O
inoremap (<Tab> ()<Esc>i
inoremap (<CR> (<CR>)<Esc>O
inoremap <<Tab> <><Esc>i
inoremap <<CR> <<CR>><Esc>O
inoremap '<Tab> ''<Esc>i
inoremap '<CR> '<CR>'<Esc>O
inoremap "<Tab> ""<Esc>i
inoremap "<CR> "<CR>"<Esc>O
inoremap `<Tab> ``<Esc>i
inoremap `<CR> `<CR>`<Esc>O
inoremap ```<Tab> ``````<Esc>hhi
inoremap ```<CR> ```<CR>```<Esc>O

" Functions and commands {{{2
" Strip trailing whitespace
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
command! StripWhiteSpace :call StripWhitespace()
nnoremap crw :StripWhiteSpace<CR>

" Convert tabs to whitespace
function! TabsToWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\t/  /e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
command! TabsToWhitespace :call TabsToWhitespace()
nnoremap crt :TabsToWhitespace<CR>

" strip ^M character at end of lines
function! StripNewLine()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\r//g
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
command! StripNewLine :call StripM()
nnoremap crn :StripNewLine<CR>

" Plugins {{{2
" For collaborative work
Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" Better '.' command
Plug 'tpope/vim-repeat'
" Subvert, Abolish and coerce
Plug 'tpope/vim-abolish'
nnoremap <Leader><Leader> :Subvert /
" Semantic split and join
Plug 'AndrewRadev/splitjoin.vim'
" Easy alignment plugin and auto-align {{{3
Plug 'godlygeek/tabular'
nnoremap gl :Tabularize /
vnoremap gl :Tabularize /
vnoremap gt :Tabularize /\s\+<CR>
vnoremap g= :Tabularize /=<CR>
vnoremap g& :Tabularize /&<CR>
vnoremap gT :Tabularize /<bar><CR>
vnoremap g: :Tabularize /:<CR>

" Auto-align when typing =
inoremap <silent> = =<Esc>:call <SID>equalalign()<CR>a
function! s:equalalign()
    let p = '^.*=\s.*$'
    if exists(':Tabularize') && getline('.') =~# '^.*=' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^=]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*=\s*\zs.*'))
        Tabularize/=/l1
        normal! 0
        call search(repeat('[^=]*=',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" Auto-align when typing |
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>baralign()<CR>a
function! s:baralign()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" Text objects, operators and motions {{{1
" Move line and add blanks {{{2
" Move the current line
nmap <silent> <Plug>MoveLineUp :<c-u>execute 'move -1-'. v:count1<cr>:call repeat#set("\<Plug>MoveLineUp", v:count)<CR>
nmap [e <Plug>MoveLineUp
nmap <silent> <Plug>MoveLineDown :<c-u>execute 'move +'. v:count1<cr>:call repeat#set("\<Plug>MoveLineDown", v:count)<CR>
nmap ]e <Plug>MoveLineDown
" Blank line
nmap <silent> <Plug>BlankLineUp :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[:call repeat#set("\<Plug>BlankLineUp", v:count)<CR>
nmap [o <Plug>BlankLineUp
nmap <silent> <Plug>BlankLineDown :<c-u>put =repeat(nr2char(10), v:count1)<cr>:call repeat#set("\<Plug>BlankLineDown", v:count)<CR>
nmap ]o <Plug>BlankLineDown
" Blank character before/after current word
nmap <silent> <Plug>BlankCharLeft i l:call repeat#set("\<Plug>BlankCharLeft", v:count)<CR>
nmap [<Space> <Plug>BlankCharLeft
nmap <silent> <Plug>BlankCharRight a h:call repeat#set("\<Plug>BlankCharRight", v:count)<CR>
nmap ]<Space> <Plug>BlankCharRight

" Motions {{{2
Plug 'justinmk/vim-sneak'
let g:sneak#streak = 1
nmap w <Plug>Sneak_f
nmap W <Plug>Sneak_F
xmap w <Plug>Sneak_f
xmap W <Plug>Sneak_F
omap w <Plug>Sneak_f
omap W <Plug>Sneak_F

" Text objects {{{2
" Onoremap based {{{3
" Operate on entire file
onoremap ia :<C-u>normal! gg^vGg_<CR>
xnoremap ia :<C-u>normal! gg^vGg_<CR>
onoremap aa :<C-u>normal! ggvG$<CR>
xnoremap aa :<C-u>normal! ggvG$<CR>
" Operate on entire line
onoremap il :<C-u>normal! ^vg_<CR>
xnoremap il :<C-u>normal! ^vg_<CR>
onoremap al :<C-u>normal! 0v$<CR>
xnoremap al :<C-u>normal! 0v$<CR>
" Operate within markdown code block
xnoremap <silent> iM g_?^```<cr>jo/^```<cr>kV:<c-u>nohl<cr>gv
xnoremap <silent> aM g_?^```<cr>o/^```<cr>V:<c-u>nohl<cr>gv
onoremap <silent> iM :<C-U>execute "normal vi`"<cr>
onoremap <silent> aM :<C-U>execute "normal va`"<cr>

" Text object plugins {{{3
" Adds some niceties
Plug 'wellle/targets.vim'
let g:targets_nlNL = 'nN  '
let g:targets_argTrigger = 'r'
let g:targets_argOpening = '[({[]'
let g:targets_argClosing = '[]})]'
let g:targets_argSeparator = '[,;]'
" Create text objects
Plug 'kana/vim-textobj-user'
" Operate on variable segments (camelCase, snake_case and MixedCase) - (operator)iv/av
Plug 'Julian/vim-textobj-variable-segment'
" Operate on functions - (operator)if/af
Plug 'sriramkswamy/vim-textobj-function'
" Operate on comments - (operator)ic/ac
Plug 'sriramkswamy/vim-textobj-comment'
" Operate on indents - (operator)ii/ai/aI - doesn't depend on kana's plugin
Plug 'michaeljsmith/vim-indent-object'

" Operators {{{2
" Functions {{{3
" Nice for quick vimscript testing.
function! SourceVimscript(type)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @"
    if a:type == 'line'
        silent execute "normal! '[V']y"
    elseif a:type == 'char'
        silent execute "normal! `[v`]y"
    elseif a:type == "visual"
        silent execute "normal! gvy"
    elseif a:type == "currentline"
        silent execute "normal! yy"
    endif
    let @" = substitute(@", '\n\s*\\', '', 'g')
    " source the content
    @"
    let &selection = sel_save
    let @" = reg_save
endfunction
nnoremap <silent> g: :set opfunc=SourceVimscript<cr>g@
vnoremap <silent> g: :<c-U>call SourceVimscript("visual")<cr>
nnoremap <silent> g:: :call SourceVimscript("currentline")<cr>

" Plugins {{{3
" Better surround - cs/ds/ys(to add surrounding)
Plug 'tpope/vim-surround'
let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap s  <Plug>Ysurround
nmap S  <Plug>YSurround
nmap ss <Plug>Yssurround
nmap Ss <Plug>YSsurround
nmap SS <Plug>YSsurround
xmap s   <Plug>VSurround
xmap S  <Plug>VgSurround
" Easy commenting - gc(motion/textobject)
Plug 'tpope/vim-commentary'
autocmd FileType matlab setlocal commentstring=%\ %s
" Replace the object with content in register - ["x]gr(motion/textobject)
Plug 'vim-scripts/ReplaceWithRegister'
" Exchange stuff - cx(motion/textobject) and repeat it at the new point
Plug 'tommcdo/vim-exchange'
nmap <silent> <Plug>ExchangeWordRight cxiweecxiw :call repeat#set("\<Plug>ExchangeWordRight", v:count)<CR>
nmap ]w <Plug>ExchangeWordRight
nmap <silent> <Plug>ExchangeWordLeft cxiwbcxiw :call repeat#set("\<Plug>ExchangeWordLeft", v:count)<CR>
nmap [w <Plug>ExchangeWordLeft
nmap <silent> <Plug>ExchangeWORDRight cxiWEEcxiW :call repeat#set("\<Plug>ExchangeWORDRight", v:count)<CR>
nmap ]W <Plug>ExchangeWORDRight
nmap <silent> <Plug>ExchangeWORDLeft cxiWBcxiW :call repeat#set("\<Plug>ExchangeWORDLeft", v:count)<CR>
nmap [W <Plug>ExchangeWORDLeft
nmap <silent> <Plug>ExchangeParaRight cxip}jcxip :call repeat#set("\<Plug>ExchangeParaRight", v:count)<CR>
nmap ]p <Plug>ExchangeParaRight
nmap <silent> <Plug>ExchangeParaLeft cxip{kcxip :call repeat#set("\<Plug>ExchangeParaLeft", v:count)<CR>
nmap [p <Plug>ExchangeParaLeft
nmap <silent> <Plug>ExchangeSearchNext cxiwcxgn :call repeat#set("\<Plug>ExchangeSearchNext", v:count)<CR>
nmap ]N <Plug>ExchangeSearchNext
nmap <silent> <Plug>ExchangeSearchPrev cxiwcxgN :call repeat#set("\<Plug>ExchangeSearchPrev", v:count)<CR>
nmap [N <Plug>ExchangeSearchPrev
" Needs targets.vim
nmap <silent> <Plug>ExchangeArgNext cxIrf,lcxIr :call repeat#set("\<Plug>ExchangeSearchNext", v:count)<CR>
nmap ]r <Plug>ExchangeArgNext
nmap <silent> <Plug>ExchangeArgPrev cxIrF,hcxIr :call repeat#set("\<Plug>ExchangeSearchPrev", v:count)<CR>
nmap [r <Plug>ExchangeArgPrev

" Snippets {{{1
if has('python') || has('python3')
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Snippets collection
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    let g:UltiSnipsEditSplit="vertical"
endif

" Version control {{{1
" Also adds text objects ah/ih for changeset but normal vim-diff changeset motions hold - ]([)c
Plug 'mhinz/vim-signify'
let g:signify_sign_change = '~'
let g:signify_vcs_list = ['git', 'svn', 'hg', 'bzr', 'perforce']
omap ih <Plug>(signify-motion-inner-pending)
xmap ih <Plug>(signify-motion-inner-visual)
omap ah <Plug>(signify-motion-outer-pending)
xmap ah <Plug>(signify-motion-outer-visual)
nnoremap <silent> gy :SignifyToggleHighlight<CR>
" Git Wrapper
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'
autocmd BufReadPost fugitive://* set bufhidden=delete " Delete all fugitive buffers except this
nnoremap <silent> gb :Gblame<CR>
" Use this like a time machine - Traverse using unimpaired's ]q, [q, ]Q and [Q
nnoremap <silent> gl :Glog<CR>
" gv.vim - I use 'gq' for formatting
nnoremap <silent> gw :GV<CR>
nnoremap <silent> gW :GV!<CR>
vnoremap <silent> gw :GV<CR>

" Autocompletion {{{1
" vim-omnicomplete activation {{{2
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd filetype html,markdown,ctp set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd filetype vim set omnifunc=syntaxcomplete#Complete
autocmd filetype xml set omnifunc=xmlcomplete#CompleteTags
autocmd filetype cpp set omnifunc=ccomplete#CompleteTags
" Close after auto completion
autocmd CompleteDone * pclose

" Language plugins {{{2
" C/C++ autocompletion
Plug 'justmao945/vim-clang'
let g:clang_compilation_database = './build'
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_diagsopt = ''   " disable diagnostics
" Python autocompletion
Plug 'davidhalter/jedi-vim'
autocmd filetype python set omnifunc=jedi#completions
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""

" Language helpers {{{1
" Auto-complete and nicities for many languages
Plug 'sheerun/vim-polyglot'
" LaTeX already included in polyglot
let g:LatexBox_Folding = 1
" C/C++/ObjC indexer (for cmake projects) and autocomplete
Plug 'lyuts/vim-rtags'
autocmd filetype c,cpp set completefunc=RtagsCompleteFunc
let g:rtagsUseDefaultMappings = 0
let g:rtagsUseLocationList = 0
let g:rtagsMinCharsForCommandCompletion = 2

" Syntax checking {{{1
Plug 'benekastah/neomake' " Async operations for Neovim
nnoremap <Leader>m :Neomake<CR>
if has('nvim')
    autocmd! BufWritePost * Neomake
endif

" Searching {{{1
" Set commands {{{2
" Ignore case sensitivity
set ignorecase " Can be toggled with unimpaired's 'coi'
set smartcase
" Highlight search incrementally
set hlsearch " Can be toggled with unimpaired's 'coh'
set incsearch
" Grep
set grepprg=grep\ -nH\ $*

" Maps without leader {{{2
" Auto-center
nnoremap <silent> crh :nohl<CR>
nnoremap <silent> n nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Search for word under visual selection
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

" Vim grepper plugin {{{2
Plug 'mhinz/vim-grepper'
" Mimic :grep and make ag the default tool.
let g:grepper = {
            \ 'tools': ['ag', 'git', 'grep'],
            \ 'open':  0,
            \ 'jump':  1,
            \ }
nnoremap gss :Grepper -tool ag -noswitch<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" REPL and Tmux {{{1
" let commands and maps without leader {{{2
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

" Go to normal mode
if has('nvim')
    tnoremap <C-g> <C-\><C-n>
endif
" Zoom when in Tmux(>v1.8)
if exists('$TMUX')
    nnoremap <silent> <Leader>z :call system("tmux resize-pane -Z")<CR>
    nmap <silent> <Plug>SwapTmuxUp :call system("tmux swap-pane -U")<CR>
                \ :call repeat#set("\<Plug>SwapTmuxUp", v:count)<CR>
    nmap ]R <Plug>SwapTmuxUp
    nmap <silent> <Plug>SwapTmuxDown :call system("tmux swap-pane -D")<CR>
                \ :call repeat#set("\<Plug>SwapTmuxDown", v:count)<CR>
    nmap [R <Plug>SwapTmuxDown
    nnoremap <silent> mV :call system("tmux split-window -h")<CR>
    nnoremap <silent> mS :call system("tmux split-window -v")<CR>
elseif has('nvim')
    nnoremap <silent> mV :vsplit<CR>:terminal<CR>
    nnoremap <silent> mS :split<CR>:terminal<CR>
else
    nnoremap <silent> mV :call system("open -a Terminal")<CR>
    nnoremap <silent> mS :call system("open -a Terminal")<CR>
endif
" Navigate between Tmux and Vim - I wish there was another way...
Plug 'christoomey/vim-tmux-navigator'

" Plugins {{{2
" Common *nix commands
Plug 'tpope/vim-eunuch'
" Dispatch stuff
Plug 'tpope/vim-dispatch'
nnoremap <silent> <Leader>c :Copen<CR>
nnoremap <Leader>sd :Dispatch!<Space>
" Launch appropriate REPL
Plug 'jebaum/vim-tmuxify'
let g:tmuxify_map_prefix = '<Leader>s'
let g:tmuxify_custom_command = 'tmux split-window -d -l 10'
let g:tmuxify_run = {
            \ 'sh': 'bash %',
            \ 'go': 'go build %',
            \ 'R': 'R',
            \ 'matlab': 'matlab',
            \ 'scheme': 'racket',
            \ 'python': 'ipython',
            \ 'julia': 'julia',
            \}

" Stop plugin installation {{{1
call plug#end()

" Wrap up Unite settings {{{1
" Enable fuzzy matching and sorting in all Unite functions
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Sections text object - (operator)im/am for markdown and (operator)ix/ax for latex {{{1
call textobj#user#plugin('markdown', { '-': {
            \ 'select-a-function': 'MarkdownA', 'select-a': 'am',
            \ 'select-i-function': 'MarkdownI', 'select-i': 'im',
            \ }, })
function! MarkdownA()
    call search('^#\+.*$', 'bc')
    let head_pos = getpos('.')
    call search('\%$\|\(\n\ze#\+\)', 'c')
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

function! MarkdownI()
    call search('^#\+.*$', 'bc')
    normal! j
    let head_pos = getpos('.')
    call search('\%$\|\(\n\ze#\+\)', 'c')
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

call textobj#user#plugin('latex', { '-': {
            \ 'select-a-function': 'LatexA', 'select-a': 'ax',
            \ 'select-i-function': 'LatexI', 'select-i': 'ix',
            \ }, })
function! LatexA()
    call search('^\\\%[sub]section', 'bc')
    let head_pos = getpos('.')
    call search('\%$\|\(\n\ze\\\%[sub]section\)', 'c')
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

function! LatexI()
    call search('^\\\%[sub]section', 'bc')
    normal! j
    let head_pos = getpos('.')
    call search('\%$\|\(\n\ze\\\%[sub]section\)', 'c')
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

" Setup plugins, indents and syntax {{{1
filetype plugin indent on
syntax on

" Set colorscheme {{{1
set background=dark
colorscheme PaperColor
