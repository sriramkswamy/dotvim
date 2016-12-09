" vim:set et sts=0 sw=4 ts=4 tw=80 foldmethod=marker:

" Auto install vim-plug {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Start plugin installation {{{1
call plug#begin('~/.vim/plugged')

" Buffer behaviour {{{1

" Set options {{{2
set title
" short strings for changes - don't give ins-completion messages
set shortmess+=c
" Automatically read and write buffers
set autoread " neovim default
set autowrite
" Hide unloaded buffers
set hidden
" Automatically scroll when I reach within 3 lines towards end of screen
set sidescrolloff=3
set scrolloff=3
" Color the current line
set nocursorline " Can be toggled with 'coc'
" Show line numbers
set number
set relativenumber
" Format options
set formatoptions=tcqj " neovim default
" Display options
set display=lastline " neovim default
" Ex commands
set wildmenu " neovim default
set wildmode=list:longest,full
set completeopt=menuone,longest,preview
set complete-=i " neovim default
set complete-=t " disable scanning tags
set history=10000
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
" Session management
let g:session_autosave = 'no'
set sessionoptions+=tabpages
set sessionoptions+=winpos
set sessionoptions+=winsize
" Fold options
set foldmethod=indent
set foldnestmax=4
set nofoldenable
set foldlevel=2
" Enable mouse
set mouse=a " neovim default
" Set list characters - Can be toggled with 'col'
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:+
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
set guifont=Hack:h14
set guicursor+=a:blinkon0

" Maps without leader {{{2

" Window management
nnoremap <silent> w <C-w>
nnoremap <silent> ww <C-w><C-w>
" Alternate files
nnoremap <BS> :b#<CR>
nnoremap wa :vsp <bar> b#<CR>
" Keep me in visual mode
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" Add mark - frees up 'm' which I use for moving stuff
nnoremap + m
" Repeat the last macro instead of ex-mode
nnoremap Q @@
" set compiler
nnoremap gC :compiler<Space>
" Navigate in insert mode
inoremap <silent> <C-a> <home>
inoremap <silent> <C-e> <end>
inoremap <silent> <C-f> <right>
inoremap <silent> <C-z> <Esc>zza
" Insert mode navigation similar to <C-g>j and <C-g>k
inoremap <silent> <C-g>l <right>
inoremap <silent> <C-g>h <left>
inoremap <silent> <C-g><C-l> <right>
inoremap <silent> <C-g><C-h> <left>
" Omnicomplete - don't use this if you need <C-o> (useful...I prefer <Esc>)
inoremap <silent> <C-o> <C-x><C-o>
" Usercomplete - don't use this if you need <C-u> (also useful...I prefer <Esc>cc)
inoremap <silent> <C-u> <C-x><C-u>
" Tag complete - don't use this if you need <C-]> (but...why?)
inoremap <silent> <C-]> <C-x><C-]>
" Dictionary - <C-w> achieves the same thing
inoremap <silent> <C-d> <C-x><C-k>
" File complete - <C-c> in insert mode doesn't exit properly anyway
inoremap <silent> <C-c> <C-x><C-f>
" Toggle few options - inspired by unimpaired
nnoremap cob :<C-u>set background=<C-R>=&background == 'dark' ? 'light' : 'dark'<CR><CR>
nnoremap coc :<C-u>setlocal cursorline!<CR>:set cursorline?<CR>
nnoremap cod :<C-u>set scrollbind!<CR>:set scrollbind?<CR>
nnoremap cof :<C-u>set foldmethod=<C-R>=&foldmethod == 'expr' ? 'indent' : 'expr'<CR><CR>
nnoremap cog :<C-u>set foldmethod=<C-R>=&foldmethod == 'diff' ? 'marker' : 'diff'<CR><CR>
nnoremap coh :<C-u>setlocal hlsearch!<CR>:set hlsearch?<CR>
nnoremap coi :<C-u>setlocal ignorecase!<CR>:set ignorecase?<CR>
nnoremap col :<C-u>setlocal list!<CR>:set list?<CR>
nnoremap com :<C-u>set colorcolumn=<C-R>=&colorcolumn == '80,100' ? '' : '80,100'<CR><CR>
nnoremap con :<C-u>setlocal number!<CR>:set number?<CR>
nnoremap cop :<C-u>setlocal paste!<CR>:set paste?<CR>
nnoremap cor :<C-u>setlocal relativenumber!<CR>:set relativenumber?<CR>
nnoremap cos :<C-u>setlocal spell!<CR>:set spell?<CR>
nnoremap cot :<C-u>set ft=
nnoremap cow :<C-u>setlocal wrap!<CR>:set wrap?<CR>
nnoremap coz :<C-u>set foldmethod=<C-R>=&foldmethod == 'manual' ? 'syntax' : 'manual'<CR><CR>
" Clipboard
nnoremap cp "*p
nnoremap cy "*y
nnoremap cpp "*pp
nnoremap cyy "*yy
nnoremap cP "*p$
nnoremap cY "*y$
vnoremap <C-p> "*p
vnoremap <C-y> "*y
" Readline-ish bindings in Command-line mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
" same bindings for merging diffs as in normal mode
vnoremap <C-d> :diffput<cr>
vnoremap <C-e> :diffget<cr>

" Change guifont
command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
" Cursor behavior
if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" Leader and maps {{{2

let maplocalleader="\\"

