" vimtex maps
" star vs unstarred
nmap mn <Plug>(vimtex-env-toggle-star)
" delimiters toggle
nmap mb <Plug>(vimtex-delim-toggle-modifier)
" info
nmap mh <Plug>(vimtex-info-full)
" toc
nmap mt <Plug>(vimtex-toc-toggle)
" labels
nmap ml <Plug>(vimtex-labels-toggle)
" view
nmap mv <Plug>(vimtex-view)
" reverse search
nmap m/ <Plug>(vimtex-reverse-search)
" compile toggle
nmap mm <Plug>(vimtex-compile-toggle)
" compile selected
xmap mm <Plug>(vimtex-compile-selected)
" stop all vimtex processes
nmap mk <Plug>(vimtex-stop-all)
" show errors
nmap me <Plug>(vimtex-errors)
" show compile output
nmap ma <Plug>(vimtex-compile-output)
" show status
nmap mz <Plug>(vimtex-status-all)
" clean completely
nmap mg <Plug>(vimtex-clean-full)
" list imaps
nmap mi <Plug>(vimtex-imaps-list)
" reloac vimtex
nmap md <Plug>(vimtex-reload)
" toggling main file
nmap mj <Plug>(vimtex-toggle-main)
" count the number of words
nnoremap <buffer> mw :VimtexCountWords<CR>

" specifiying the main file
nnoremap <buffer> mf :normal! o%!TEX root = <CR>A

" working with Skim
let g:vimtex_view_general_viewer
			\ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
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
