""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Stuff about 
"setlocal makeprg=vlib\ work\;\ MODELSIM=$HOME/modelsim.ini\ vcom\ %
"setlocal errorformat=**\ Error:\ %f(%l):\ %m 
"
"
" Manipulate paths to load plugins
execute pathogen#infect()

set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Auto-reload file when it is changed
"set autoread

" Show line numbers
set number

" Always display location
set ruler

" Configure backspace and moving backwards
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Try to be 'smart' with case when searching
set smartcase

" Highlight searches
set hlsearch

" Search incrementally, like web browsers do
set incsearch

" Turn on 'magic' for regular expressions
set magic

" Show matching brackets
set showmatch

" No annoying sounds on error
set noerrorbells
set novisualbell
set t_vb=
set tm=500


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable


set background=dark

if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256 
  set guitablabel=%M\ %t
endif

" Set to standard encoding and en_US as default language
set encoding=utf8

" Unix is standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab, and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab

set smarttab

set shiftwidth=2
set tabstop=2


set ai "Autoindent
set si "Smartindent
set wrap "Wrap lines

set formatoptions+=w
set tw=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>



colorscheme inkpot

" Run Pathogen
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" Toggle NERDTree with <leader>n
map <leader>n :NERDTreeToggle<CR>
" Toggle Taglist with <leader>t
map <leader>t  :TlistToggle<CR>

" navigate splits with <leader>[hjkl]
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin-specific stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Taglist custom VHDL settings line
let tlist_vhdl_settings = 'vhdl;d:package;b:packagebody;a:architecture;e:entity;p:process;f:function;P:procedure;t:type;c:constant;s:signal;i:instance'


" Start NERDTree if no file was specified
autocmd vimenter * if !argc() | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


