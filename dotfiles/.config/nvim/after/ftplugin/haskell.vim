" Get ghcid errors in quickfix window
nmap <buffer> <leader>g :cgetfile ghcid.txt<CR>:call GoToLastCFileMatch()<CR>

" Go to the "next" (technically previous) entry in the quickfix window
nmap <buffer> <leader>n :vsplit<CR>:cp<CR>

" Run brittany on Haskell files
nnoremap <leader>lf :!brittany --write-mode=inplace %:p <CR><CR>
" Run fourmolu on Haskell files
" nnoremap <leader>lf :!run-format inplace %:p <CR><CR><CR>

" Save a Haskell file based on its module name
nnoremap <leader>ws :call SaveHaskellFileBasedOnModuleName("src")<CR>
nnoremap <leader>wt :call SaveHaskellFileBasedOnModuleName("test")<CR>

" Set the error format so as to properly handle GHCID errors in the quickfix
" window
" let &errorformat='%f:%l:%c:%m,%f:%l:%c-%n:%m,%f:(%l\,%c)-%m'
setlocal efm=%f:(%l\,%c)-%m
setlocal efm+=%f:%l:%c:%m
setlocal efm+=%f:%l:%c-%n:%m
setlocal efm+=%f:(%l\\,%c)-(%e\\,%k):%m
