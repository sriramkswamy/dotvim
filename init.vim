" vim:set et sts=0 sw=4 ts=4 tw=80 foldmethod=marker:

" Auto install vim-plug {{{1
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Start plugin installation {{{1
call plug#begin('~/.config/nvim/plugged')

" Buffer behaviour {{{1

" Set options {{{2
set title
" short strings for changes - don't give ins-completion messages
set shortmess+=c
" Automatically read and write buffers
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
" Ex commands
set wildmode=list:longest,full
set completeopt=menuone,longest,preview
set complete-=t " disable scanning tags
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
set nowritebackup
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
" Show text normally
set conceallevel=0

" Maps without leader {{{2

" quit whatever
nnoremap <Space>q :q<CR>
" Close all folds
nnoremap c- zM
nnoremap d- zM
" Alternate files
nnoremap <BS> :b#<CR>
" open file - I have no idea how I got used to this shortcut
nnoremap vo :e<Space>
" Keep me in visual mode
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" Add mark - frees up 'm' which I use for ftplugin maps
nnoremap + m
" Repeat the last macro instead of ex-mode
nnoremap Q @@
" set compiler
nnoremap gC :compiler!<Space>
" Navigate in insert mode
inoremap <silent> <C-a> <home>
inoremap <silent> <C-e> <end>
inoremap <silent> <C-f> <right>
inoremap <silent> <C-b> <left>
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
" inoremap <silent> <C-c> <C-x><C-f>
" Toggle few options - inspired by unimpaired
nnoremap coc :<C-u>setlocal cursorline!<CR>:set cursorline?<CR>
nnoremap cob :<C-u>set scrollbind!<C-w><C-w>:<C-u>set scrollbind!<CR><C-w><C-w>:set scrollbind?<CR>
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
nnoremap coR :<C-u>set ft=r<CR>:<C-u>set ft=rmd<CR>
nnoremap coy :<C-u>set ft?<CR>
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
cnoremap <C-b> <Left>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
" same bindings for merging diffs as in normal mode
vnoremap <C-d> :diffput<cr>
vnoremap <C-e> :diffget<cr>

" Change guifont
command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
" Cursor behavior
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Leader and maps {{{2

let maplocalleader="\\"

" Window management
nnoremap <silent> w <C-w>
nnoremap <silent> ww <C-w><C-w>
" Kill, save or quit
nnoremap <silent> <Space>a :bd!<CR>
nnoremap <silent> <Space>w :update<CR>
nnoremap <silent> dr :redraw!<CR>
" Tabs
nnoremap <Space><Tab> gt
nnoremap <Space><BS> gT
nnoremap gt :tabe<CR>
nnoremap gT :tabc<CR>
if has('macunix')
    " Open in default program
    nnoremap gF :!open <cfile><CR>
    " Open Finder
    nnoremap gH :!open %:p:h<CR>
    " Open in Safari
    nnoremap gB :!open -a Safari %<CR>
elseif has('unix')
    " Open in default program
    nnoremap gF :!xdg-open <cfile><CR>
    " Open file manager
    nnoremap gH :!xdg-open %:p:h<CR>
    " Open in Browser
    nnoremap gB :!xdg-open %<CR>
endif
" Markdown folding
let g:markdown_fold_style = 'nested'

" Plugins {{{2

" Colorschemes {{{3
Plug 'flazz/vim-colorschemes'

" Undotree {{{3
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
nnoremap <silent> U :UndotreeToggle<CR>

" Insert unicode better {{{3
Plug 'chrisbra/unicode.vim',
            \ {'on': ['<Plug>(UnicodeGA)', '<Plug>(MakeDigraph)',
            \ 'Digraphs', 'DigraphNew', 'UnicodeSearch']}
let g:Unicode_ShowPreviewWindow = 1
nmap ga <Plug>(UnicodeGA)
nmap gz <Plug>(MakeDigraph)
nnoremap gN :Digraphs<Space>
nnoremap gV :UnicodeSearch<Space>
inoremap <C-v> <C-k>

" Set new digraphs {{{4
function SetNewDigraphs()
    DigraphNew ii 3044
    DigraphNew nn 3093
endfunction
nnoremap <silent> cod :call SetNewDigraphs()<CR>

" Registers - fancy {{{3
Plug 'junegunn/vim-peekaboo'

" Inidcates indents {{{3
Plug 'tweekmonster/local-indent.vim'
command! LocalIndentOn LocalIndentGuide +hl +cc
command! LocalIndentOff LocalIndentGuide -hl -cc
autocmd FileType python,matlab LocalIndentGuide +hl +cc
autocmd FileType r,c,cpp LocalIndentGuide +hl +cc
nnoremap g. :LocalIndentOn<CR>
nnoremap g_ :LocalIndentOff<CR>

" File/Buffer navigation {{{1

" Netrw {{{2
let g:netrw_liststyle=3 " thin (change to 3 for tree)
let g:netrw_banner=0    " no banner
let g:netrw_altv=1      " open files on right
let g:netrw_preview=1   " open previews vertically

" Set commands {{{2
" Path for the builtin 'find' command
set path=.,**
" '%' matching
runtime macros/matchit.vim
set showmatch

" Maps without leader {{{2

" Unimpaired inspired mappings {{{3
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

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> Z :ZoomToggle<CR>

" Leader maps {{{2

" Netrw
nnoremap <Space>t :Lexplore<CR>

" check maps
nnoremap <Space>, :verbose map<Space>

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
nnoremap <silent> <Space>m :QToggle<CR>

" Plugins {{{2

" Go to project root automatically - Rooter {{{3
Plug 'airblade/vim-rooter'
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['.git/', 'CMakeLists.txt', '.svn/']
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
nnoremap <silent> dv :Rooter<CR>

" auto generate tags {{{3
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_exclude_project_root = ['~/']

" Searching {{{1

" Set commands {{{2
" Ignore case sensitivity
set ignorecase " Can be toggled with unimpaired's 'coi'
set smartcase
" Highlight search incrementally
set hlsearch " Can be toggled with unimpaired's 'coh'
set incsearch
" Jump directly to the end of huge lists instead of paging
set nomore

" Grep {{{2
" set appropriate grep programs
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
else
    set grepprg=grep\ -nH\ $*
endif

" Maps without leader {{{2
" Populating the location list
nnoremap <silent> # :nohl<CR>
nnoremap <silent> gh :nohl<CR>
nnoremap <silent> g# :lvimgrep /<C-R>// %<CR>
nnoremap g/ :lvimgrep // %<Left><Left><Left>
nnoremap <silent> <Space>n *N:lvimgrep /<C-R>// %<CR>

" basic renaming
nnoremap <silent> - *Ncgn

" Automatically disable search highlighting {{{2
Plug 'junegunn/vim-slash'

" Vim grepper plugin {{{2
Plug 'mhinz/vim-grepper', {'on': ['Grepper', '<Plug>(GrepperOperator)']}
" Mimic :grep and make ag the default tool.
let g:grepper = {
            \ 'tools': [ 'rg', 'ag', 'pt', 'ack', 'git', 'grep'],
            \ 'open':  0,
            \ 'jump':  0,
            \ 'next_tool': ']g'
            \ }
nnoremap gss :Grepper -tool rg -noswitch<CR>:copen<CR>
nnoremap ge :Grepper -tool ag -cword -noprompt<CR>
nnoremap gE :Grepper -tool ag -cWORD -noprompt<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Note taking {{{1

" notes {{{2
nnoremap dn :tabe <bar> cd ~/Dropbox/PhD/<CR>:e<Space>
nnoremap cn :tabe <bar> cd ~/Dropbox/PhD/<CR>:e<Space>

" Create file links {{{3
nnoremap m<Space> :let @v = expand('%')<CR>:let @z = expand('%:t:r')<CR>
" Paste file links
nnoremap m, :let @x = '[<C-R>z](<C-R>v)'<CR>"xp

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
autocmd BufNewFile,BufReadPost *.md,*.mkd,*.markdown set filetype=markdown
autocmd BufNewFile,BufReadPost CMakeLists.txt set filetype=cmake
autocmd BufNewFile,BufReadPost *.clj set filetype=clojure
autocmd BufNewFile,BufReadPost *.jl set filetype=julia
autocmd BufNewFile,BufReadPost *.m set filetype=matlab
autocmd BufNewFile,BufRead *.plt set filetype=gnuplot
autocmd BufNewFile,BufRead *.r,*.R set filetype=r
" TeX and Markdown support
let g:tex_flavor='latex'
let g:tex_conceal = ""
let g:vim_markdown_disabled = 1
let g:vim_markdown_math = 1

" Text editing {{{1

" Set commands {{{2
" Don't wrap the lines - Can be toggled with unimpaired's 'cow'
set nowrap
set linebreak
set nolist
" Indentation
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
" repeat in visual mode
vnoremap . :normal .<CR>
vnoremap <C-o> :normal<Space>
" Macros in visual mode
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Preview the substitution - amazing feature {{{2
set inccommand=split

" Functions and commands {{{2

" Strip all trailing whitespace {{{3
function! StripAllWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
command! StripAllWhiteSpace :call StripAllWhitespace()
nnoremap cra :StripAllWhiteSpace<CR>

" show trailing whitespace {{{3
nnoremap crw :lvimgrep /\s\+$/ %<CR>
nnoremap crr :s/\s\+$//e<CR>

" Convert tabs to whitespace {{{3
function! TabsToWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\t/  /e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
command! TabsToWhitespace :call TabsToWhitespace()
nnoremap cro :TabsToWhitespace<CR>

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
nnoremap <C-s> :<C-u>call FixLastSpellingError()<CR>
inoremap <C-s> <Esc>:<C-u>call FixLastSpellingError()<CR>a

" Plugins {{{2

" Indentation settings for collaborative work {{{3
Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Better closing - experimental {{{3
Plug 'kana/vim-smartinput'

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

" Move the current line {{{4
nmap <silent> <Plug>MoveLineUp :<c-u>execute 'move -1-'. v:count1<cr>:call repeat#set("\<Plug>MoveLineUp", v:count)<CR>
nmap [e <Plug>MoveLineUp
nmap <silent> <Plug>MoveLineDown :<c-u>execute 'move +'. v:count1<cr>:call repeat#set("\<Plug>MoveLineDown", v:count)<CR>
nmap ]e <Plug>MoveLineDown

" Blank line {{{4
nmap <silent> <Plug>BlankLineUp :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[j:call repeat#set("\<Plug>BlankLineUp", v:count)<CR>
nmap [o <Plug>BlankLineUp
nmap <silent> <Plug>BlankLineDown :<c-u>put =repeat(nr2char(10), v:count1)<cr>k:call repeat#set("\<Plug>BlankLineDown", v:count)<CR>
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

" Abolish {{{3
Plug 'tpope/tpope-vim-abolish'
function SetAutoCorrect()
    Abolish   teh{,m,n}                                      the{}
    Abolish   {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}   {despe,sepa}rat{}
    Abolish   {,in}consistant{,ly}                           {}consistent{}
    Abolish   lan{gauge,gue,guege,guegae,ague,agueg}         language
    Abolish   delimeter{,s}                                  delimiter{}
    Abolish   {,non}existan{ce,t}                            {}existen{}
    Abolish   d{e,i}screp{e,a}nc{y,ies}                      d{i}screp{a}nc{}
    Abolish   {,un}nec{ce,ces,e}sar{y,ily}                   {}nec{es}sar{}
    Abolish   persistan{ce,t,tly}                            persisten{}
    Abolish   {,ir}releven{ce,cy,t,tly}                      {}relevan{}
    Abolish   cal{a,e}nder{,s}                               cal{e}ndar{}
    Abolish   reproducable                                   reproducible
    Abolish   retreive                                       retrieve
    Abolish   compeletly                                     completely
endfunction
nnoremap <silent> coa :call SetAutoCorrect()<CR>

" Org like code block narrowing in markdown {{{3
" also check out operator ge
Plug 'AndrewRadev/inline_edit.vim'
nnoremap <Space>i :InlineEdit<CR>
vnoremap <Space>i :InlineEdit<CR>

" Easy alignment plugin and auto-align {{{3
Plug 'junegunn/vim-easy-align' , {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
nmap gl <Plug>(EasyAlign)
xmap gl <Plug>(EasyAlign)
nnoremap g<Space> vip:EasyAlign \<CR>
vnoremap g<Space> vip:EasyAlign \<CR>
nnoremap g= vip:EasyAlign =<CR>
vnoremap g= vip:EasyAlign =<CR>
nnoremap g& vie:EasyAlign &<CR>
vnoremap g& vie:EasyAlign &<CR>
nnoremap g<Bar> vip:EasyAlign <bar><CR>
vnoremap g<Bar> vip:EasyAlign <bar><CR>
nnoremap g: vip:EasyAlign :<CR>
vnoremap g: vip:EasyAlign :<CR>
nnoremap g<Tab> vip:EasyAlign */\s\+%/<CR>
vnoremap g<Tab> vip:EasyAlign */\s\+%/<CR>
nnoremap <bar> :EasyAlign *//<Left>
vnoremap <bar> :EasyAlign *//<Left>

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

" Adds more textobjects {{{4
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

" Better surround - cs/ds/s(to add surrounding) {{{4
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
nmap <silent> <Plug>ExchangeArgNext cxirf,lcxir :call repeat#set("\<Plug>ExchangeSearchNext", v:count)<CR>
nmap ]r <Plug>ExchangeArgNext
nmap <silent> <Plug>ExchangeArgPrev cxirF,hcxir :call repeat#set("\<Plug>ExchangeSearchPrev", v:count)<CR>
nmap [r <Plug>ExchangeArgPrev

" Operate on lisp expressions {{{4
Plug 'bounceme/fairedit.vim'
" any operator ex. g~$ , c$ , d$ etc
omap $ <Plug>Fair_dollar
nmap C <Plug>Fair_C
nmap D <Plug>Fair_D
if maparg('Y','n') ==# 'y$'
  nmap Y <Plug>Fair_yEOL
endif

" Create your own operators {{{4
Plug 'kana/vim-operator-user'

" Motions {{{2

" Snippets {{{1
" Snippet plugin and snippet collection {{{2
if has('python3')
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Snippets collection
    let g:UltiSnipsUsePythonVersion = 3
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    let g:UltiSnipsEditSplit="context"
    let g:UltiSnipsListSnippets="<C-l>"
    nnoremap <silent> yo :UltiSnipsEdit<CR>
elseif has('python')
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Snippets collection
    let g:UltiSnipsUsePythonVersion = 2
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    let g:UltiSnipsEditSplit="context"
    let g:UltiSnipsListSnippets="<C-l>"
    nnoremap <silent> yo :UltiSnipsEdit<CR>
endif

" Version control {{{1

" view changes {{{2
" Also adds text objects ah/ih for changeset but normal vim-diff changeset motions hold - ]([)c
Plug 'mhinz/vim-signify'
let g:signify_sign_change = '~'
let g:signify_vcs_list = ['git', 'svn', 'hg', 'bzr', 'perforce']
omap ij <Plug>(signify-motion-inner-pending)
xmap ij <Plug>(signify-motion-inner-visual)
omap aj <Plug>(signify-motion-outer-pending)
xmap aj <Plug>(signify-motion-outer-visual)
nnoremap <silent> dr :SignifyRefresh<CR>:redraw!<CR>:SignifyEnable<CR>

" Git Wrapper {{{2
Plug 'tpope/vim-fugitive' | Plug 'idanarye/vim-merginal' , {'branch': 'develop'}
autocmd BufReadPost fugitive://* set bufhidden=delete " Delete all fugitive buffers except this
nnoremap <silent> <Space>g :Gstatus<CR>gg<C-n>
nnoremap cu :Gwrite<CR>
nnoremap yu :Gcommit<CR>O
nnoremap du :Gdiff<CR>
" Blame people!
nnoremap <silent> gb :Gblame<CR>
" Toggle merginal
nnoremap <silent> gm :Merginal<CR>

" Interactive rebasing and tree {{{3
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'
nnoremap <silent> gG :GV?<CR>
nnoremap <silent> <Space>c :GV<CR>
vnoremap <silent> gG :GV?<CR>
vnoremap <silent> <Space>c :GV<CR>

" Project/Session management {{{1
Plug 'tpope/vim-obsession'
nnoremap sr :Obsess ~/.vim/session/
nnoremap sp :Obsess<CR>
nnoremap so :source ~/.vim/session/
nnoremap sd :Obsess!<CR>
nnoremap sq :qall<CR>

" Debugging {{{1

" set the sign to be placed on the sign column for debuggingg {{{2
function! SetBreakpoint()
    " set the breakpoint character and set the breakpoint
    exe ':sign define mybreakpoint text=◉'
    let s:breakpointplaceline = line('.')
    exe ":sign place" s:breakpointplaceline " line=" . s:breakpointplaceline . " name=mybreakpoint file=" . expand('%:p')
endfunction

" Set the breakpoint {{{2
function! SetBreakIndicator()
    " set the breakpoint character and indicate the breakpoint
    exe ':sign define mybreakindicator text=➤'
    let s:breakpointplaceline = line('.')
    exe ":sign place" s:breakpointplaceline " line=" . s:breakpointplaceline . " name=mybreakindicator file=" . expand('%:p')
endfunction
nnoremap <> :call SetBreakIndicator()<CR>

" Unset the breakpoint {{{2
function! UnsetBreakpoint()
    let s:breakpointplaceline = line('.')
    exe ":sign unplace" s:breakpointplaceline
    if exists(':SignifyRefresh')
        SignifyRefresh
        redraw!
        SignifyEnable
    endif
endfunction
nnoremap >< :call UnsetBreakpoint()<CR>

" Remove all breakpoints {{{2
function! RemoveAllBreakpoints()
    exe ":sign unplace *"
    if exists(':SignifyRefresh')
        SignifyRefresh
        redraw!
        SignifyEnable
    endif
endfunction

" Language Support {{{1

" Vim script {{{2
Plug 'tpope/vim-scriptease', {'for': 'vim'}

" LaTeX {{{2
Plug 'lervag/vimtex'
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_text_obj_enabled = 0
let g:vimtex_imaps_enabled = 0
let g:vimtex_motion_enabled = 1
let g:vimtex_mappings_enabled = 0

" HTML/CSS {{{2
Plug 'rstacruz/sparkup', {'for': ['html', 'css']}
let g:sparkupExecuteMapping = '<C-b>'
let g:sparkupNextMapping = '<C-j>'

" R {{{2
" Download it from https://github.com/jalvesaq/Nvim-R/releases
Plug 'jalvesaq/Nvim-R'
" let R_vsplit = 1
let R_in_buffer = 0
let R_tmux_split = 1
let R_args = ['--no-save', '--quiet']

" Maps {{{3
" Complete the arguments
inoremap <C-\> <C-x><C-a>
" Normal maps apart from '\' based maps
nmap mR <Plug>RStart
nmap mQ <Plug>RClose

" CSV - nice display of csv {{{3
Plug 'chrisbra/csv.vim'

" Syntax checking {{{1
Plug 'w0rp/ale'

" Language Server Protocol {{{1
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
let g:LanguageClient_serverCommands = {
            \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
            \ 'python': ['pyls'],
            \ 'cpp': ['clangd']
            \ }

" start lsp when in c or cpp files {{{2
augroup lsp_cpp
    autocmd!
    autocmd FileType c,cpp LanguageClientStart
    autocmd FileType c,cpp setlocal completefunc=LanguageClient#complete()
augroup end

" start lsp when in python files {{{2
augroup lsp_py
    autocmd!
    autocmd FileType python LanguageClientStart
    autocmd FileType python setlocal completefunc=LanguageClient#complete()
augroup end

" start lsp when in c or cpp files {{{2
augroup lsp_r
    autocmd!
    autocmd FileType r LanguageClientStart
    autocmd FileType r setlocal completefunc=LanguageClient#complete()
augroup end

" Auto completion {{{1
Plug 'roxma/nvim-completion-manager'

" R completion {{{2
Plug 'gaalcaras/ncm-R'

" FZF {{{1
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix='Fzf'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Actions
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-o': '!open'}

" Ripgrep instead of Ag
command! -bang -nargs=* FzfRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> t :FzfBTags<CR>
nnoremap <silent> J :FzfRg <C-R><C-W><CR>
nnoremap <silent> T :FzfTags<CR>
nnoremap <silent> g] :FzfTags <C-R><C-W><CR>
nnoremap <silent> gw :FzfRg <C-R><C-W><CR>
nnoremap <silent> gW :FzfRg <C-R><C-A><CR>
vnoremap <silent> gw "gy:FzfRg <C-R>g<CR>
nnoremap <silent> sc :FzfSnippets<CR>
nnoremap <silent> cot :FzfFiletypes<CR>
nnoremap <silent> <Space>` :FzfMarks<CR>
nnoremap <silent> <Space>. :FzfColors<CR>
nnoremap <silent> <Space><Space> :FzfBLines<CR>
nnoremap <silent> <Space>/ :FzfHistory/<CR>
nnoremap <silent> <Space>d :FzfGFiles<CR>
nnoremap <silent> <Space>f :FzfFiles<CR>
nnoremap <silent> <Space>r :FzfHistory<CR>
nnoremap <silent> <Space>k :FzfBuffers<CR>
nnoremap <silent> <Space>h :FzfHelptags<CR>
nnoremap <silent> <Space>p :FzfRg<CR>
nnoremap <silent> <Space>j :FzfCommands<CR>
vnoremap <silent> <Space>j :<C-u>FzfCommands<CR>
nnoremap <silent> <Space>: :FzfHistory:<CR>
vnoremap <silent> <Space>: :FzfHistory:<CR>
nmap <Space>, <Plug>(fzf-maps-n)
xmap <Space>, <Plug>(fzf-maps-x)
omap <Space>, <Plug>(fzf-maps-o)
imap <silent> <C-d> <Plug>(fzf-complete-word)
imap <silent> <C-c> <Plug>(fzf-complete-path)
imap <silent> <C-x><C-l> <Plug>(fzf-complete-line)

" PhD related stuff
nnoremap dx :FzfFiles ~/Dropbox/PhD<CR>

" Search using spotlight {{{2
command! -nargs=1 FzfSpotlight call fzf#run(fzf#wrap({
            \ 'source'  : 'mdfind -onlyin ~ <q-args>',
            \ 'options' : '-m --prompt "Spotlight> "'
            \ }))
nnoremap <Space>s :FzfSpotlight<Space>

" Search bib using spotlight {{{2
command! -nargs=1 FzfBib call fzf#run(fzf#wrap({
            \ 'source'  : 'mdfind -onlyin ~/Dropbox/PhD <q-args>',
            \ 'options' : '-m --prompt "Bib> "'
            \ }))
nnoremap <Space>b :FzfBib<Space>

" Get back 't' and 'T' maps which keeps getting stolen {{{2
function GetBackTMaps()
    exec "nnoremap t :FzfBTags<CR>"
    exec "nnoremap T :FzfTags<CR>"
endfunction
nnoremap <silent> coo :call GetBackTMaps()<CR>

" Autocompletion {{{1

" vim-omnicomplete activation {{{2
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd filetype html,markdown,ctp setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd filetype vim setlocal omnifunc=syntaxcomplete#Complete
autocmd filetype xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd filetype cpp setlocal omnifunc=ccomplete#CompleteTags
" Close after auto completion
autocmd CompleteDone * pclose

" Maps for navigating autocompletion {{{2
" <C-j> and <C-k> for autocompletion navigation in insert mode
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-j>"

" REPL and Tmux {{{1

" let commands and maps without leader {{{2
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

" Neovim terminal - Go to normal mode
tnoremap <C-g> <C-\><C-n>

" terminal maps
nnoremap g\ :vsplit <bar> terminal<CR>
nnoremap g{ :vsp <bar> terminal googler <cWORD><Space>
nnoremap g} :vsp <bar> terminal googler <cWORD><CR>
vnoremap g{ "my:vsp <bar> terminal googler <C-R>m<Space>
vnoremap g} "my:vsp <bar> terminal googler <C-R>m<CR>

" tig client open
nnoremap <Space>e :vsp <bar> terminal tig<CR>

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
nnoremap gy :CopyFileName<CR>
command! CopyFilePath let @+ = expand('%:p:h')
nnoremap gY :CopyFilePath<CR>
nnoremap su :SudoEdit<CR>
nnoremap sU :SudoWrite<CR>

" run asynchronous commands {{{3
Plug 'skywind3000/asyncrun.vim'
nnoremap <Space>u :AsyncRun<Space>
nnoremap <Space>x :AsyncStop!<CR>:copen<CR>

" make
nnoremap sm :AsyncRun make<CR>:copen<CR>
nnoremap vm :AsyncRun make -C build<CR>:copen<CR>

" post file as gist
nnoremap gp :AsyncRun gist % -cd ""<Left>:copen<CR>
nnoremap gP :AsyncRun gist -Pcd ""<Left>:copen<CR>

" git operations
nnoremap vp :AsyncRun git push<CR>:copen<CR>
nnoremap vu :AsyncRun git pull<CR>:copen<CR>

" ctags
nnoremap vr :AsyncRun ctags -R %:p:h<CR>:copen<CR>

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
nnoremap m/ :TxSend<CR><C-F>
nnoremap m. :TxSend<CR><C-P>
" pane changes
nnoremap m11 :TxSetPane 0:1.1<Left><Left><Left><Left>
nnoremap m12 :TxSetPane 0:1.2<Left><Left><Left><Left>
nnoremap m13 :TxSetPane 0:1.3<Left><Left><Left><Left>
nnoremap m14 :TxSetPane 0:1.4<Left><Left><Left><Left>
nnoremap m21 :TxSetPane 0:2.1<Left><Left><Left><Left>
nnoremap m22 :TxSetPane 0:2.2<Left><Left><Left><Left>
nnoremap m23 :TxSetPane 0:2.3<Left><Left><Left><Left>
nnoremap m24 :TxSetPane 0:2.4<Left><Left><Left><Left>
nnoremap m31 :TxSetPane 0:3.1<Left><Left><Left><Left>
nnoremap m32 :TxSetPane 0:3.2<Left><Left><Left><Left>
nnoremap m33 :TxSetPane 0:3.3<Left><Left><Left><Left>
nnoremap m34 :TxSetPane 0:3.4<Left><Left><Left><Left>
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
    call search('^```\s*\[.*\]$\|\s*\w*$\|\s*{.*}$', 'bc')
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
    call search('^\\\%[sub\|subsub]section', 'bc')
    let head_pos = getpos('.')
    call search('\%$\|\(\n\ze\\\%[sub\|subsub]section\)', 'c')
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction
function! LatexI()
    call search('^\\\%[sub\|subsub]section', 'bc')
    normal! j
    let head_pos = getpos('.')
    call search('\%$\|\(\n\ze\\\%[sub\|subsub]section\)', 'c')
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

" Rmarkdown code text object - (operator)ik/ak {{{1
call textobj#user#plugin('rmdcode', { '-': {
            \ 'select-a-function': 'RmdA', 'select-a': 'ak',
            \ 'select-i-function': 'RmdI', 'select-i': 'ik',
            \ }, })
function! RmdA()
    call search('^```\s*{.*}$', 'bc')
    normal! 0
    let head_pos = getpos('.')
    normal! j
    call search('^```$', 'c')
    normal! $
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction
function! RmdI()
    call search('^```\s*{.*}$', 'bc')
    normal! j0
    let head_pos = getpos('.')
    call search('^```$', 'c')
    normal! k$
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

" create an operator to send things to tmux {{{1
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
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme gruvbox
