set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-abolish'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-haml'
Plugin 'rking/ag.vim'
Plugin 'fatih/vim-go'

syntax on
filetype plugin indent on
set background=dark
set t_Co=256

colorscheme molokai
set ls=2
set hlsearch
set incsearch
set ruler
set ignorecase
set number
set visualbell

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set list
set list listchars=tab:»·,trail:·

if has('macunix')
  set guifont=Menlo:h13
elseif has('unix')
  set guifont=Ubuntu\ Mono\ 13
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/public/*

autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
:endfunction

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

" Attempts to auto fix formatting across whole file
function FixFormatting()
    ggVG=
    ''
:endfunction

map <F1> mkHmlggVG=`lzt`k
map! <F1> mkHmlggVG=`lzt`k

map <F3> :nohl<CR>
map! <F3> :nohl<CR>

if has("gui_running")
    set guioptions=egmrt
endif

command! Tidy :exec ":%! tidy -xml -i -q"

nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

nmap \e :NERDTreeToggle<CR>
