" flp's vimrc

set nocompatible
set fileencoding=utf-8


" Plugins

call plug#begin('~/.vim/plugged')
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'fholgado/minibufexpl.vim'
Plug 'filipelinhares/snipper'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'danro/rename.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'gregsexton/MatchTag'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-qfedit'
Plug 'kshenoy/vim-signature'
Plug 'moll/vim-node'
Plug 'rakr/vim-one'
Plug 'rking/ag.vim'
Plug 'rstacruz/vim-fastunite'
Plug 'sheerun/vim-polyglot'
Plug 'shinokada/dragvisuals.vim'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Wombat'
Plug 'w0rp/ale'
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

set guifont=Menlo:h16

set background=dark
colorscheme wombat

if has("gui_macvim")
  hi Cursor guifg=#222222 guibg=#91c1f8 gui=bold

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
  set noshowmode

  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>
  noremap <C-W> :bdelete<CR>
endif


" Splitpanels options

set splitbelow
set splitright

" Easy navigation between splits
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally

nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>


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


" Fold

set foldmethod=indent


" Plugins configuration

" Autocompletes

let g:ycm_key_list_select_completion = ['<Down>']
let g:UltiSnipsExpandTrigger="<Tab>"


" Ale

let g:ale_linters = {
\   'javascript': ['jshint'],
\}


" Custom linting symbols

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'


" Airline

let g:airline#extensions#ale#enabled = 1
let g:airline_theme='wombat'


" MiniBufLine

let g:miniBufExplUseSingleClick = 1
let g:miniBufExplBRSplit = 0
let g:miniBufExplStatusLineText = ' '


" Visual drag

vmap  <expr>  <S-L> DVB_Drag('right')
vmap  <expr>  <S-J> DVB_Drag('down')
vmap  <expr>  <S-H> DVB_Drag('left')
vmap  <expr>  <S-K> DVB_Drag('up')
vmap  <expr>  D DVB_Duplicate()

let g:DVB_TrimWS = 1


" fastUnit

map <C-p> [unite]p
nmap <leader>p [unite]p


" Gundo

nnoremap <F5> :GundoToggle<CR>

" GitGutter

nmap <leader>g :GitGutterToggle<CR>


" DelimitMate

let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:}"

au FileType html let b:delimitMate_autoclose = 0


" Ag

nnoremap <leader>a :Ag!<space>
let g:ag_working_path_mode="r"


" Vimfiler

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
nmap <leader>f :VimFilerExplorer<CR>

" Disable space key in Vimfiler
autocmd FileType vimfiler nunmap <buffer> <Space>
autocmd FileType vimfiler nmap <buffer> <S-Space> <Plug>(vimfiler_toggle_mark_current_line)


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

map <leader>r :redraw!<CR>


" Disable directions key navigation

noremap <up>    :echoerr 'Use K to go up'<CR>
noremap <down>  :echoerr 'Use J to go down'<CR>
noremap <left>  :echoerr 'Use H to go left'<CR>
noremap <right> :echoerr 'Use L to go right'<CR>


" Replace

nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>


" Spelling

map <leader>ss :setlocal spell!<CR>


" Clear last search

nmap <leader>/ :noh<CR>


" Fixing typos

nmap :E :e
nmap :W :w

