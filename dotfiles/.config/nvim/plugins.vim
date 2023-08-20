" Auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Github repos here:

Plug '5outh/yesod-routes.vim'
Plug 'b3nj5m1n/kommentary'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'DataWraith/auto_mkdir'
Plug 'ervandew/supertab'
" Typescript syntax
Plug 'HerringtonDarkholme/yats.vim'
" Agda
" Plug 'isovector/cornelis'
Plug 'itspriddle/vim-stripper'
Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Required for cornelis
Plug 'kana/vim-textobj-user'
Plug 'kien/rainbow_parentheses.vim'
" Typescript syntax/indentation/quickfix errors
Plug 'leafgarland/typescript-vim'
Plug 'luisjure/csound-vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovimhaskell/haskell-vim'
" Required for cornelis
Plug 'neovimhaskell/nvim-hs.vim'

" Required for nvim-telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Javascript syntax/indentation
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Raimondi/delimitMate'
" Slim template syntax highlighting
Plug 'slim-template/vim-slim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'triglav/vim-visual-increment'
Plug 'vim-latex/vim-latex'
" More targets to operate on (e.g., cin) to change the text in the next set of
" parens)
Plug 'wellle/targets.vim'

" Initialize plugin system
call plug#end()
