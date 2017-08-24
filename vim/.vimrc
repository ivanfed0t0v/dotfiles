"# General
set nocompatible                " Disable vi-compatible mode
set hidden

syntax enable                   " Enable syntax highlighting

set number	                " Show line numbers
set relativenumber              " Show relative line numbers
"set showbreak=+++               " Wrap-broken line prefix
"set textwidth=100               " Line wrap (number of cols)
set showmatch	                " Highlight matching brace
"set visualbell	                " Use visual bell (no beeping)
 
set hlsearch	                " Highlight all search results
set smartcase	                " Enable smart-case search
set ignorecase	                " Always case-insensitive
set incsearch	                " Searches for strings incrementally
 
" Global settings
set autoindent	                " Auto-indent new lines
set expandtab	                " Use spaces instead of tabs
set shiftwidth=4                " Number of auto-indent spaces
set smartindent                 " Enable smart-indent
set smarttab	                " Enable smart-tabs
set softtabstop=4               " Number of spaces per Tab

" Enable folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
 
"# Advanced
set ruler	                " Show row and column ruler information
 
set undolevels=1000	        " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

call plug#end()
