" .vimrc

" Setup {{{
set nocp

" Respect vim modelines
set modeline

" Set the terminal font encoding
set encoding=utf-8
set termencoding=utf-8

" Store swap away from the working directory
set directory=~/.vim/swap

" Skip backup on files in /tmp/
set backupskip=/tmp/*,/private/tmp/*
" Actually, skip backup entirely. It's annoying.
set nobackup

" }}}
" Pathogen {{{
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" }}}
" {{{ Colors
colorscheme hemisu

"colorscheme molokai

" Background, colorscheme, etc
set background=dark

" }}}
" Utility {{{
" Manage multiple buffers
set hidden

" Use the file's name in the title
set title

" Turn on syntax highlighting
syntax on

" Show line numbers
set number

" Highlight the line the cursor is on
set cursorline

" Command history
set history=1000

" Let backspace do what it's supposed to. (magic?)
set bs=2

" Filetype detection
filetype on

" Load filetype plugins
filetype plugin on

" Load filetype indents
filetype indent on

" Auto indent new lines
set autoindent

" Show matching braces
set showmatch

" Enable extended % matching
runtime macros/matchit.vim

" Bash-like tab completion for commands
set wildmenu
set wildchar=<Tab>
set wildmode=list:longest
set wildignore+=*.pyc,.hg,.git,.svn

" Spacing and tabbing
" Use shiftwidth and tabstop smartly
set smarttab

" Spaces
set expandtab

" Tab width
set tabstop=4
set softtabstop=4
set shiftwidth=4

set textwidth=100

" Don't wrap text
set nowrap

" Highlight the first column after the text width
set colorcolumn=+1

" Reuse open buffers and tabs
set switchbuf=useopen,usetab

" }}}
" Undo {{{
" -- see http://amix.dk/blog/post/19548
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 " max changes that can be undone
set undoreload=10000 " max lines to save for undo on buffer reload 

" }}}
" {{{ Navigation
" Tab navigation
nmap <F4> :tabnew<CR>
nmap <F5> :tabp<CR>
nmap <F6> :tabn<CR>

" Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" }}}
" NERDTree {{{
map <F7> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2

" }}}
" Powerline {{{
let g:Powerline_symbols = 'unicode'

" }}}
" Scrolling {{{
" Scrolling context
set scrolloff=3

" Scrolling speed
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" }}}
" Key remaps {{{
" Map leader to ,
let mapleader = ","

" Completion
inoremap <Nul> <C-x><C-p>

" }}}
" Filetype-specific formatting and commands {{{
" Filetype-specific formatting
" From the Vim docs:
" t   Auto-wrap text using textwidth
"
" c   Auto-wrap comments using textwidth, inserting the current comment
"     leader automatically.
"
" r   Automatically insert the current comment leader after hitting
"     <Enter> in Insert mode.
"
" o   Automatically insert the current comment leader after hitting 'o' or
"     'O' in Normal mode.
"
" n   When formatting text, recognize numbered lists.  This actually uses
"     the 'formatlistpat' option, thus any kind of list can be used.  The
"     indent of the text after the number is used for the next line.  The
"     default is to find a number, optionally followed by '.', ':', ')',
"     ']' or '}'.  Note that 'autoindent' must be set too.  Doesn't work
"     well together with "2".
"     Example:
"         1. the first item
"            wraps
"         2. the second item
set formatoptions+=t,c,r,o,n

au FileType c,cpp,h set cindent formatoptions+=ro 
au FileType html,xhtml,xml set tw=0
au FileType make set noexpandtab shiftwidth=8
au FileType python set et sw=4 sts=4 ts=4 ai

" }}}
" Autocommands {{{
" Make coffeescript files on write
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" Automatically go to the last edited line on open
au BufReadPost * normal `"

" }}}
" Status line {{{
set laststatus=2
set statusline=%-3.3n\ %f%(\ %r%)%(\ %#WarningMsg#%m%0*%)%=(%l/%L,\ %c)\ %P\ [%{&encoding}:%{&fileformat}]%(\ %w%)\ %y
set shortmess+=aI

" }}}
" Folding {{{
if has("folding")
    set foldenable 
    set foldmethod=marker
    set foldopen=hor,mark,search,tag,undo
endif

hi Folded term=standout ctermfg=3 ctermbg=none

" }}}
" Search {{{
set hlsearch
set ignorecase
set smartcase
set incsearch

" }}}

" vim: fdm=marker
