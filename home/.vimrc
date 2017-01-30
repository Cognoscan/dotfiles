"Define which computer we're on
let computer="work"
"let computer="home"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $PYTHONPATH="/usr/lib/python3.4/site-packages"

let g:powerline_pycmd="py3"

" Stuff about 
"setlocal makeprg=vlib\ work\;\ MODELSIM=$HOME/modelsim.ini\ vcom\ %
"setlocal errorformat=**\ Error:\ %f(%l):\ %m 

" Set up Regex List
" Use <C-r>=[REGEX NAME] to insert a regex
" Use <C-r>=/ to insert the last search term
source ~/.regexlist.vim

" Global clipboard
set clipboard=unnamedplus

" Turn off backup files, which clutter things up in Windows
set nobackup
set nowritebackup
" Manipulate paths to load plugins
call pathogen#infect()
Helptags


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

" ignore case when completing file names
set wildignorecase

" No annoying sounds on error
set noerrorbells
set novisualbell
set t_vb=
set tm=500


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
colorscheme default

" Enable syntax highlighting
syntax enable

hi Search cterm=NONE ctermfg=0 ctermbg=11
hi Cursor cterm=NONE ctermfg=0 ctermbg=7
hi CursorIM cterm=NONE ctermfg=0 ctermbg=7
hi Visual ctermbg=8

"colorscheme inkpot

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
" Special for Verilog: Work coding standard is to use 4 spaces / tab
au BufEnter *.v  setlocal tabstop=4
au BufEnter *.v  setlocal shiftwidth=4
au BufEnter *.sv  setlocal tabstop=4
au BufEnter *.sv  setlocal shiftwidth=4

if computer == "work"
  " Special for C++: Work coding standard is to use 3 spaces / tab
  au BufEnter *.h  setlocal tabstop=3
  au BufEnter *.h  setlocal shiftwidth=3
  au BufEnter *.cpp  setlocal tabstop=3
  au BufEnter *.cpp  setlocal shiftwidth=3
endif

set ai "Autoindent
set si "Smartindent
set nowrap "Do not wrap lines

set listchars+=precedes:<,extends:>

set formatoptions+=w
set tw=80
" Special for Verilog: Work coding standard doesn't really fit to 80 
" characters per line. Let's try 110, and I'll try to stick to 80 at home.
au BufEnter *.v  setlocal tw=80
au BufEnter *.sv  setlocal tw=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
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

" Buffer navigation
map <leader>u :bnext<CR> 
map <leader>i :bprevious<CR> 
map <leader>bn :enew<CR>
map <leader>bc :bp <BAR> bd #<CR>
map <leader>bl :ls<CR>

nnoremap ; :
vnoremap ; :

"nmap <space> i<space><Esc>l
"nmap <CR> o<Esc>

nmap sh <Plug>(easymotion-linebackward)
nmap sj <Plug>(easymotion-j)
nmap sk <Plug>(easymotion-k)
nmap sl <Plug>(easymotion-lineforward)

nmap ss <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" Useful Visual mode shortcuts for Verilog
au BufEnter *.v vmap <leader>d :s#^\(\s\+\)\(input\\|output\\|inout\)\s\+\(wire\\|reg\)*\s*#\1.#g<CR>
au BufEnter *.v vmap <leader>f :s#\(\[\S\+\]\) \+\(\w\+,\? *\)\(///< \)*#\2 ///< \1 #g<CR>
au BufEnter *.v vmap <leader>c :Tabularize ////<<CR>
au BufEnter *.v vmap <leader>v :Tabularize /\/\/<CR>
au BufEnter *.v vmap <leader>e :Tabularize /<=<CR>
au BufEnter *.v vmap <leader>r :Tabularize /=<CR>
" Repeat for System Verilog
au BufEnter *.sv vmap <leader>d :s#^\(\s\+\)\(input\\|output\\|inout\)\s\+\(wire\\|reg\)*\s*#\1.#g<CR>
au BufEnter *.sv vmap <leader>f :s#\(\[\S\+\]\) \+\(\w\+,\? *\)\(///< \)*#\2 ///< \1 #g<CR>
au BufEnter *.sv vmap <leader>c :Tabularize ////<<CR>
au BufEnter *.sv vmap <leader>v :Tabularize /\/\/<CR>
au BufEnter *.sv vmap <leader>e :Tabularize /<=<CR>
au BufEnter *.sv vmap <leader>r :Tabularize /=<CR>

" Useful Visual mode shortcuts for VHDL
au BufEnter *.vhd vmap <leader>r :Tabularize /=><CR>
au BufEnter *.vhd vmap <leader>e :Tabularize /<=<CR>
au BufEnter *.vhd vmap <leader>c :Tabularize /--!<CR>
au BufEnter *.vhd vmap <leader>v :Tabularize /--<CR>
au BufEnter *.vhd vmap <leader>d :Tabularize /:<CR>

" update with make
"map <leader>u :w <bar> !make <CR>

" compile with multimarkdown
"map <leader>m :w <bar> !multimarkdown -b %:t<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Special Macros
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Macro for reformatting Verilog instantiated modules that were on a single line
let @q = 'V:s/), /),\r    /g$hi%a=}}'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Special functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin-specific stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Markdown Configuration
let g:vim_markdown_folding_disabled=1

"Syntastic Settings
let g:syntastic_verilog_checkers = []

" Indent-Guides Settings
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=none

" Easymotion Settings
let g:EasyMotion_smartcase = 1

" Supertab Settings
let g:SupertabNoCompleteAfter = ['^', '\s', '\W']

let g:neocomplete#enable_at_startup = 1 

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Taglist custom VHDL settings line
let tlist_vhdl_settings = 'vhdl;d:package;b:packagebody;a:architecture;e:entity;p:process;f:function;P:procedure;t:type;c:constant;s:signal;i:instance'

" Start NERDTree if no file was specified
autocmd vimenter * if !argc() | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

