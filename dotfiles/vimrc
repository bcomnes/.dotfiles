set expandtab           " enter spaces when tab is pressed
" Nah, I can manage this myself
"set textwidth=120       " break lines when line length increases
"au FileType python set textwidth=79
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set nosmartindent
set ruler
set background=dark
let &t_Co=256
try
    colorscheme wombat256mod
catch
    " just go with the default
endtry

au BufNewFile,BufRead *.module set filetype=php


set nowrap
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching

set splitbelow
set splitright
" Use <number>G
set nonumber

" show filename in status bar
set modeline
set ls=2

" why isn't this the default? 
noremap j gj
noremap k gk

" preserve folding
set viewoptions-=options
augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END

" Emacs bindings in command line mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
"set scrolloff=8

" jump to buffers
noremap <f1> :bprev!<CR>
noremap <f2> :bnext!<CR>

" nice esc
imap <c-c> <c-[>
" more Visual Studio and eclipse like word completion
inoremap <c-@> <c-n>

set history=1000
" Don't forget to make the directories yourself
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"set undodir=~/.vim/undo
"set undofile
"set undolevels=1000 "maximum number of changes that can be undone
"set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Open man page in new window
:runtime! ftplugin/man.vim
nmap K \K

