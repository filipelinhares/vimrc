" flp's vimrc

set nocompatible
set encoding=utf-8

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'rakr/vim-one'
Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'danro/rename.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'gregsexton/MatchTag'

Plug 'kien/ctrlp.vim'
Plug 'posva/vim-vue'
Plug 'rking/ag.vim'

Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Leader now is Space

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

filetype plugin indent on
syntax enable
syntax on

set iskeyword+=-
set matchpairs+=<:>
set shell=/bin/bash
set hlsearch
set incsearch
set ignorecase
set smartcase
set shortmess+=T
set relativenumber
set autoindent
set title
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set novisualbell
set noerrorbells
set cursorline
set backspace=indent,eol,start
set laststatus=2
set number
set nostartofline
set smarttab

" GUI

set background=dark
colorscheme dracula

if has("gui_macvim")
  set macmeta

  " Remove scroll bars
  set guioptions-=t
  set guioptions-=r

  set guifont=Mononoki:h18
  hi Cursor guifg=#222222 guibg=#91c1f8 gui=bold

  if has('python3')
    command! -nargs=1 Py py3 <args>
    set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.6/Python
    set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.6
  else
    command! -nargs=1 Py py <args>
    set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
    set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
  endif
endif

" Splitpanels options

set splitbelow
set splitright


" Text Formatting

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab!

set whichwrap=b,s,<,>,[,],
set nowrap
set textwidth=0
set formatoptions=n

set wrap
set linebreak


" Show trailing whitespace

set list
set listchars=tab:>-,trail:·,extends:>,precedes:<


" Vim backup files organized by context

set backup
set backupdir=$HOME/.vim/files/backup/
set backupskip=
set directory=$HOME/.vim/files/swap/
set updatecount=100
set undofile
set undodir=$HOME/.vim/files/undo/

" Plugins configuration


" MiniBufLine

let g:miniBufExplUseSingleClick = 1
let g:miniBufExplBRSplit = 0
let g:miniBufExplStatusLineText = ' '

nmap <leader>b :MBEToggle<CR>
noremap <C-Tab> :MBEbn<CR>
noremap <C-S-Tab> :MBEbp<CR>
noremap <C-W> :MBEbd<CR>


" CtrlP

map <C-p> :CtrlP<CR>
nmap <leader>p :CtrlP<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$|node_modules'


" GitGutter

nmap <leader>g :GitGutterToggle<CR>


" Ag

nnoremap <leader>a :Ag!<space>
let g:ag_working_path_mode="r"


" NERDTree

map <leader>f :NERDTreeToggle<CR>

" Keymaps

" Replace

nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>


" Clear last search

nmap <leader>/ :noh<CR>


" Easy navigation between splits

nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
