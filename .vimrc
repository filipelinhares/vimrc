" flp's vimrc

set fileencoding=utf-8


" Plugins

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler.vim'
Plug 'rstacruz/vim-fastunite'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'gregsexton/MatchTag'
Plug 'shinokada/dragvisuals.vim'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'danro/rename.vim'
Plug 'rakr/vim-one'
Plug 'vim-scripts/Wombat'
Plug 'yuttie/comfortable-motion.vim'
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
set hlsearch incsearch ignorecase smartcase
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

if has("gui_macvim")
  set guifont=Fira\ Mono:h18

  set background=dark
  let g:airline_theme='wombat'
  colorscheme wombat

 " Remove scroll bars
  set guioptions-=t
  set guioptions-=r
  set guioptions-=L
  set guitablabel=%M\ %t

  " Display the default tab style
  set guioptions-=e

  set macligatures
  set ttyfast
  set linespace=1

  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<cr>
  noremap <C-S-Tab> :tabprev<cr>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<cr>
  noremap <D-2> :tabn 2<cr>
  noremap <D-3> :tabn 3<cr>
  noremap <D-4> :tabn 4<cr>
  noremap <D-5> :tabn 5<cr>
  noremap <D-6> :tabn 6<cr>
  noremap <D-7> :tabn 7<cr>
  noremap <D-8> :tabn 8<cr>
  noremap <D-9> :tabn 9<cr>

  " Command-0 goes to the last tab
  noremap <D-0> :tablast<cr>
endif


" Splitpanels options
set splitbelow
set splitright

" Easy navigation between splits
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


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
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+


" Vim backup files organized by context

set backup
set backupdir=$HOME/.vim/files/backup/
set backupskip=
set directory=$HOME/.vim/files/swap/
set updatecount=100
set undofile
set undodir=$HOME/.vim/files/undo/


" Plugins configuration

vmap  <expr>  <S-L> DVB_Drag('right')
vmap  <expr>  <S-J> DVB_Drag('down')
vmap  <expr>  <S-H> DVB_Drag('left')
vmap  <expr>  <S-K> DVB_Drag('up')
vmap  <expr>  D DVB_Duplicate()

let g:DVB_TrimWS = 1


" fastUnit

map <C-p> [unite]p
nmap <leader>p [unite]p


" GitGutter

nmap <leader>g :GitGutterToggle<cr>


" DelimitMate

let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:}"

au FileType html let b:delimitMate_autoclose = 0


" Ag

nnoremap <leader>a :Ag!<space>
let g:ag_working_path_mode="r"


" Vimfilerp

let g:vimfiler_as_default_explorer = 1
nmap <leader>f :VimFiler<CR>


" Tagbar

nmap <F8> :TagbarToggle<CR>


" Keymaps


" Conversion

" to snake_case
nmap <leader>2_ cr_
" to camelCase
nmap <leader>2c crc
" to MixedCase
nmap <leader>2m crm
" to SNAKE_UPPERCASE
nmap <leader>2u cru
" to dash-case
nmap <leader>2- cr-

" Force redraw

map <leader>r :redraw!<cr>


" Disable directions key navigation

noremap <up>    :echoerr 'Use K to go up'<cr>
noremap <down>  :echoerr 'Use J to go down'<cr>
noremap <left>  :echoerr 'Use H to go left'<cr>
noremap <right> :echoerr 'Use L to go right'<cr>


" Replace

nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>


" Spelling

map <leader>ss :setlocal spell!<cr>


" Clear last search

nmap <leader>/ :noh<cr>


" Fixing typos

nmap :E :e
nmap :W :w

