" Use new regex engine to avoid slow redraw
set re=1

" Use true colors
set termguicolors

" Enable cursor blinking
set guicursor=n-v-c-sm:block-blinkon1,i-ci-ve:ver25-blinkon1,r-cr-o:hor20-blinkon1

" Ignore case when searching
set ignorecase
" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Show line numbers relative to cursor
set relativenumber

" Save undo history
set undofile
set undolevels=1000
set undoreload=10000

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Disable swap files and backups
set nobackup
set nowritebackup
set noswapfile

" Auto-update buffer if external command modifies it
set autoread

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Underline the current line, for quick orientation
set cursorline

" Always show what mode we're currently editing in
set showmode

" Highlight 80th column
set colorcolumn=80

" Jump 5 lines when running out of screen real estate
set scrolljump=5

" Keep 3 lines off the edges of the screen when scrolling
set scrolloff=3

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Ignore files
set wildignore+=.git
set wildignore+=/**/node_modules/**,/**/vendor

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"80 - save 80 lines for each register
" :200  - remember 200 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"80,:200,%,n~/.nviminfo

" Search/replace "globally" (on a line) by default
set gdefault

" Do not highlight search results
set nohlsearch

" Convert tabs to 4 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Word wrap
set nowrap
set textwidth=0

" Disable folding
set nofoldenable

" Disable scroll binding
set noscrollbind

" Split horizontal windows below current window
set splitbelow

" Split vertical windows to the right of the current window
set splitright

" Sane clipboard
set clipboard=unnamedplus
