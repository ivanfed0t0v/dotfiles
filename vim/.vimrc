"# General
set nocompatible                " Disable vi-compatible mode
set hidden

set encoding=utf-8

augroup resCur                  " Remember last position in file
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

syntax enable                   " Enable syntax highlighting

set number	                " Show line numbers
set relativenumber              " Show relative line numbers
"set showbreak=+++               " Wrap-broken line prefix
set showmatch	                " Highlight matching brace
 
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
set splitbelow
set splitright

" Enable folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
 
"# Advanced
set ruler	                " Show row and column ruler information
 
set undolevels=1000	        " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set noshowmode                  " Hide -- INSERT --

set laststatus=2                " Always show statusline
set ttimeoutlen=0               " Quickly exit from insert in airline

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'gabrielelana/vim-markdown'

call plug#end()

let g:markdown_enable_spell_checking = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ''
