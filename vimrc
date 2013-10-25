" .vimrc

" {{{ Setup
" Of course
set nocompatible

" Set the terminal font encoding
set encoding=utf-8
set termencoding=utf-8

" Manage multiple buffers
set hidden

" Map leader to ,
let mapleader=","

" Load filetype plugins and indents
filetype plugin indent on

" Omni completion
set omnifunc=syntaxcomplete#Complete

" More often updates for, e.g. signs.
set updatetime=750

" }}}
" {{{ Pathogen
" Store pathogen itself in bundle/
runtime! bundle/pathogen/autoload/pathogen.vim

" Start it up
silent! call pathogen#infect()
silent! call pathogen#helptags()

" }}}
" {{{ Ack
" Skip normal config, show filenames, no color, one result per line, show column numbers, smart case
let g:ackprg="ack --noenv -H --nocolor --nogroup --column --smart-case"

" }}}
" {{{ Airline

" Unicode symbols for sections
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" Short mode letters
if !exists('g:airline_mode_map')
    let g:airline_mode_map = {}
endif

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

" Add a '+' for modified buffers
function! AirlineInit()
  call airline#parts#define_raw('modified', '%{&modified ? " +" : ""}')
  let g:airline_section_c = airline#section#create(['%f', 'modified'])
endfunction
autocmd VimEnter * call AirlineInit()

" Orange modified status
function! AirlineThemeModified(palette)
  let a:palette.normal_modified.airline_c =  ['#93a1a1', '#cb4b16', 254, 166, '']
  let a:palette.insert_modified.airline_c =  ['#93a1a1', '#cb4b16', 254, 166, '']
  let a:palette.visual_modified.airline_c =  ['#93a1a1', '#cb4b16', 254, 166, '']
  let a:palette.inactive_modified.airline_c =['#cb4b16', '', 166, '', '']
endfunction
let g:airline_theme_patch_func = 'AirlineThemeModified'

" }}}
" {{{ Autocommands
if has("autocmd")
    " Make coffeescript files on write
    au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

    " Jump to last cursor position unless it's invalid or in an event handler or
    " a git commit
    au BufReadPost *
      \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

    " Only show cursorline in active windows
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
endif

" }}}
" {{{ Backups
" Skip backup entirely. It's annoying.
set nobackup
if has("writebackup")
    set nowritebackup
endif

" }}}
" {{{ Colors
if has("syntax")
    syntax enable

    set background=dark

    "silent! colorscheme hemisu
    "silent! colorscheme molokai
    "silent! colorscheme sahara

    let g:solarized_termtrans = 1
    let g:solarized_underline = 0
    silent! colorscheme solarized
endif

" }}}
" {{{ Commands
" Note that these options don't really matter when using vim-powerline.
if has("cmdline_info")
    " Show line and column information
    set ruler

    " Show command information in the status
    set showcmd

    " Show which mode we're in
    set showmode
endif

" }}}
" {{{ Folding
" Fold with triple curly braces, fill with spaces
if has("folding")
    set foldenable
    set foldmethod=marker
    set foldopen=hor,mark,search,tag,undo
    set fillchars=diff:\ ,fold:\ ,vert:\
endif

hi Folded term=standout ctermfg=3 ctermbg=none

" }}}
" {{{ Formatting
" Auto indent new lines
set autoindent

" Show matching braces
set showmatch

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

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

au FileType c,cpp,h set cindent formatoptions+=ro
au FileType xhtml,xml,html set tw=0
au FileType make set noexpandtab shiftwidth=8
au FileType python set et sw=4 sts=4 ts=4 ai
au FileType css setlocal equalprg=csstidy\ -\ --silent=true\ --preserve_css=true

" }}}
" {{{ Gundo
" Open gundo history and preview
nnoremap <F5> :GundoToggle<CR>

" }}}
" {{{ History
" Command history
set history=1000

" }}}
" {{{ Key remaps
" Completion
inoremap <Nul> <C-X><C-P>

" Edit and source this file
nmap <silent> <leader>ev :split $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" Annoyances

" Use :help instead
nnoremap <F1> <nop>
" No ex mode
nnoremap Q <nop>
" No man pages because I don't write C or many shell scripts
nnoremap K <nop>

" Tab navigation
" nmap <F4> :tabnew<CR>
" nmap <F5> :tabp<CR>
" nmap <F6> :tabn<CR>

