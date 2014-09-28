" Changes from http://stevelosh.com/blog/2010/09/coming-home-to-vim/?
" -------------------------------------------------------------------
" Disable vi compatability
set nocompatible
" Disables mode lines, a silly insecure feature
set modelines=0
" Some potentially usefull commands, turned off till I know wtf they do
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab
set encoding=utf-8
"set scrolloff=3
set autoindent
set showmode
set showcmd
"set hidden
"set wildmenu
"set wildmode=list:longest
"set visualbell
"set cursorline
"set ttyfast
"set ruler
"set backspace=indent,eol,start
"set laststatus=2
"set relativenumber
"set undofile

" Changes below are all by boot
" ------------------------------

" Work-around incomplete terminfo databases
" Particulalry useful when under `screen`, which may or may not be attached to
" a physical terminal capable of 256color mode.
" http://www.robmeerman.co.uk/unix/256colours
if match($TERMCAP, 'Co#256:') == 0 || match($TERMCAP, ':Co#256:') > 0
    set t_Co=256
endif

" Enable syntax hilightiting
syntax enable
"set number
