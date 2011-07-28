set nocp
set directory=~/.vim/swap
set backupskip=/tmp/*,/private/tmp/*

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"colorscheme ir_black

" Manage multiple buffers
set hidden

" Use the file's name in the title
set title

" No annoying beep
"set visualbell

" Turn on syntax highlighting
syntax on

" Background, colorscheme, etc
set background=dark

" Utility features
set ruler
set number
set cursorline
set history=1000
set bs=2

" Set the terminal font encoding
set encoding=utf-8
set termencoding=utf-8

" Turn plugin features on
filetype on
filetype plugin on
filetype indent on
set autoindent
set showmatch

" Bash-like tab completion
set wildmenu
set wildmode=list:longest

" Mouse options
"set mouse=a
"set mousemodel=popup

" Spacing and tabbing
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100
set nowrap

" Scrolling context
set scrolloff=3

" Map leader to ,
let mapleader = ","

" Scrolling speed
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Filetype-specific formatting
set formatoptions+=t,c,r,o,n

au FileType c,cpp,h set cindent formatoptions+=ro 
au FileType c set omnifunc=ccomplete#Complete 
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType html,xhtml,xml set omnifunc=htmlcomplete#CompleteTags tw=0
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType make set noexpandtab shiftwidth=8
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType python set omnifunc=pythoncomplete#Complete et sw=4 sts=4 ts=4 ai
au FileType ruby set omnifunc=rubycomplete#Complete
au FileType tex SPCheck
au FileType tex let dialect='US'
au Syntax {cpp,c,idl} runtime syntax/doxygen.vim

au BufRead,BufNewFile PKGBUILD set ts=2 sts=2 et sw=2
au BufNewFile,BufRead .Xdefaults* set filetype=xdefaults
au BufReadPost * normal `"

" Completion
inoremap <Nul> <C-x><C-p>

" Status line settings
set laststatus=2
set statusline=%-3.3n\ %f%(\ %r%)%(\ %#WarningMsg#%m%0*%)%=(%l/%L,\ %c)\ %P\ [%{&encoding}:%{&fileformat}]%(\ %w%)\ %y
set shortmess+=aI

hi StatusLine term=inverse cterm=NONE ctermfg=red ctermbg=white
hi StatusLineNC term=none cterm=NONE ctermfg=darkgray ctermbg=lightgray

" Folding
if has("folding")
    set foldenable 
    set foldmethod=marker
    set foldopen=hor,mark,search,tag,undo
endif

hi Folded term=standout ctermfg=3 ctermbg=none

" Searching & Replacing
set hlsearch
set ignorecase
set smartcase
set incsearch

" Enable extended % matching
runtime macros/matchit.vim

set switchbuf=useopen,usetab

