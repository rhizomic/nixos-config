" Don't display annoying popup every time a file changes
autocmd FileChangedShell * echohl WarningMsg | echo "File changed shell." | echohl None

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Enable folding without the use of markers
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Fix comment indentation issues
au FileType coffee set nosmartindent

" QuickFix-window bindings
augroup QuickFix
  au FileType qf map <buffer> q :q<CR>
augroup END

" Toggle RainbowParentheses automatically
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Fix middle-of-word autocompletion
augroup completion
  autocmd!
  autocmd CompleteDone * call PostCompletion()
augroup END

augroup matchup_matchparen_highlight
  autocmd!
  autocmd VimEnter * hi MatchWord cterm=underline gui=underline
  autocmd VimEnter * hi MatchWordCur cterm=underline gui=underline
augroup END

" Fix middle-of-word autocompletion
function! PostCompletion()
    if !empty(v:completed_item)
      "check if text after current cursor position is part of the match
      let crt_word = expand('<cWORD>')
      let compl_word = v:completed_item['word']
      let lcw = len(compl_word)
      let leftover = strpart(crt_word, lcw)
      let lfl = len(leftover)
      if lfl > 0
        let endcompl = strpart(compl_word, lcw - lfl)
        if leftover ==# endcompl
          let cpos = getcurpos()
          normal dW
          call setpos('.', cpos)
        endif
      endif
    endif
endfunction