" Folding
nnoremap <silent> ]z zj
nnoremap <silent> [z zk
" Kill, save or quit
nnoremap <silent> <Space>k :bd!<CR>
nnoremap <silent> <Space>w :update<CR>
nnoremap <silent> dr :redraw!<CR>
" Tabs
nnoremap <Space><Tab> gt
nnoremap <Space><BS> gT
nnoremap gt :tabe<CR>
nnoremap gT :tabc<CR>
" Open in Finder
nnoremap gF :!open %:p:h<CR>
" Open in Safari
nnoremap gB :!open -a Safari %<CR>
" Markdown folding
let g:markdown_fold_style = 'nested'

" Plugins {{{2

" Colorschemes {{{3
Plug 'flazz/vim-colorschemes'

" Undotree {{{3
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
nnoremap <silent> U :MundoToggle<CR>

" Registers - fancy {{{3
Plug 'junegunn/vim-peekaboo'

" Insert unicode better {{{3
Plug 'chrisbra/unicode.vim',
            \ {'on': ['<Plug>(UnicodeGA)', '<Plug>(MakeDigraph)',
            \ 'Digraphs', 'UnicodeSearch']}
let g:Unicode_ShowPreviewWindow = 1
nmap ga <Plug>(UnicodeGA)
nmap gz <Plug>(MakeDigraph)
nnoremap gN :Digraphs<Space>
nnoremap gV :UnicodeSearch<Space>

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
nnoremap [q :cold<CR>
nnoremap ]q :cnew<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [l :lold<CR>
nnoremap ]l :lnew<CR>
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
nnoremap [n ?^<\+\s*HEAD$<CR>
nnoremap ]n /^<\+\s*HEAD$<CR>

" arrow keys to navigate quickfix/location list
nnoremap <silent> <up> :lprevious<CR>
nnoremap <silent> <down> :lnext<CR>
nnoremap <silent> <left> :cprevious<CR>
nnoremap <silent> <right> :cnext<CR>

" Other useful maps {{{3
" Auto-center
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz
nnoremap <silent> G Gzz
nnoremap <silent> k gk
nnoremap <silent> j gj
" Free Tab
nnoremap <C-p> <C-i>
" Folding - lock tab
nnoremap <silent> <C-i> za
" Vimrc
nnoremap cv :vsp $MYVIMRC<CR>

" Functions and commands {{{2

" Filter from quickfix list - someone's vimrc {{{3
function! GrepQuickFix(pat)
    let qfl = getqflist()
    for d in qfl
        if bufname(d['bufnr']) !~ a:pat && d['text'] !~ a:pat
            call remove(qfl, index(qfl,d))
        endif
    endfor
    call setqflist(qfl)
endfunction
command! -nargs=* QFilter call GrepQuickFix(<q-args>)
nnoremap gQ :QFilter<Space>

" Filter from location list {{{3
function! GrepLocList(pat)
    let ll = getloclist(0)
    for d in ll
        if bufname(d['bufnr']) !~ a:pat && d['text'] !~ a:pat
            call remove(ll, index(ll,d))
        endif
    endfor
    call setloclist(0,ll)
endfunction
command! -nargs=* LFilter call GrepLocList(<q-args>)
nnoremap gL :LFilter<Space>

" Common directory changes {{{3
command! CD cd %:p:h
command! LCD lcd %:p:h
nnoremap cd :LCD<CR>
command! WCD :windo cd %:p:h<CR>
command! TCD :tabdo cd %:p:h<CR>

" Leader maps {{{2

" Quickfix and Location list maps {{{3
let g:lt_height = get( g:, 'lt_height', 10 )

function! s:BufferCount()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function! s:LListToggle()
    let buffer_count_before = s:BufferCount()
    " Location list can't be closed if there's cursor in it, so we need
    " to call lclose twice to move cursor to the main pane
    silent! lclose
    silent! lclose

    if s:BufferCount() == buffer_count_before
        execute "silent! lopen " . g:lt_height
    endif
endfunction
command!  LToggle call s:LListToggle()
nnoremap <silent> <Space>l :LToggle<CR>

function! s:QListToggle()
    let buffer_count_before = s:BufferCount()
    silent! cclose

    if s:BufferCount() == buffer_count_before
        execute "silent! botright copen " . g:lt_height
    endif
endfunction
command!  QToggle call s:QListToggle()
nnoremap <silent> <Space>q :QToggle<CR>

" Plugins {{{2

" Go to project root automatically - Rooter {{{3
Plug 'airblade/vim-rooter'
" let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['.git/', 'CMakeLists.txt', '.svn/']
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
nnoremap cu :Rooter<CR>

" View directory structure - useful sometimes {{{3
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTree']}
nnoremap <silent> <Space>n :NERDTreeToggle<CR>
nnoremap vx :NERDTree ~/Dropbox/PhD<CR>

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
" Jump directly to the end of huge lists instead of paging
set nomore

" Maps without leader {{{2
" Populating the location list
nnoremap <silent> g/ *N:lvimgrep // %<CR>
nnoremap <silent> g? :lvimgrep // %<CR>

" Automatically disable search highlighting {{{2
Plug 'junegunn/vim-slash'

" Vim grepper plugin {{{2
Plug 'mhinz/vim-grepper', {'on': ['Grepper', '<Plug>(GrepperOperator)']}
" Mimic :grep and make ag the default tool.
let g:grepper = {
            \ 'tools': [ 'ag', 'pt', 'ack', 'git', 'grep'],
            \ 'open':  1,
            \ 'jump':  0,
            \ 'next_tool': ']g'
            \ }
nnoremap gss :Grepper -tool ag -noswitch<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Search and replace across project - trial {{{2
Plug 'dyng/ctrlsf.vim', {'on': ['CtrlSFUpdate', 'CtrlSF', '<Plug>CtrlSFVwordExec']}
let g:ctrlsf_mapping = {
    \ "next": "n",
    \ "prev": "N",
    \ }
let g:ctrlsf_position = 'right'
nnoremap <silent> gE :CtrlSFUpdate<CR>
nnoremap <silent> ge :CtrlSF<CR>
vmap ge <Plug>CtrlSFVwordExec

" FZF {{{1
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix='Fzf'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Prefer tmux for actions
let g:fzf_prefer_tmux = 1
" Actions
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-o': '!open'}
nnoremap <silent> t :FzfBTags<CR>
nnoremap <silent> J :FzfAg <C-R><C-W><CR>
nnoremap <silent> T :FzfTags <C-R><C-W><CR>
nnoremap <silent> cot :FzfFiletypes<CR>
nnoremap <silent> <Space>` :FzfMarks<CR>
nnoremap <silent> <Space>. :FzfColors<CR>
nnoremap <silent> <Space>/ :FzfLines<CR>
nnoremap <silent> <Space>? :FzfHistory/<CR>
nnoremap <silent> <Space>y :FzfAg <C-R><C-W><CR>
nnoremap <silent> <Space>c :FzfBCommits<CR>
nnoremap <silent> <Space>C :FzfCommits<CR>
nnoremap <silent> <Space>d :FzfGFiles<CR>
nnoremap <silent> <Space>f :FzfFiles<CR>
nnoremap <silent> <Space>F :FzfFiles ~<CR>
nnoremap <silent> <Space>r :FzfHistory<CR>
nnoremap <silent> <Space>a :FzfBuffers<CR>
nnoremap <silent> <Space>t :FzfWindows<CR>
nnoremap <silent> <Space>x :FzfHelptags<CR>
nnoremap <silent> <Space>p :FzfAg<CR>
nnoremap <silent> <Space>j :FzfCommands<CR>
vnoremap <silent> <Space>j :FzfCommands<CR>
nnoremap <silent> <Space>: :FzfHistory:<CR>
vnoremap <silent> <Space>: :FzfHistory:<CR>
nnoremap <silent> <C-l> :FzfSnippets<CR>
nmap <Space>, <Plug>(fzf-maps-n)
xmap <Space>, <Plug>(fzf-maps-x)
omap <Space>, <Plug>(fzf-maps-o)
imap <silent> <C-d> <Plug>(fzf-complete-word)
imap <silent> <C-x><C-l> <Plug>(fzf-complete-line)
" PhD related stuff
nnoremap <silent> <Space>b :FzfFiles ~/Dropbox/PhD<CR>
nnoremap dx :enew <bar> cd ~/Dropbox/PhD/<CR>

" Search spotlight {{{2
command! -nargs=1 FzfSpotlight call fzf#run({
            \ 'source'  : 'mdfind -onlyin ~ <q-args>',
            \ 'sink'    : 'e',
            \ 'options' : '-m --prompt "Spotlight> "'
            \ })
nnoremap <Space>s :FzfSpotlight<Space>
nnoremap <Space>S :FzfSpotlight <C-R><C-W><CR>

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
autocmd BufNewFile,BufReadPost *.txt,*.text,*.md,*.mkd,*.markdown set filetype=markdown
autocmd BufNewFile,BufReadPost *.clj set filetype=clojure
autocmd BufNewFile,BufReadPost *.jl set filetype=julia
autocmd BufNewFile,BufReadPost *.m set filetype=matlab
autocmd BufNewFile,BufRead *.plt set filetype=gnuplot
autocmd BufNewFile,BufRead *.r,*.R set filetype=r
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

" Maps without leader {{{2
" Make 'Y' work like 'C' and 'D'
nnoremap <silent> Y y$
" '&' remembers the flags of the last substitute
nnoremap & g&
" %% for current buffer file name
" :: for current buffer file path
cnoremap %% <c-r>=expand('%')<cr>
cnoremap :: <c-r>=expand('%:p:h')<cr>/
" repeat in visual mode
vnoremap . :normal .<CR>
vnoremap <C-o> :normal<Space>
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
" Macros in visual mode
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Functions and commands {{{2

" Strip trailing whitespace {{{3
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
command! StripWhiteSpace :call StripWhitespace()
nnoremap crs :StripWhiteSpace<CR>

" Strip trailing whitespace {{{3
nnoremap crw :s/\s\+$//e<CR>
vnoremap <C-@> :s/\s\+$//e<CR>

" Convert tabs to whitespace {{{3
function! TabsToWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\t/  /e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
command! TabsToWhitespace :call TabsToWhitespace()
nnoremap crt :TabsToWhitespace<CR>

" strip ^M character at end of lines {{{3
function! StripNewLine()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\r//g
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
command! StripNewLine :call StripNewLine()
nnoremap crn :StripNewLine<CR>

" Fix last spelling error {{{3
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
inoremap <C-s> <Esc>:<C-u>call FixLastSpellingError()<cr>a
nnoremap <C-s> :<C-u>call FixLastSpellingError()<cr>

" Plugins {{{2

" Indentation settings for collaborative work {{{3
Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Better '.' command {{{3
Plug 'tpope/vim-repeat'

" Convert the line into a list and vice versa {{{4
nmap <Plug>LineToCheckbox I- [ ] <Esc>2h:call repeat#set("\<Plug>LineToCheckbox", v:count)<CR>
nmap <Space>= <Plug>LineToCheckbox
nmap <Plug>CheckboxToLine _df]x:call repeat#set("\<Plug>CheckboxToLine", v:count)<CR>
nmap <Space>+ <Plug>CheckboxToLine
nmap <Plug>LineToList I- <Esc>:call repeat#set("\<Plug>LineToList", v:count)<CR>
nmap <Space>- <Plug>LineToList
nmap <Plug>ListToLine _daW:call repeat#set("\<Plug>ListToLine", v:count)<CR>
nmap <Space>_ <Plug>ListToLine

" Elementary splitting and joining {{{4
nmap <Plug>ElementarySplit Dop==k$:call repeat#set("\<Plug>ElementarySplit", v:count)<CR>
nmap gS <Plug>ElementarySplit
nnoremap gJ J

" Blank the current line {{{4
nmap <Plug>BlankCurrentLine cc:call repeat#set("\<Plug>BlankCurrentLine", v:count)<CR>
nmap crb <Plug>BlankCurrentLine

" Move the current line {{{4
nmap <silent> <Plug>MoveLineUp :<c-u>execute 'move -1-'. v:count1<cr>:call repeat#set("\<Plug>MoveLineUp", v:count)<CR>
nmap [e <Plug>MoveLineUp
nmap <silent> <Plug>MoveLineDown :<c-u>execute 'move +'. v:count1<cr>:call repeat#set("\<Plug>MoveLineDown", v:count)<CR>
nmap ]e <Plug>MoveLineDown

" Blank line {{{4
nmap <silent> <Plug>BlankLineUp :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[:call repeat#set("\<Plug>BlankLineUp", v:count)<CR>
nmap [o <Plug>BlankLineUp
nmap <silent> <Plug>BlankLineDown :<c-u>put =repeat(nr2char(10), v:count1)<cr>:call repeat#set("\<Plug>BlankLineDown", v:count)<CR>
nmap ]o <Plug>BlankLineDown

" Blank character before/after current word {{{4
nmap <silent> <Plug>BlankCharLeft i l:call repeat#set("\<Plug>BlankCharLeft", v:count)<CR>
nmap [<Space> <Plug>BlankCharLeft
nmap <silent> <Plug>BlankCharRight a h:call repeat#set("\<Plug>BlankCharRight", v:count)<CR>
nmap ]<Space> <Plug>BlankCharRight

" Delete adjacent lines {{{4
nmap <silent> <Plug>DeleteLineUp kdd:call repeat#set("\<Plug>DeleteLineUp", v:count)<CR>
nmap [x <Plug>DeleteLineUp
nmap <silent> <Plug>DeleteLineDown jddk:call repeat#set("\<Plug>DeleteLineDown", v:count)<CR>
nmap ]x <Plug>DeleteLineDown

" Switch {{{3
Plug 'AndrewRadev/switch.vim'
let g:switch_mapping = "-"
let g:switch_custom_definitions =
            \ [
            \   {
            \     '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
            \     '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
            \     '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
            \     '\<\(\u\+\)\(_\u\+\)\+\>': "\\=tolower(substitute(submatch(0), '_', '-', 'g'))",
            \     '\<\(\l\+\)\(-\l\+\)\+\>': "\\=substitute(submatch(0), '-\\(\\l\\)', '\\u\\1', 'g')",
            \   },
            \ ['TODO', 'DONE', 'WAITING', 'CANCELLED'],
            \ ['[ ]', '[X]']
            \ ]
autocmd FileType tex,plaintex let b:switch_custom_definitions =
            \ [
            \    [ '\\tiny', '\\scriptsize', '\\footnotesize', '\\small', '\\normalsize', '\\large', '\\Large', '\\LARGE', '\\huge', '\\Huge' ],
            \    [ '\\displaystyle', '\\scriptstyle', '\\scriptscriptstyle', '\\textstyle' ],
            \    [ '\\part', '\\chapter', '\\section', '\\subsection', '\\subsubsection', '\\paragraph', '\\subparagraph' ],
            \    [ 'part:', 'chap:', 'sec:', 'subsec:', 'subsubsec:' ],
            \    [ 'fig:', 'sfig:', 'eqn:', 'tab:' ],
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
autocmd FileType gitrebase let b:switch_custom_definitions =
            \ [
            \   [ 'pick', 'reword', 'edit', 'squash', 'fixup', 'exec' ]
            \ ]

" Org mode like embedded code editing {{{3
Plug 'AndrewRadev/inline_edit.vim', {'on': 'InlineEdit'}
nnoremap <Space>i :InlineEdit<CR>
vnoremap <Space>i :InlineEdit<CR>

" Preview the substitution {{{3
Plug 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
let g:over_command_line_prompt = ">"
nnoremap <Space><Space> :OverCommandLine<CR>
vnoremap <Space><Space> :OverCommandLine<CR>

" Easy alignment plugin and auto-align {{{3
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
nnoremap gA :Tabularize<CR>
nnoremap gl :Tabularize /
vnoremap gl :Tabularize /
nnoremap g<Tab> :Tabularize /\s\+<CR>
vnoremap g<Tab> :Tabularize /\s\+<CR>
nnoremap g= :Tabularize /=<CR>
vnoremap g= :Tabularize /=<CR>
nnoremap g& :Tabularize /&<CR>
vnoremap g& :Tabularize /&<CR>
nnoremap g<Bar> :Tabularize /<bar><CR>
vnoremap g<Bar> :Tabularize /<bar><CR>
nnoremap g: :Tabularize /:<CR>
vnoremap g: :Tabularize /:<CR>

" Auto-align when typing | {{{4
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

" Multiple cursors - because why not? {{{3
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-l>'
let g:multi_cursor_quit_key='<C-g>'
nnoremap <C-n> :MultipleCursorsFind<Space>
vnoremap <C-n> :MultipleCursorsFind<Space>

" Text objects, operators and motions {{{1

" Text objects {{{2

" Onoremap based {{{3

" Operate on entire file {{{4
onoremap ia :<C-u>normal! gg^vGg_<CR>
xnoremap ia :<C-u>normal! gg^vGg_<CR>
onoremap aa :<C-u>normal! ggvG$<CR>
xnoremap aa :<C-u>normal! ggvG$<CR>

" Operate on entire line {{{4
onoremap il :<C-u>normal! ^vg_<CR>
xnoremap il :<C-u>normal! ^vg_<CR>
onoremap al :<C-u>normal! 0v$<CR>
xnoremap al :<C-u>normal! 0v$<CR>

" Edit a macro {{{4
nnoremap cq :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Text object plugins {{{3

" Adds some niceties {{{4
" Textobj - i,/a,/i;/a;/ir/ar and [next(n), prev(N)] for all
Plug 'wellle/targets.vim'
let g:targets_aiAI = 'ai  '
let g:targets_nlNL = 'nN  '
let g:targets_argTrigger = 'r'
let g:targets_argOpening = '[({[]'
let g:targets_argClosing = '[]})]'
let g:targets_argSeparator = '[,;]'

" Operate on indents - (operator)ii/ai/iI/aI {{{4
Plug 'michaeljsmith/vim-indent-object'

" Create your own text object {{{4
Plug 'kana/vim-textobj-user'

" Operate on variable segments (camelCase, snake_case and MixedCase) - (operator)iv/av {{{4
Plug 'kana/vim-textobj-user' | Plug 'Julian/vim-textobj-variable-segment'

" Operate on functions - (operator)if/af {{{4
Plug 'kana/vim-textobj-user' | Plug 'sriramkswamy/vim-textobj-function'

" Operate on comments - (operator)ic/ac/aC {{{4
Plug 'kana/vim-textobj-user' | Plug 'sriramkswamy/vim-textobj-comment'

" Niceties for Lisp editing {{{4
" Textobjects -
Plug 'guns/vim-sexp'
" Disable mapping hooks
let g:sexp_filetypes = ''
function! s:vim_sexp_mappings()
    xmap <silent><buffer> ad         <Plug>(sexp_outer_list)
    omap <silent><buffer> ad         <Plug>(sexp_outer_list)
    xmap <silent><buffer> id         <Plug>(sexp_inner_list)
    omap <silent><buffer> id         <Plug>(sexp_inner_list)
    xmap <silent><buffer> aD         <Plug>(sexp_outer_top_list)
    omap <silent><buffer> aD         <Plug>(sexp_outer_top_list)
    xmap <silent><buffer> iD         <Plug>(sexp_inner_top_list)
    omap <silent><buffer> iD         <Plug>(sexp_inner_top_list)
    xmap <silent><buffer> ag         <Plug>(sexp_outer_string)
    omap <silent><buffer> ag         <Plug>(sexp_outer_string)
    xmap <silent><buffer> ig         <Plug>(sexp_inner_string)
    omap <silent><buffer> ig         <Plug>(sexp_inner_string)
    xmap <silent><buffer> ay         <Plug>(sexp_outer_element)
    omap <silent><buffer> ay         <Plug>(sexp_outer_element)
    xmap <silent><buffer> iy         <Plug>(sexp_inner_element)
    omap <silent><buffer> iy         <Plug>(sexp_inner_element)
    nmap <silent><buffer> (          <Plug>(sexp_move_to_prev_bracket)
    xmap <silent><buffer> (          <Plug>(sexp_move_to_prev_bracket)
    omap <silent><buffer> (          <Plug>(sexp_move_to_prev_bracket)
    nmap <silent><buffer> )          <Plug>(sexp_move_to_next_bracket)
    xmap <silent><buffer> )          <Plug>(sexp_move_to_next_bracket)
    omap <silent><buffer> )          <Plug>(sexp_move_to_next_bracket)
    nmap <silent><buffer> B          <Plug>(sexp_move_to_prev_element_head)
    xmap <silent><buffer> B          <Plug>(sexp_move_to_prev_element_head)
    omap <silent><buffer> B          <Plug>(sexp_move_to_prev_element_head)
    nmap <silent><buffer> ]d         <Plug>(sexp_move_to_next_element_head)
    xmap <silent><buffer> ]d         <Plug>(sexp_move_to_next_element_head)
    omap <silent><buffer> ]d         <Plug>(sexp_move_to_next_element_head)
    nmap <silent><buffer> [d         <Plug>(sexp_move_to_prev_element_tail)
    xmap <silent><buffer> [d         <Plug>(sexp_move_to_prev_element_tail)
    omap <silent><buffer> [d         <Plug>(sexp_move_to_prev_element_tail)
    nmap <silent><buffer> E          <Plug>(sexp_move_to_next_element_tail)
    xmap <silent><buffer> E          <Plug>(sexp_move_to_next_element_tail)
    omap <silent><buffer> E          <Plug>(sexp_move_to_next_element_tail)
    nmap <silent><buffer> [[         <Plug>(sexp_move_to_prev_top_element)
    xmap <silent><buffer> [[         <Plug>(sexp_move_to_prev_top_element)
    omap <silent><buffer> [[         <Plug>(sexp_move_to_prev_top_element)
    nmap <silent><buffer> ]]         <Plug>(sexp_move_to_next_top_element)
    xmap <silent><buffer> ]]         <Plug>(sexp_move_to_next_top_element)
    omap <silent><buffer> ]]         <Plug>(sexp_move_to_next_top_element)
    nmap <silent><buffer> [y         <Plug>(sexp_select_prev_element)
    xmap <silent><buffer> [y         <Plug>(sexp_select_prev_element)
    omap <silent><buffer> [y         <Plug>(sexp_select_prev_element)
    nmap <silent><buffer> ]y         <Plug>(sexp_select_next_element)
    xmap <silent><buffer> ]y         <Plug>(sexp_select_next_element)
    omap <silent><buffer> ]y         <Plug>(sexp_select_next_element)
    nmap <silent><buffer> ==         <Plug>(sexp_indent)
    nmap <silent><buffer> =-         <Plug>(sexp_indent_top)
    nmap <silent><buffer> csd(       <Plug>(sexp_round_head_wrap_list)
    xmap <silent><buffer> csd(       <Plug>(sexp_round_head_wrap_list)
    nmap <silent><buffer> csd)       <Plug>(sexp_round_tail_wrap_list)
    xmap <silent><buffer> csd)       <Plug>(sexp_round_tail_wrap_list)
    nmap <silent><buffer> csd[       <Plug>(sexp_square_head_wrap_list)
    xmap <silent><buffer> csd[       <Plug>(sexp_square_head_wrap_list)
    nmap <silent><buffer> csd]       <Plug>(sexp_square_tail_wrap_list)
    xmap <silent><buffer> csd]       <Plug>(sexp_square_tail_wrap_list)
    nmap <silent><buffer> csd{       <Plug>(sexp_curly_head_wrap_list)
    xmap <silent><buffer> csd{       <Plug>(sexp_curly_head_wrap_list)
    nmap <silent><buffer> csd}       <Plug>(sexp_curly_tail_wrap_list)
    xmap <silent><buffer> csd}       <Plug>(sexp_curly_tail_wrap_list)
    nmap <silent><buffer> csy(       <Plug>(sexp_round_head_wrap_element)
    xmap <silent><buffer> csy(       <Plug>(sexp_round_head_wrap_element)
    nmap <silent><buffer> csy)       <Plug>(sexp_round_tail_wrap_element)
    xmap <silent><buffer> csy)       <Plug>(sexp_round_tail_wrap_element)
    nmap <silent><buffer> csy[       <Plug>(sexp_square_head_wrap_element)
    xmap <silent><buffer> csy[       <Plug>(sexp_square_head_wrap_element)
    nmap <silent><buffer> csy]       <Plug>(sexp_square_tail_wrap_element)
    xmap <silent><buffer> csy]       <Plug>(sexp_square_tail_wrap_element)
    nmap <silent><buffer> csy{       <Plug>(sexp_curly_head_wrap_element)
    xmap <silent><buffer> csy{       <Plug>(sexp_curly_head_wrap_element)
    nmap <silent><buffer> csy}       <Plug>(sexp_curly_tail_wrap_element)
    xmap <silent><buffer> csy}       <Plug>(sexp_curly_tail_wrap_element)
    nmap <silent><buffer> gI         <Plug>(sexp_insert_at_list_head)
    nmap <silent><buffer> gA         <Plug>(sexp_insert_at_list_tail)
    nmap <silent><buffer> dsd        <Plug>(sexp_splice_list)
    nmap <silent><buffer> crd        <Plug>(sexp_raise_list)
    xmap <silent><buffer> crd        <Plug>(sexp_raise_list)
    nmap <silent><buffer> cry        <Plug>(sexp_raise_element)
    xmap <silent><buffer> cry        <Plug>(sexp_raise_element)
    nmap <silent><buffer> <d         <Plug>(sexp_swap_list_backward)
    xmap <silent><buffer> <d         <Plug>(sexp_swap_list_backward)
    nmap <silent><buffer> >d         <Plug>(sexp_swap_list_forward)
    xmap <silent><buffer> >d         <Plug>(sexp_swap_list_forward)
    nmap <silent><buffer> <y         <Plug>(sexp_swap_element_backward)
    xmap <silent><buffer> <y         <Plug>(sexp_swap_element_backward)
    nmap <silent><buffer> >y         <Plug>(sexp_swap_element_forward)
    xmap <silent><buffer> >y         <Plug>(sexp_swap_element_forward)
    nmap <silent><buffer> <(         <Plug>(sexp_emit_head_element)
    xmap <silent><buffer> <(         <Plug>(sexp_emit_head_element)
    nmap <silent><buffer> >)         <Plug>(sexp_emit_tail_element)
    xmap <silent><buffer> >)         <Plug>(sexp_emit_tail_element)
    nmap <silent><buffer> >(         <Plug>(sexp_capture_prev_element)
    xmap <silent><buffer> >(         <Plug>(sexp_capture_prev_element)
    nmap <silent><buffer> <)         <Plug>(sexp_capture_next_element)
    xmap <silent><buffer> <)         <Plug>(sexp_capture_next_element)
    imap <silent><buffer> <BS>       <Plug>(sexp_insert_backspace)
    imap <silent><buffer> "          <Plug>(sexp_insert_double_quote)
    imap <silent><buffer> (          <Plug>(sexp_insert_opening_round)
    imap <silent><buffer> )          <Plug>(sexp_insert_closing_round)
    imap <silent><buffer> [          <Plug>(sexp_insert_opening_square)
    imap <silent><buffer> ]          <Plug>(sexp_insert_closing_square)
    imap <silent><buffer> {          <Plug>(sexp_insert_opening_curly)
    imap <silent><buffer> }          <Plug>(sexp_insert_closing_curly)
endfunction
augroup VIM_SEXP_MAPPING
    autocmd!
    autocmd FileType clojure,scheme,lisp,racket call s:vim_sexp_mappings()
augroup END

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
nnoremap <silent> go :set opfunc=SourceVimscript<cr>g@
vnoremap <silent> go :<c-U>call SourceVimscript("visual")<cr>
nnoremap <silent> goo :call SourceVimscript("currentline")<cr>

" Plugins {{{3

" Better surround - cs/ds/ys(to add surrounding) {{{4
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

" Easy commenting - gc(motion/textobject) {{{4
Plug 'tomtom/tcomment_vim'

" Replace the object with content in register - ["x]gr(motion/textobject) {{{4
Plug 'vim-scripts/ReplaceWithRegister'

" Exchange stuff - cx(motion/textobject) and repeat it at the new point {{{4
Plug 'tommcdo/vim-exchange'
nmap <silent> <Plug>ExchangeWordRight cxiweecxiw :call repeat#set("\<Plug>ExchangeWordRight", v:count)<CR>
nmap ]w <Plug>ExchangeWordRight
nmap <silent> <Plug>ExchangeWordLeft cxiwbcxiw :call repeat#set("\<Plug>ExchangeWordLeft", v:count)<CR>
nmap [w <Plug>ExchangeWordLeft
nmap <silent> <Plug>ExchangeWORDRight cxiWWcxiW :call repeat#set("\<Plug>ExchangeWORDRight", v:count)<CR>
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

" Create your own operators {{{4
Plug 'kana/vim-operator-user'

" Motions {{{2

" Snippets {{{1
" Snippet plugin and snippet collection {{{2
if has('python') || has('python3')
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Snippets collection
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsListSnippets="<C-l>"
endif

" Version control {{{1

" view changes {{{2
" Also adds text objects ah/ih for changeset but normal vim-diff changeset motions hold - ]([)c
Plug 'mhinz/vim-signify'
let g:signify_sign_change = '~'
let g:signify_vcs_list = ['git', 'svn', 'hg', 'bzr', 'perforce']
omap ih <Plug>(signify-motion-inner-pending)
xmap ih <Plug>(signify-motion-inner-visual)
omap ah <Plug>(signify-motion-outer-pending)
xmap ah <Plug>(signify-motion-outer-visual)
nnoremap <silent> dr :SignifyRefresh<CR>:redraw!<CR>

" Git Wrapper {{{2
Plug 'tpope/vim-fugitive' | Plug 'idanarye/vim-merginal' , {'branch': 'develop'}
autocmd BufReadPost fugitive://* set bufhidden=delete " Delete all fugitive buffers except this
nnoremap <silent> <Space>g :Gstatus<CR>
nnoremap du :Gdiff<CR>
" Blame people!
nnoremap <silent> gb :Gblame<CR>
" Toggle merginal
nnoremap <silent> gm :Merginal<CR>

" Project/Session management {{{1
Plug 'tpope/vim-obsession'
nnoremap sr :Obsess ~/.vim/session/
nnoremap sp :Obsess<CR>
nnoremap so :source ~/.vim/session/
nnoremap sd :Obsess!<CR>
nnoremap sq :qall<CR>

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

" Aggregate completions {{{2
Plug 'maxboisvert/vim-simple-complete'
let g:vsc_tab_complete = 0

" Language helpers {{{1

" Vim script {{{2
Plug 'tpope/vim-scriptease', {'for': 'vim'}
augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap <buffer> J :helpgrep <C-R><C-W><CR>
augroup end

" C/C++ {{{2
" Autocompletion
Plug 'justmao945/vim-clang' , {'for': ['cpp', 'c']}
let g:clang_compilation_database = './build'
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_diagsopt = ''   " disable diagnostics

" Indexer (for cmake projects)
Plug 'lyuts/vim-rtags' , {'for': ['cpp', 'c']}
autocmd filetype c,cpp setl completefunc=RtagsCompleteFunc
let g:rtagsUseDefaultMappings = 0
let g:rtagsUseLocationList = 0
let g:rtagsMinCharsForCommandCompletion = 2
command! CppJumpTo call rtags#JumpTo(g:SAME_WINDOW)
command! CppJumpToParent call rtags#JumpToParent()
command! CppReference call rtags#FindRefsOfWordUnderCursor()
command! CppSymbol call rtags#FindSymbolsOfWordUnderCursor()
command! CppVirtuals call rtags#FindVirtuals()
command! CppReindex call rtags#ReindexFile()
command! CppRename call rtags#RenameSymbolUnderCursor()
command! CppProjects call rtags#ProjectList()
augroup filetype_cpp
    autocmd!
    autocmd FileType c,cpp nnoremap <buffer> J :call rtags#JumpTo(g:SAME_WINDOW)<CR>
    autocmd FileType c,cpp nnoremap <buffer> K :call rtags#SymbolInfo()<CR>
augroup end

" Python {{{2
" Autocompletion and some jumping
Plug 'davidhalter/jedi-vim' , {'for': 'python'}
autocmd filetype python setl omnifunc=jedi#completions
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""
command! PyGoTo call jedi#goto()
command! PyGoToAssignment call jedi#goto_assignments()
command! PyGoToDefinition call jedi#goto_definitions()
command! PyRename call jedi#rename()
command! PyRenameVisual call jedi#rename_visual()
augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> J :call jedi#goto()<CR>
augroup end

" Much better Python text objects and goodies
Plug 'tweekmonster/braceless.vim'
command! BracelessOn BracelessEnable +indent +fold +highlight
command! BracelessOff BracelessEnable -indent -fold -highlight
nnoremap g. :BracelessOn<CR>
nnoremap g_ :BracelessOff<CR>
autocmd FileType python BracelessOn
let g:braceless_generate_scripts = 1
let g:braceless_enable_easymotion = 0
let g:braceless_block_key = 'b'
let g:braceless_easymotion_segment_key = ''

" JavaScript {{{2
" Tern based autocompletion and navigation
Plug 'ternjs/tern_for_vim' , {'do': 'npm install', 'for': 'javascript'}
augroup filetype_javascript
    autocmd!
    autocmd FileType js,javascript nnoremap <buffer> K :TernDoc<CR>
    autocmd FileType js,javascript nnoremap <buffer> J :TernDef<CR>
augroup end

" Go {{{2
" Autocompletion and navigation
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for': 'go'}
augroup filetype_go
    autocmd!
    autocmd FileType go nnoremap <buffer> gC :compiler! go<CR>
    autocmd FileType go nnoremap <buffer> K :GoDoc<CR>
    autocmd FileType go nnoremap <buffer> J :GoDef<CR>
augroup end

" HTML/CSS {{{2
Plug 'rstacruz/sparkup', {'for': ['html', 'css']}
let g:sparkupExecuteMapping = '<C-b>'
let g:sparkupNextMapping = '<C-j>'
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> gC :compiler! tidy<CR>
augroup end

" Java (Eclim) - Eclipse plus Vim {{{2
let g:EclimShowQuickfixSigns = 0
let g:EclimShowLoclistSigns = 0
let g:EclimShowCurrentError = 1
let g:EclimShowCurrentErrorBalloon = 0

" Ruby (on Rails) {{{2
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
" Vim-ruby - also adds im/am text object
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1
" let g:rubycomplete_use_bundler = 1
Plug 'tpope/vim-rails', {'for': 'ruby'}
nnoremap <Space>v :A
Plug 'danchoi/ri.vim', {'for': 'ruby'}
let g:ri_no_mappings=1
augroup filetype_ruby
    autocmd!
    autocmd FileType ruby nnoremap <buffer> gC :compiler! rake<CR>
    autocmd FileType ruby nnoremap <buffer> K :call ri#LookupNameUnderCursor()<CR>
augroup end

" R {{{2
" Alternative installing 1 for Nvim-R do the following -
" Download it from https://github.com/jalvesaq/Nvim-R/releases
" mkdir -p ~/.local/share/nvim/site/pack/R
" cd ~/.local/share/nvim/site/pack/R
" If you downloaded it to <dir>, the do
" unzip <dir>/Nvim-R_0.9.7.zip
" Install the helptags from Neovim
" :helptags ~/.local/share/nvim/site/pack/R/start/Nvim-R/doc
" Alternative installing 1 for Nvim-R do the following -
" Download vimball from http://www.vim.org/scripts/script.php?script_id=2628
" Open it
" Use these two following commands
" :packadd vimball
" :so %
Plug 'jalvesaq/Nvim-R', {'for': 'r'}
Plug 'chrisbra/csv.vim', {'for': 'csv'}
let R_vsplit = 1
let R_tmux_split = 1
let R_args = ['--no-save', '--quiet']

" Maps {{{3
" Complete the arguments
inoremap <C-\> <C-x><C-a>
" Normal maps apart from '\' based maps
nmap mR <Plug>RStart
nmap mQ <Plug>RClose
augroup filetype_r
    autocmd!
    " maps
    autocmd FileType r nnoremap <buffer> K :call RAction("help")<CR>
    " variable viewing
    " what's the object
    autocmd FileType r nmap <buffer> mh <Plug>RObjectPr
    " show object
    autocmd FileType r nmap <buffer> m? <Plug>RObjectStr
    " show output
    autocmd FileType r nmap <buffer> ma <Plug>RShowRout
    " open the current variable in csv format
    autocmd FileType r nmap <buffer> mj <Plug>RViewDF
    " summary of the variable
    autocmd FileType r nmap <buffer> my <Plug>RSummary
    " list all variables in the current working space
    autocmd FileType r nmap <buffer> mb <Plug>RListSpace
    " update browser
    autocmd FileType r nmap <buffer> mu <Plug>RUpdateObjBrowser
    " open lists
    autocmd FileType r nmap <buffer> m[ <Plug>ROpenLists
    " close lists
    autocmd FileType r nmap <buffer> m] <Plug>RCloseLists
    " repl interaction
    " run the current file
    autocmd FileType r nmap <buffer> mm <Plug>RSendFile
    " send the current para
    autocmd FileType r nmap <buffer> msap <Plug>REDSendParagraph
    " send the current function
    autocmd FileType r nmap <buffer> msaf <Plug>RDSendFunction
    " send the current function
    autocmd FileType r nmap <buffer> msif <Plug>RDSendFunction
    " send the current line
    autocmd FileType r nmap <buffer> mss <Plug>RDSendLine
    " send the current line and insert output
    autocmd FileType r nmap <buffer> m<Space> <Plug>RDSendLineAndInsertOutput
    " send the current selection
    autocmd FileType r vmap <buffer> ms <Plug>REDSendSelection
    " send the current selection and insert output
    autocmd FileType r vmap <buffer> m<Space> <Plug>RSendSelAndInsertOutput
    " simple plotting
    " plot the vector
    autocmd FileType r nmap <buffer> mfp <Plug>RPlot
    " help
    " show brief help on the function at point
    autocmd FileType r nmap <buffer> m? <Plug>RObjectNames
    " change the working directory
    autocmd FileType r nmap <buffer> m~ <Plug>RSetwd
    " other useful commands
    " clear screen
    autocmd FileType r nmap <buffer> mc <Plug>RClearConsole
    " exit R
    autocmd FileType r nmap <buffer> mmx <Plug>RClearAll
augroup end

" Documentation browser {{{2
Plug 'rizzatti/dash.vim', {'on': '<Plug>DashSearch'}
nmap <silent> gD <Plug>DashSearch

" Syntax checking {{{2
Plug 'benekastah/neomake'

" evoke neomake for every save
autocmd! BufWritePost * Neomake

" set compiler for others {{{3
if exists(":CompilerSet") != 2		" older Vim always used :setlocal
    command -nargs=* CompilerSet setlocal <args>
endif

" syntax checking for matlab {{{3
augroup syntax_matlab
    autocmd!
    autocmd FileType matlab CompilerSet makeprg=/Applications/MATLAB_R2016a.app/bin/maci64/mlint\ -id\ %\ %<
    autocmd FileType matlab CompilerSet errorformat=
                \%-P==========\ %f\ ==========,
                \%-G%>==========\ %s\ ==========,
                \%-G%>L\ %l\ (C\ %c):\ MDOTM%m,
                \L\ %l\ (C\ %c):\ %m,
                \L\ %l\ (C\ %c-%*[0-9]):\ %m,
                \%-Q
augroup end

" neomake maker for matlab {{{3
let g:neomake_matlab_mlint_maker = {
            \ 'exe': '/Applications/MATLAB_R2016a.app/bin/maci64/mlint',
            \ 'args': ['-id'],
            \ 'errorformat':
            \ '%EL %l (C %c): %*[a-zA-Z0-9]: %m,'.
            \ '%WL %l (C %c-%*[0-9]): %*[a-zA-Z0-9]: %m,',
            \ }
let g:neomake_matlab_enabled_makers = ['mlint']

" neomake maker for R {{{3
let g:neomake_r_lintr_maker = {
            \ 'exe': 'R',
            \ 'args': ['--slave', '--no-restore', '--no-save',
                     \ '-e', 'suppressPackageStartupMessages(library(lintr))',
                     \ '-e', 'lint(cache = FALSE, commandArgs(TRUE), default_linters)',
                     \ '--args'],
            \ 'errorformat':
            \ '%I%f:%l:%c: style: %m,' .
            \ '%W%f:%l:%c: warning: %m,' .
            \ '%E%f:%l:%c: error: %m,',
            \ }
let g:neomake_r_enabled_makers = ['lintr']

" REPL and Tmux {{{1

" let commands and maps without leader {{{2
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

" terminal
nnoremap g\ <C-z>
nnoremap <silent> <Space>e :!tig<CR>
nnoremap gG :!googler<Space>
nnoremap <silent> g{ :!googler <cWORD><CR>
nnoremap <silent> g} :!googler <cword><CR>
vnoremap gG :!googler<Space>
vnoremap <silent> g{ :!googler <cWORD><CR>
vnoremap <silent> g} :!googler <cword><CR>

" basic tmux integration leader maps {{{2
if exists('$TMUX')
    nnoremap <silent> <Space>u :call system("tmux split-window -h")<CR>
else
    " dispatch.vim required
    nnoremap <silent> <Space>u :Spawn<CR>
endif

" Zoom when in Tmux(>v1.8)
if exists('$TMUX')
    nnoremap <silent> <Space>z :call system("tmux resize-pane -Z")<CR>
    nnoremap <silent> <C-\> :call system("tmux copy-mode")<CR>
endif

" Plugins {{{2

" Common *nix commands {{{3
Plug 'tpope/vim-eunuch',
            \ {'on': ['Remove', 'Rename', 'Move', 'Mkdir', 'Wall',
            \ 'SudoWrite', 'SudoEdit']}
nnoremap gK :Remove
nnoremap gR :Rename<Space>
nnoremap gM :Move<Space>
nnoremap dm :Mkdir<Space>
command! CopyFileName let @+ = expand('%:p')
nnoremap gY :CopyFileName<CR>
command! CopyFilePath let @+ = expand('%:p:h')
nnoremap ym :CopyFilePath<CR>
nnoremap su :SudoEdit<CR>
nnoremap sU :SudoWrite<CR>
nnoremap <Space>W :Wall<CR>

" Bulk renaming {{{3
Plug 'qpkorr/vim-renamer', {'on': ['Renamer', 'Ren', 'RenTest', '<Plug>RenamerStart']}
nnoremap gW :Renamer<Space>
nnoremap gw :Ren<CR>
nnoremap Z :RenTest<CR>
nmap W <Plug>RenamerStart

" Dispatch stuff {{{3
Plug 'tpope/vim-dispatch', {'on': ['Spawn', 'Start', 'Make', 'Dispatch', 'Copen']}
nnoremap gh :Spawn<Space>
nnoremap gH :Start<Space>
nnoremap cm :Make!<CR>
nnoremap sm :Make! %<CR>
nnoremap vm :Make -C build<CR>
nnoremap vo :Make -C build doc<CR>
nnoremap vr :Make -C docs/latex<CR>
nnoremap <Space>h :Dispatch!<Space>
nnoremap <silent> <Space>o :Copen<CR>

" Dispatch based commands {{{4

" regenerate ctags
nnoremap dc :Dispatch! ctags -R %:p:h<CR>

" post file as gist or clipboard as gist
nnoremap gp :Dispatch! gist % -cd ""<Left>
nnoremap gP :Dispatch! gist -Pcd ""<Left>

" asynchrous git operations
command! GitPush Dispatch! git push
command! GitPull Dispatch! git pull

" Single file C++ compilation with different flags
command! GppSimple Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -g -o %:p:r.out %
command! GppSingle Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GppOpenmp Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GppMpi Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpic++ -std=c++11 -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GppHybrid Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpic++ -std=c++11 -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GppArmadillo Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g -o %:p:r.out %

" Single file C compilation with different flags
command! GccSimple Dispatch! cd %:p:h <bar> gcc -Wall -g -o %:p:r.out %
command! GccSingle Dispatch! cd %:p:h <bar> gcc! -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GccOpenmp Dispatch! cd %:p:h <bar> gcc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GccMpi Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GccHybrid Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GccArmadillo Dispatch! cd %:p:h <bar> gcc -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g -o %:p:r.out %

" count the number of words in the document
command! TexCount Dispatch! texcount %

" convert markdown to other formats
command! ConvertToPDF Dispatch! pandoc % -V geometry:margin=2cm -o %:r.pdf
command! ConvertToOrg Dispatch! pandoc % -o %:r.org
command! ConvertToRst Dispatch! pandoc % -o %:r.rst
command! ConvertToLatex Dispatch! pandoc % -o %:r.tex
command! ConvertToEpub3 Dispatch! pandoc % -o %:r.epub
command! ConvertToHTML5 Dispatch! pandoc % -o %:r.html
command! ConvertToOPML Dispatch! multimarkdown -t opml % > %:r.opml

" start rtags when in c or cpp files
autocmd FileType c,cpp :Dispatch! rdm &<CR>

" Piping to eval {{{3
Plug 'zweifisch/pipe2eval'
nnoremap g$ :Pipe2<Space>
vnoremap g$ :Pipe2<Space>
vnoremap m<Space> ':!~/.vim/plugged/pipe2eval/plugin/pipe2eval.sh text<CR><CR>'
let g:pipe2eval_map_key = 'm<Space>'

" Tmux integration {{{3
Plug 'jebaum/vim-tmuxify'
let g:tmuxify_map_prefix = ''
let g:tmuxify_custom_command = 'tmux split-window -d -l 10'
let g:tmuxify_run = {
            \ 'sh': 'bash %',
            \ 'go': 'go build %',
            \ 'tex': 'latexmk -pdf -pvc %',
            \ 'python': 'ipython',
            \ 'R': 'R --no-save --quiet',
            \ 'matlab': 'matlab',
            \ 'julia': 'julia',
            \ 'scheme': 'racket',
            \ 'racket': 'racket',
            \ 'sml': 'sml',
            \}

" Mappings for any tmux session {{{4
" put me in an easy editing modes
nnoremap m, :TxSend<CR><C-P>
nnoremap m. :TxSend<CR><C-R><C-W>
nnoremap m/ :TxSend<CR><C-F>
nnoremap m<Space> :TxSend<CR><C-R><C-W><C-F>
" pane changes
nnoremap <silent> m11 :TxSetPane 0:1.1<CR>
nnoremap <silent> m12 :TxSetPane 0:1.2<CR>
nnoremap <silent> m13 :TxSetPane 0:1.3<CR>
nnoremap <silent> m21 :TxSetPane 0:2.1<CR>
nnoremap <silent> m22 :TxSetPane 0:2.2<CR>
nnoremap <silent> m23 :TxSetPane 0:2.3<CR>
nnoremap <silent> m31 :TxSetPane 0:3.1<CR>
nnoremap <silent> m32 :TxSetPane 0:3.2<CR>
nnoremap <silent> m33 :TxSetPane 0:3.3<CR>
nnoremap <silent> mm11 :TxSetPane 1:1.1<CR>
nnoremap <silent> mm12 :TxSetPane 1:1.2<CR>
nnoremap <silent> mm13 :TxSetPane 1:1.3<CR>
nnoremap <silent> mm21 :TxSetPane 1:2.1<CR>
nnoremap <silent> mm22 :TxSetPane 1:2.2<CR>
nnoremap <silent> mm23 :TxSetPane 1:2.3<CR>
nnoremap <silent> mm31 :TxSetPane 1:3.1<CR>
nnoremap <silent> mm32 :TxSetPane 1:3.2<CR>
nnoremap <silent> mm33 :TxSetPane 1:3.3<CR>
" interaction maps
nnoremap <silent> mc :TxClear<CR>
nnoremap <silent> mx :TxSigInt<CR>
nnoremap <silent> mn :TxCreate<CR>
nnoremap <silent> mp :TxSetPane<CR>
nnoremap <silent> mq :TxKill<CR>
nnoremap <silent> mr :TxRun<CR>
nnoremap <silent> md :TxSetRunCmd<CR>
nnoremap <silent> mo :TxSend<CR>
nnoremap <silent> mss V"my:TxSend(@m)<CR>
" also check out the operator defined at the end of the file

" Stop plugin installation {{{1
call plug#end()

" Markdown section text object - (operator)id/ad for markdown section {{{1
call textobj#user#plugin('markdown', { '-': {
            \ 'select-a-function': 'MarkdownA', 'select-a': 'ad',
            \ 'select-i-function': 'MarkdownI', 'select-i': 'id',
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

" Markdown code text object - (operator)io/ao for markdown code {{{1
call textobj#user#plugin('markdowncode', { '-': {
            \ 'select-a-function': 'MarkdownCodeA', 'select-a': 'ao',
            \ 'select-i-function': 'MarkdownCodeI', 'select-i': 'io',
            \ }, })
function! MarkdownCodeA()
    call search('^```\s*\w*$', 'bc')
    normal! 0
    let head_pos = getpos('.')
    normal! j
    call search('^```$', 'c')
    normal! $
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction
function! MarkdownCodeI()
    call search('^```\s*\w*$', 'bc')
    normal! j0
    let head_pos = getpos('.')
    call search('^```$', 'c')
    normal! k$
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

" LaTeX sections text object - (operator)ix/ax for latex section {{{1
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

" LaTeX environment text object - (operator)ie/ae for latex environment {{{1
call textobj#user#plugin('latexenv', { '-': {
            \ 'select-a-function': 'LatexEnvA', 'select-a': 'ae',
            \ 'select-i-function': 'LatexEnvI', 'select-i': 'ie',
            \ }, })
function! LatexEnvA()
    call search('^\\begin{.*}', 'bc')
    let head_pos = getpos('.')
    call search('\\end{.*}', 'c')
    normal! $
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction
function! LatexEnvI()
    call search('^\\begin{.*}', 'bc')
    normal! j
    let head_pos = getpos('.')
    call search('\\end{.*}', 'c')
    normal! 0h
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

" Hexo code text object - (operator)ik/ak {{{1
call textobj#user#plugin('hexocode', { '-': {
            \ 'select-a-function': 'HexocodeA', 'select-a': 'ak',
            \ 'select-i-function': 'HexocodeI', 'select-i': 'ik',
            \ }, })
