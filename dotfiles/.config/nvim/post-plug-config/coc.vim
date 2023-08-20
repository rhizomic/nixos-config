" Bindings
map <Leader>ld <Plug>(coc-definition)
map <Leader>lt <Plug>(coc-type-definition)
map <Leader>li <Plug>(coc-implementation)
map <Leader>ln <Plug>(coc-rename)
"map <Leader>lf <Plug>(coc-format)
map <Leader>lr <Plug>(coc-references)
map <Leader>la <Plug>(coc-codeaction)
map <Leader>lc <Plug>(coc-fix-current)
map <Leader>lg <Plug>(coc-diagnostic-next)
map <Leader>lo :call CocActionAsync('runCommand', 'editor.action.organizeImport')<cr>

" Colors
hi CocFloating ctermfg=15 ctermbg=0
hi CocErrorFloat ctermfg=12 ctermbg=0
hi CocWarningFloat ctermfg=14 ctermbg=0
hi CocInfoFloat ctermfg=15 ctermbg=0
hi CocHintFloat ctermfg=11 ctermbg=0

hi! CocErrorSign guifg=Red
hi! CocWarningSign guifg=Yellow
hi! CocInfoSign guifg=White
hi! CocHintSign guifg=White

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
