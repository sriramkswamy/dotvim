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
set nowb
let g:session_autosave = 'no'
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

" Maps without leader {{{2
" Splits
nnoremap <silent> gw <C-w>v
nnoremap <silent> gW <C-w>s
nnoremap <silent> Z :only<CR>
" Keep me in visual mode
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" Add mark - frees up 'm' which I use for moving stuff
nnoremap + m
" Repeat the last macro instead of ex-mode
nnoremap Q @@
" Remove the highlights
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" Navigate in insert mode
inoremap <silent> <C-f> <right>
inoremap <silent> <C-b> <left>
inoremap <silent> <C-a> <home>
inoremap <silent> <C-e> <end>
" Omnicomplete - don't use this if you need <C-o> (useful...I prefer <Esc>)
inoremap <silent> <C-o> <C-x><C-o>
" Usercomplete - don't use this if you need <C-]> (but...why?)
inoremap <silent> <C-]> <C-x><C-u>
" Dictionary - <C-w> does the same thing
inoremap <silent> <C-d> <C-x><C-k>
" File complete - You can use this by typing <C-/>
inoremap <silent> <C-_> <C-x><C-f>
" Line complete - don't use this if you need <C-l> (I don't quite get <C-l>)
inoremap <silent> <C-l> <C-x><C-l>
" Toggle few options - inspired by unimpaired
nnoremap con :<C-u>setlocal number!<CR>:set number?<CR>
nnoremap coo <C-w><C-w>:<C-u>setlocal number!<CR>:set number?<CR><C-w><C-w>
nnoremap cor :<C-u>setlocal relativenumber!<CR>:set relativenumber?<CR>
nnoremap cow :<C-u>setlocal wrap!<CR>:set wrap?<CR>
nnoremap coc :<C-u>setlocal cursorline!<CR>:set cursorline?<CR>
nnoremap col :<C-u>setlocal list!<CR>:set list?<CR>
nnoremap cos :<C-u>setlocal spell!<CR>:set spell?<CR>
nnoremap coi :<C-u>setlocal ignorecase!<CR>:set ignorecase?<CR>
nnoremap cop :<C-u>setlocal paste!<CR>:set paste?<CR>
nnoremap cob :set background=<C-R>=&background == 'dark' ? 'light' : 'dark'<CR><CR>
nnoremap com :set colorcolumn=<C-R>=&colorcolumn == '80,100' ? '' : '80,100'<CR><CR>
nnoremap cof :set foldmethod=<C-R>=&foldmethod == 'expr' ? 'indent' : 'expr'<CR><CR>
nnoremap coF :FoldToggle<CR>
nnoremap coh :setlocal hlsearch!<CR>:set hlsearch?<CR>
" Clipboard
nnoremap cp "*p
nnoremap cy "*y
vnoremap <C-p> "*p
vnoremap <C-y> "*y
" Readline-ish bindings in Command-line mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
" Change guifont
command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
" Cursor behavior
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Leader and maps {{{2
" Set leader
let mapleader="\<Space>"
" Folding
nnoremap <silent> ]z zj
nnoremap <silent> [z zk
" Kill, save or quit
nnoremap <silent> <Leader>k :bd!<CR>
nnoremap <silent> <Leader>w :update<CR>
nnoremap <silent> <Leader>q :q<CR>
" Open a new tab
nnoremap <Leader>t :tabe<Space>
" Opening apps
nnoremap <Leader>b :!open -a Papers<CR>
" Alternate files
nnoremap <Leader><Tab> :b#<CR>
" Markdown folding
let g:markdown_fold_style = 'nested'

" Plugins {{{2
" Undotree
Plug 'mbbill/undotree' , {'on': 'UndotreeToggle'}
let g:undotree_WindowLayout = 2
nnoremap <silent> U :UndotreeToggle<CR>
" Registers - fancy
Plug 'junegunn/vim-peekaboo'
" Start screen - fancy {{{3
Plug 'mhinz/vim-startify'
let g:startify_list_order = ['dir', 'files', 'sessions', 'bookmarks']
let g:startify_bookmarks  = [ '~/.vim/vimrc', '~/.zshrc', '~/.zshenv' ]
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = ['', '   Vim/Neovim']
let g:startify_custom_footer =
            \ ['', "   Vim is charityware. Please read ':help uganda'.",
            \  "   Neovim is a Vim fork. Please read ':help nvim' if in Neovim."]
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
            \ 'plugged/.*/doc',
            \ ]
let g:startify_list_order = [
            \ ['   Recent files in the current directory:'],
            \ 'dir',
            \ ['   Recent files:'],
            \ 'files',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ]
let g:startify_session_dir = '~/.vimsessions'
nnoremap sq :SClose<CR>
nnoremap sp :SSave<Space>
nnoremap sy :SLoad<Space>

" File/Buffer navigation {{{1
" Set commands {{{2
" Path for the builtin 'find' command
set path=.,**
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
nnoremap [n ?^<\+\s*HEAD$<CR>
nnoremap ]n /^<\+\s*HEAD$<CR>
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
" Filter from quickfix list - someone's vimrc
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

" Filter from location list
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

" Common directory changes
command! CD cd %:p:h
command! LCD lcd %:p:h
nnoremap cd :LCD<CR>
command! WCD :windo cd %:p:h<CR>
command! TCD :tabdo cd %:p:h<CR>

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
nnoremap cu :Root<CR>

" References, Notes and expenses
command! NoteGeneral vsplit ~/Dropbox/notes/notes.md
command! Expense vsplit ~/Dropbox/notes/expenses.dat
nnoremap <Leader>o :FzfFiles ~/Dropbox/<CR>

" Leader maps {{{2
" Quickfix and Location list maps
nnoremap <silent> <Leader>l :lopen<CR>
nnoremap <silent> <Leader>L :lclose<CR>
nnoremap <silent> <Leader>h :copen<CR>
nnoremap <silent> <Leader>H :cclose<CR>

" Plugins {{{2
" FZF {{{3
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix='Fzf'
command! -nargs=1 FzfSpotlight call fzf#run({
            \ 'source': 'mdfind -onlyin ~ <q-args>',
            \ 'sink' : 'e',
            \ 'options': '-m --prompt "Spotlight> "'
            \ })