function! HexocodeA()
    call search('^```\s*\[.*\]$', 'bc')
    normal! 0
    let head_pos = getpos('.')
    normal! j
    call search('^```$', 'c')
    normal! $
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction
function! HexocodeI()
    call search('^```\s*\[.*\]$', 'bc')
    normal! j0
    let head_pos = getpos('.')
    call search('^```$', 'c')
    normal! k$
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

" create an object to send things to tmux {{{1
map ms <Plug>(operator-tmuxify-send)
call operator#user#define('tmuxify-send', 'OperatorTmuxifySend')
function! OperatorTmuxifySend(motion_wise)
    let v = operator#user#visual_command_from_wise_name(a:motion_wise)
    execute 'normal!' '`[' . v . '`]"my'
    TxSend(@m)
endfunction

" Setup plugins, indents and syntax {{{1
filetype plugin indent on
syntax on

" Statusline - from scrooloose {{{1
" Basic setup
set statusline =%#identifier#
set statusline+=[%f]    "tail of the filename
set statusline+=%*
"display a warning if fileformat isn't unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
"display a warning if file encoding isn't utf-8
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
"display a warning if &spell is set
set statusline+=%#error#
set statusline+=%{&spell?'[spell]':''}
set statusline+=%*
"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
"display a warning if &ignorecase is set
set statusline+=%#error#
set statusline+=%{&ignorecase?'':'[case]'}
set statusline+=%*
"display a warning if &wrap is set
set statusline+=%#error#
set statusline+=%{&wrap?'[wrap]':''}
set statusline+=%*
"display a warning if &list is set
set statusline+=%#error#
set statusline+=%{&list?'[list]':''}
set statusline+=%*
set statusline+=\ %{fugitive#statusline()}

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l      "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2
set statusline+=\ %{ObsessionStatus()} " vim session status
set statusline+=\ %#ErrorMsg#%{neomake#statusline#LoclistStatus('Fix:\ ')}

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = ' [\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction
set statusline+=%{StatuslineTrailingSpaceWarning()}
"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" Set colorscheme {{{1
set termguicolors
set background=dark
colorscheme PaperColor
