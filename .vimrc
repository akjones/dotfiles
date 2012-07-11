runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax on
filetype plugin indent on
set background=dark

colorscheme molokai
set ls=2
set hlsearch 
set incsearch
set ruler
set ignorecase
set number
set guifont=Menlo:h13
set visualbell

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab 

set list
set listchars=tab:\|_,trail:·


if has("gui_running")
    set guioptions=egmrt
endif

command! Tidy :exec ":%! tidy -xml -i -q"
