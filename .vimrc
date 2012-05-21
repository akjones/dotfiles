runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax on
filetype plugin indent on
set background=dark

colorscheme ir_black
set ls=2
set hlsearch 
set incsearch
set ruler
set ignorecase
set number

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab 


if has("gui_running")
    set guioptions=egmrt
endif
