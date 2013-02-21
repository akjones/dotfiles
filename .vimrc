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
set visualbell

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab 

set list
set list listchars=tab:»·,trail:·

if has('macunix')
  set guifont=Menlo:h13
elseif has('unix')
  set guifont=Ubuntu\ Mono\ 13
endif

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

let g:Powerline_symbols = 'fancy'