" Bind dumb uppercase commands to their useful lowercase equivalents
if has("user_commands")
    command! -bang E e<bang>
    command! -bang Q q<bang>
    command! -bang W w<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Wq wq<bang>
    command! -bang WQ wq<bang>
endif

" Make Y act like other uppercase commands
nnoremap Y y$

" Disable going to Ex mode
map Q <Nop>

" Remove annoying F1 help
noremap <F1> <nop>

" Disable trying to look up things that Google is better for
nnoremap K <no>

" }}}
" {{{ Line Numbers
" Show line numbers
set relativenumber

" }}}
" {{{ List
" Toggle invisibles, hide by default
set nolist
set listchars=eol:¶,tab:»·,trail:·,extends:>,precedes:<
nnoremap <leader>l :set list!<CR>

" }}}
" {{{ Matching
" Enable extended % matching
silent! runtime macros/matchit.vim

" }}}
" {{{ Messages
" Shorten a lot of notifications and suppress the splash screen
set shortmess+=aI

" }}}
" {{{ NERDTree
map <F7> :NERDTreeToggle<CR>

" Change the working directory to the top NERDTree directory
let NERDTreeChDirMode = 2

" }}}
" {{{ Paste
set nopaste
nnoremap <leader>p :set paste!<CR>

" }}}
" {{{ Scrolling
" Scrolling context; lines/columns of buffer while scrolling
set scrolloff=3
set sidescrolloff=5

" Scrolling speed
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" }}}
" {{{ Search
if has("extra_search")
    " Highlight searches
    set hlsearch
    nnoremap <leader>h :nohlsearch<CR>

    " Be smart about searching case-sensitively
    set smartcase
    set ignorecase

    " Search as you type
    set incsearch
    nnoremap <leader>i :set incsearch!<CR>

    " Wrap around the file when searching
    set wrapscan
endif

" }}}
" {{{ Spelling
if has("spell")
    set spelllang=en_us
    nnoremap <leader>sp :set spell!<CR>
endif

" }}}
" {{{ Splits

" Intuitive split locations
set splitbelow
set splitright

" }}}
" {{{ Status line
" Always show the status line
set laststatus=2
" Disable this status line when using Powerline
"set statusline=%-3.3n\ %f%(\ %r%)%(\ %#WarningMsg#%m%0*%)%=(%l/%L,\ %c)\ %P\ [%{&encoding}:%{&fileformat}]%(\ %w%)\ %y

" }}}
" {{{ Swap
" Turn swap off
set noswapfile
set updatecount=0

" }}}
" {{{ Syntastic
" Use jshint (uses ~/.jshintrc)
let g:syntastic_javascript_checkers = ['jshint']

" Use flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,E121,W801"'

" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" Check on buffer open
let g:syntastic_check_on_open = 1
" }}}
" {{{ Terminal

" Better redrawing for large files
set ttyfast

" Disable the vbell
set visualbell t_vb=

" }}}
" {{{ Undo
" -- see http://amix.dk/blog/post/19548
set undodir=~/.vim/undodir
set undofile

" max changes that can be undone
set undolevels=1000

" max lines to save for undo on buffer reload
set undoreload=10000

" }}}
" {{{ Utility
" Respect vim modelines
set modeline

" Use the file's name in the title
set title

" Highlight the line the cursor is on
set cursorline

" Let backspace do what it's supposed to: allow backspace over indent, eol, and start of an insert
set backspace=indent,eol,start

" Reuse open buffers and tabs
set switchbuf=useopen,usetab

" }}}
" {{{ Wildmenu
if has("wildmenu")
    " Bash-like tab completion for commands
    set wildmenu
    set wildmode=longest:list
    set wildchar=<Tab>
    if has("wildignore")
        set wildignore+=*.a,*.o,*.pyc
        set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
        set wildignore+=.DS_Store,.git,.hg,.svn
        set wildignore+=*~,*.swp,*.tmp
    endif
    if exists("&wildignorecase")
        set wildignorecase
    endif
endif

" }}}
" {{{ Windows
" Split windows below and right -- default is above and left, which can be disorienting
set splitbelow splitright

" Better window management and navigation
map <leader>w <C-w>w
map <leader>W <C-w>W
map <leader>_ <C-w>_

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" }}}

" vim: fdm=marker