nnoremap <silent> t :FzfBTags<CR>
nnoremap <silent> T :FzfTags<CR>
nnoremap <silent> g/ :FzfAg<CR>
nnoremap <silent> cot :FzfFiletypes<CR>
nnoremap <silent> <Leader>d :FzfGitFiles<CR>
nnoremap <silent> <Leader>f :FzfFiles %:p:h<CR>
nnoremap <silent> <Leader>F :FzfFiles ~<CR>
nnoremap <silent> <Leader>a :FzfBuffers<CR>
nnoremap <silent> <Leader>c :FzfColors<CR>
nnoremap <silent> <Leader>x :FzfHelptags<CR>
nnoremap <silent> <Leader>, :FzfMaps<CR>
nnoremap <silent> <Leader>` :FzfMarks<CR>
nnoremap <silent> <Leader>A :FzfWindows<CR>
nnoremap <silent> <Leader>r :FzfHistory<CR>
nnoremap <silent> <Leader>/ :FzfHistory/<CR>
nnoremap <Leader>s :FzfSpotlight<Space>
nnoremap <Leader>S :FzfLocate!<Space>
nnoremap <Leader>v :FzfFiles ~/Dropbox/PhD/articles/notes/<CR>
nnoremap <Leader>j :FzfCommands<CR>
nnoremap <Leader>J :FzfHistory:<CR>
vnoremap <Leader>j :FzfCommands<CR>
vnoremap <Leader>J :FzfHistory:<CR>
inoremap <silent> <C-j> <Esc>:FzfSnippets<CR>

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

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l      "cursor line/total lines
set statusline+=\ %P    "percent through file

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
" Macros in visual mode
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

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
command! StripNewLine :call StripNewLine()
nnoremap crn :StripNewLine<CR>

" Plugins {{{2
" For collaborative work
Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" Better '.' command
Plug 'tpope/vim-repeat'
" Elementary splitting
nmap <Plug>ElementarySplit Dop==k$:call repeat#set("\<Plug>ElementarySplit", v:count)<CR>
nmap gz <Plug>ElementarySplit
" Blank the current line
nmap <Plug>BlankCurrentLine cc:call repeat#set("\<Plug>BlankCurrentLine", v:count)<CR>
nmap crb <Plug>BlankCurrentLine
" Auto correction - iabbrev collection
Plug 'sriramkswamy/vim-fat-finger'
" Switch
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
" Org mode like embedded code editing
Plug 'AndrewRadev/inline_edit.vim'
nnoremap <Leader>i :InlineEdit<CR>
vnoremap <Leader>i :InlineEdit<CR>
" Preview the substitution
Plug 'osyo-manga/vim-over'
let g:over_command_line_prompt = ">"
nnoremap <Leader><Leader> :OverCommandLine<CR>
vnoremap <Leader><Leader> :OverCommandLine<CR>
" Semantic split and join
Plug 'AndrewRadev/splitjoin.vim'
" Easy alignment plugin and auto-align {{{3
Plug 'godlygeek/tabular' , {'on': 'Tabularize'}
nnoremap gl :Tabularize /
vnoremap gl :Tabularize /
nnoremap gL :Tabularize<CR>
vnoremap gL :Tabularize<CR>
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
" Delete adjacent lines
nmap <silent> <Plug>DeleteLineUp kdd:call repeat#set("\<Plug>DeleteLineUp", v:count)<CR>
nmap [x <Plug>DeleteLineUp
nmap <silent> <Plug>DeleteLineDown jddk:call repeat#set("\<Plug>DeleteLineDown", v:count)<CR>
nmap ]x <Plug>DeleteLineDown

" Motions {{{2
Plug 'justinmk/vim-sneak'
nmap w <Plug>Sneak_s
xmap w <Plug>Sneak_s
omap w <Plug>Sneak_s
nmap W <Plug>Sneak_S
xmap W <Plug>Sneak_S
omap W <Plug>Sneak_S

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
" Edit a macro
nnoremap cq :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

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
" Operate on indents - (operator)ii/ai/aI
Plug 'kana/vim-textobj-indent'

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
" Git Wrapper
Plug 'tpope/vim-fugitive' | Plug 'idanarye/vim-merginal' , {'branch': 'develop'}
autocmd BufReadPost fugitive://* set bufhidden=delete " Delete all fugitive buffers except this
" Blame people!
nnoremap <silent> gb :Gblame<CR>
" Toggle merginal
nnoremap <silent> gm :Merginal<CR>

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

" Language helpers {{{1
" Syntax and nicities for many languages {{{2
Plug 'sheerun/vim-polyglot'
" LaTeX already included in polyglot
let g:LatexBox_Folding = 1
" Vim script {{{2
Plug 'tpope/vim-scriptease'
" C/C++ {{{2
" Autocompletion
Plug 'justmao945/vim-clang' , {'for': ['cpp', 'c']}
let g:clang_compilation_database = './build'
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_diagsopt = ''   " disable diagnostics
" Indexer (for cmake projects)
Plug 'lyuts/vim-rtags' , {'for': ['cpp', 'c']}
autocmd filetype c,cpp set completefunc=RtagsCompleteFunc
let g:rtagsUseDefaultMappings = 0
let g:rtagsUseLocationList = 0
let g:rtagsMinCharsForCommandCompletion = 2
command! CppJumpTo call rtags#JumpTo()
command! CppJumpToParent call rtags#JumpToParent()
command! CppReference call rtags#FindRefsOfWordUnderCursor()
command! CppSymbol call rtags#FindSymbolsOfWordUnderCursor()
command! CppVirtuals call rtags#FindVirtuals()
command! CppReindex call rtags#ReindexFile()
command! CppRename call rtags#RenameSymbolUnderCursor()
command! CppProjects call rtags#ProjectList()
augroup filetype_cpp
    autocmd!
    autocmd filetype c,cpp nnoremap <buffer> K :call rtags#JumpTo()<CR>
augroup end
" Python {{{2
" Autocompletion and some jumping
Plug 'davidhalter/jedi-vim' , {'for': 'python'}
autocmd filetype python set omnifunc=jedi#completions
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
" Much better Python text objects and goodies
Plug 'tweekmonster/braceless.vim'
command! BracelessOn BracelessEnable +indent +fold +highlight
command! BracelessOff BracelessEnable -indent -fold -highlight
autocmd FileType python BracelessOn
let g:braceless_generate_scripts = 1
let g:braceless_enable_easymotion = 0
let g:braceless_block_key = 'b'
let g:braceless_easymotion_segment_key = ''
augroup filetype_python
    autocmd!
    autocmd filetype python nnoremap <buffer> K :call jedi#goto()<CR>
augroup end
" JavaSctipt {{{2
" Tern based autocompletion and navigation
Plug 'ternjs/tern_for_vim' , {'do': 'npm install'}
augroup filetype_javascript
    autocmd!
    autocmd FileType js,javascript nnoremap <buffer> K :TernDef<CR>
augroup end
" HTML/CSS {{{2
Plug 'rstacruz/sparkup'
let g:sparkupNextMapping = '<C-Y>'
" Eclim - Eclipse plus Vim {{{2
let g:EclimShowQuickfixSigns = 0
let g:EclimShowLoclistSigns = 0
let g:EclimShowCurrentError = 1
let g:EclimShowCurrentErrorBalloon = 0

" Syntax checking {{{1
Plug 'benekastah/neomake' , {'on' : 'Neomake'}
autocmd! BufWritePost * Neomake

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
" Populate location list with previous search pattern; ugly hack
nnoremap <C-n> :lvim // %<CR>

" Maps without leader {{{2
" Auto-center
nnoremap <silent> n nzz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
" Make '*' act a little better
nnoremap <silent> * *``
nnoremap <silent> # #``

" Search for word under visual selection
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

" Vim grepper plugin {{{2
Plug 'mhinz/vim-grepper'
" Mimic :grep and make ag the default tool.
let g:grepper = {
            \ 'tools': [ 'pt', 'ag', 'ack', 'git', 'grep'],
            \ 'open':  0,
            \ 'jump':  0,
            \ 'next_tool': ']g'
            \ }
nnoremap gss :Grepper -tool pt -noswitch<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" REPL and Tmux {{{1
" let commands and maps without leader {{{2
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

" Neovim terminal - Go to normal mode
nnoremap <silent> <Leader>u :vsp <bar> term<CR>
nnoremap <silent> <Leader>U :sp <bar> term<CR>
tnoremap <C-g> <C-\><C-n>
nnoremap <silent> <Leader>n :terminal ranger<CR>
nnoremap <silent> <Leader>e :terminal tig<CR>

" Zoom when in Tmux(>v1.8)
if exists('$TMUX')
    nnoremap <silent> <Leader>z :call system("tmux resize-pane -Z")<CR>
    nmap <silent> <Plug>SwapTmuxUp :call system("tmux swap-pane -U")<CR>
                \ :call repeat#set("\<Plug>SwapTmuxUp", v:count)<CR>
    nmap ]R <Plug>SwapTmuxUp
    nmap <silent> <Plug>SwapTmuxDown :call system("tmux swap-pane -D")<CR>
                \ :call repeat#set("\<Plug>SwapTmuxDown", v:count)<CR>
    nmap [R <Plug>SwapTmuxDown
endif
" Navigate between Tmux and Vim - I wish there was another way...
Plug 'christoomey/vim-tmux-navigator'
nmap <silent> <BS> :TmuxNavigateLeft<CR>

" Plugins {{{2
" Common *nix commands
Plug 'tpope/vim-eunuch'
" Dispatch stuff {{{3
Plug 'tpope/vim-dispatch'
nnoremap <Leader>m :Dispatch!<Space>
nnoremap <silent> <Leader>p :Copen<CR>
nnoremap <silent> <Leader>P :cclose<CR>
" Commandline utilities
nnoremap gp :Dispatch! gist % -cd ""<Left>
nnoremap gP :Dispatch! gist -Pcd ""<Left>
" Dispatch based commands
command! GitPush Dispatch! git push
command! GitPull Dispatch! git pull
command! GppMake Dispatch! make
command! GppBuild Dispatch! make -C build
command! GppDocs Dispatch! make -C build doc
command! GppLatex Dispatch! make -C docs/latex
command! GppSimple Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -g -o %:p:r.out %
command! GppSingle Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GppOpenmp Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GppMpi Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpic++ -std=c++11 -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GppHybrid Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpic++ -std=c++11 -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GppArmadillo Dispatch! cd %:p:h <bar> g++ -std=c++11 -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g -o %:p:r.out %
command! GccMake Dispatch! make
command! GccBuild Dispatch! make -C build
command! GccLatex Dispatch! make -C docs/latex
command! GccDocs Dispatch! make -C build doc
command! GccSimple Dispatch! cd %:p:h <bar> gcc -std=c++11 -Wall -g -o %:p:r.out %
command! GccSingle Dispatch! cd %:p:h <bar> gcc! -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GccOpenmp Dispatch! cd %:p:h <bar> gcc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GccMpi Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -O2 -g -o %:p:r.out %
command! GccHybrid Dispatch! cd %:p:h <bar> /usr/local/openmpi/bin/mpicc -Wall -lgsl -lcblas -llapack -fopenmp -O2 -g -o %:p:r.out %
command! GccArmadillo Dispatch! cd %:p:h <bar> gcc -Wall -lgsl -lcblas -llapack -larmadillo -O2 -g -o %:p:r.out %
command! TexCount Dispatch! texcount %
command! ConvertToPDF Dispatch! pandoc % -V geometry:margin=2cm -o %:r.pdf
command! ConvertToOrg Dispatch! pandoc % -o %:r.org
command! ConvertToRst Dispatch! pandoc % -o %:r.rst
command! ConvertToLatex Dispatch! pandoc % -o %:r.tex
command! ConvertToEpub3 Dispatch! pandoc % -o %:r.epub
command! ConvertToHTML5 Dispatch! pandoc % -o %:r.html
command! ConvertToOPML Dispatch! multimarkdown -t opml % > %:r.opml

" Tmux integration {{{3
Plug 'jebaum/vim-tmuxify'
let g:tmuxify_map_prefix = 'm'
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

" Markdown code text object - (operator)iM/aM {{{1
call textobj#user#plugin('markcode', { '-': {
            \ 'select-a-function': 'MarkcodeA', 'select-a': 'aM',
            \ 'select-i-function': 'MarkcodeI', 'select-i': 'iM',
            \ }, })
function! MarkcodeA()
    call search('^```\w*$', 'bc')
    normal! 0
    let head_pos = getpos('.')
    normal! j
    call search('^```$', 'c')
    normal! $
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction
function! MarkcodeI()
    call search('^```\w*$', 'bc')
    normal! j0
    let head_pos = getpos('.')
    call search('^```$', 'c')
    normal! k$
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

" Setup plugins, indents and syntax {{{1
filetype plugin indent on
syntax on

" Set colorscheme {{{1
set background=dark
colorscheme PaperColor
