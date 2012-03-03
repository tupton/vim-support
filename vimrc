" .vimrc

" Setup {{{
set nocompatible

" Respect vim modelines
set modeline

" Set the terminal font encoding
set encoding=utf-8
set termencoding=utf-8

" Store swap away from the working directory
set directory=~/.vim/swap

" Skip backup entirely. It's annoying.
set nobackup
if has("writebackup")
    set nowritebackup
endif

" Manage multiple buffers
set hidden

" Shorten a lot of notifications and suppress the splash screen
set shortmess+=aI

" Turn on syntax highlighting
syntax on

" }}}
" Pathogen {{{
runtime! bundle/pathogen/autoload/pathogen.vim
silent! call pathogen#infect()
silent! call pathogen#helptags()

" }}}
" {{{ Colors
" Background, colorscheme, etc
set background=dark

"colorscheme hemisu
"colorscheme molokai
colorscheme sahara

" }}}
" Utility {{{
" Use the file's name in the title
set title

" Show line numbers
set number

" Highlight the line the cursor is on
set cursorline

" Command history
set history=1000

" Let backspace do what it's supposed to: allow backspace over indent, eol, and start of an insert
set backspace=2

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

" Show which mode we're in
set showmode
" }}}
" Undo {{{
" -- see http://amix.dk/blog/post/19548
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 " max changes that can be undone
set undoreload=10000 " max lines to save for undo on buffer reload 

" }}}
" NERDTree {{{
map <F7> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2

" }}}
" Status line {{{
set laststatus=2
" Disable this status line when using Powerline
"set statusline=%-3.3n\ %f%(\ %r%)%(\ %#WarningMsg#%m%0*%)%=(%l/%L,\ %c)\ %P\ [%{&encoding}:%{&fileformat}]%(\ %w%)\ %y

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

" Edit and source this file
nmap <silent> <leader>ev :split $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" Better window management and navigation
map <Leader>w <C-w>w
map <Leader>W <C-w>W
map <Leader>_ <C-w>_

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Tab navigation
nmap <F4> :tabnew<CR>
nmap <F5> :tabp<CR>
nmap <F6> :tabn<CR>

" Bind dumb uppercase commands to their useful lowercase equivalents
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Disable going to Ex mode
map Q <Nop>

" Remove annoying F1 help
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" }}}
" Filetype-specific formatting and commands {{{
"
" Load filetype plugins and indents
filetype plugin indent on

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
au FileType xhtml,xml set tw=0
au FileType make set noexpandtab shiftwidth=8
au FileType python set et sw=4 sts=4 ts=4 ai
au FileType css setlocal equalprg=csstidy\ -\ --silent=true\ --preserve_css=true

" }}}
" Autocommands {{{
" Make coffeescript files on write
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" Automatically go to the last edited line on open
au BufReadPost * normal `"

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
" Highlight searches
set hlsearch

" Ignore case by default
set ignorecase

" Smart case is case-insensitive if the term is all lower-case
set smartcase

" Search as you type
set incsearch

" Wrap around the file when searching
set wrapscan

" }}}

" vim: fdm=marker
