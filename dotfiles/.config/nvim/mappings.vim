" Easily edit the vimrc file with \ev
nmap <leader>ev :e $MYVIMRC<CR>

" F5 toggles colors
nnoremap <F5> :call ToggleColors()<cr>

" Copy current buffer to a new one in a vertical split
nnoremap <leader>wb ggVGy :vnew<CR>Vp

" Create a new buffer in a vertical split
nnoremap <leader>wn :vnew<CR>

" Add current file to git
nnoremap <leader>a :!git add %<CR><CR>

" Format SQL
vnoremap <leader>B :!sqlformat --reindent --keywords upper --identifiers lower -<cr>

" Call GBrowse!
vnoremap <leader>g :GBrowse!<cr>

" ctags jump to tag
nnoremap <leader>d <C-w>v<c-]>

" Copy filename to clipboard
nmap <leader>yf :let @+=expand("%")<CR>

" Open FZF
nmap <leader>t :Files<CR>

" Indent cursor in block after {[( characters
inoremap {<CR> {<CR>}<C-O>O
inoremap [<CR> [<CR>]<C-O>O
inoremap (<CR> (<CR>)<C-O>O

" Fix parentheses in R files
autocmd FileType r inoremap (<CR> (<CR><C-O>I)<C-O>O

" Map select all
nmap <leader>o ggVG

" Map Undotree to \u
nnoremap <leader>u :UndotreeToggle<CR>

" Remap filetab controls
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-t> :tabnew<CR>
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt

" Remap window resize
map <C-w>= <C-W>=

" Remap buffer resize
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Visual shifting
vnoremap < <gv
vnoremap > >gv

" Bubble lines
nmap <C-A-k> [e
nmap <C-A-j> ]e
vmap <C-A-k> [egv
vmap <C-A-j> ]egv

" Replace currently selected text with default register without yanking it
vnoremap p "_dP

" Yank/paste to the OS clipboard with \y and \p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P

" Jump to matching pairs easily with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Alt-x/z deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><A-x> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-z> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Auto-select text that was just pasted in
nnoremap <leader>v V`]

" Horizontally split a window and go to it (requires "set splitbelow")
nnoremap <leader>S <C-w>s

" Vertically split a window and go to it
nnoremap <leader>s <C-w>v

" Easily move between vertical splits
nnoremap H <C-w>h
nnoremap L <C-w>l

" Grep project directory
nnoremap <leader>z :Ack<Space>

" Search word under cursor
nnoremap <leader>q :Ack "<C-r><C-w>" <cr>

" Sorts CSS (content between the braces)
nmap <F7> :g#\({\n\)\@<=#.,/}/sort<CR>

" Map keys for cycling through yank stack
nmap <C-n> <Plug>yankstack_substitute_newer_paste
nmap <C-p> <Plug>yankstack_substitute_older_paste

" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Scroll through command history without needing to use the arrow keys
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


" Return to normal mode within a terminal by pressing Esc
tnoremap <Esc> <C-\><C-n>


function ToggleColors()
    if (g:colors_name == "base16-tomorrow-night")
      set background=light
      let g:airline_theme='papercolor'
      colorscheme base16-mexico-light
    else
      set background=dark
      let g:airline_theme='dark'
      colorscheme base16-tomorrow-night
    endif
endfunction

function SaveHaskellFileBasedOnModuleName(prefix)
  let l:module_line = substitute(substitute(getline(search("^module")), "module ", "", ""), " where$", "", "")
  let l:path = a:prefix . "/" . substitute(l:module_line, "\\.", "/", "g") . ".hs"
  execute "w " . l:path
endfunction

function AskVimExecute(command)
  return split(execute(a:command), "\n")
endfunction

function GoToLastCFileMatch()
  let l:clist_contents = AskVimExecute('clist')
  let l:last_line = l:clist_contents[-1]
  let l:parts = split(l:last_line)
  let l:cc_number = l:parts[0]
  execute 'cc ' . l:cc_number
endfunction
