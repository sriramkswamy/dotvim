" some settings for tex files
setlocal wrap
setlocal spell

" vimtex maps
" delimiters toggle
nmap <buffer> mb <Plug>(vimtex-delim-toggle-modifier)
" info
nnoremap <buffer> mi :VimtexInfo<CR>
" toc
nnoremap <buffer> mt :VimtexTocToggle<CR>
" toggle main
nnoremap <buffer> ml :VimtexToggleMain<CR>
" view
nnoremap <buffer> mj :VimtexView<CR>
" compile toggle
nnoremap <buffer> mm :VimtexCompile<CR>
" compile selected
vnoremap <buffer> mm :VimtexCompileSelected<CR>
" stop all vimtex processes
nnoremap <buffer> mk :VimtexStopAll<CR>
" show errors
nnoremap <buffer> me :VimtexErrors<CR>
" show compile output
nnoremap <buffer> ma :VimtexCompileOutput<CR>
" show status
nnoremap <buffer> mz :VimtexStatus<CR>
" clean completely
nnoremap <buffer> mg :VimtexClean!<CR>
" reload vimtex
nnoremap <buffer> md :VimtexReload<CR>
" count the number of words
nnoremap <buffer> mw :VimtexCountWords<CR>

" matchit like functionality
nmap <buffer> % <Plug>(vimtex-%)
" navigation functionality
nmap <buffer> ]] <Plug>(vimtex-]])
" navigation functionality
nmap <buffer> ][ <Plug>(vimtex-][)
" navigation functionality
nmap <buffer> [[ <Plug>(vimtex-[[)
" navigation functionality
nmap <buffer> [] <Plug>(vimtex-[])

" specifiying the main file
nnoremap <buffer> mf :normal! O%!TEX root = <CR>A

" working with Skim
if has('macunix')
    let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
elseif has('unix')
    let g:vimtex_view_general_viewer
                \ = 'zathura'
endif
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
	if !a:status | return | endif

	let l:out = b:vimtex.out()
	let l:tex = expand('%:p')
	let l:cmd = [g:vimtex_view_general_viewer, '-r']
	if !empty(system('pgrep Skim'))
		call extend(l:cmd, ['-g'])
	endif
	if has('nvim')
		call jobstart(l:cmd + [line('.'), l:out, l:tex])
	elseif has('job')
		call job_start(l:cmd + [line('.'), l:out, l:tex])
	else
		call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
	endif
endfunction
