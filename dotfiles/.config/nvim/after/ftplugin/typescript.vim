" Set the error format so as to properly handle "TSCID" errors in the quickfix
" window
" let &errorformat='%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m'
setlocal efm=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m

" Use older regex engine with Typescript to avoid slow redraw
setlocal re=0

" Get "tscid" errors in quickfix window
nmap <buffer> <leader>g :cfile /tmp/tscid<CR>
