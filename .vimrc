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
Plug 'fholgado/minibufexpl.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'
Plug 'rhysd/conflict-marker.vim'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'danro/rename.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'gregsexton/MatchTag'
Plug 'itchyny/vim-cursorword'
Plug 'kshenoy/vim-signature'
Plug 'moll/vim-node'
Plug 'rakr/vim-one'
Plug 'matze/vim-move'
Plug 'rking/ag.vim'
Plug 'rstacruz/vim-fastunite'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Wombat'
Plug 'w0rp/ale'
Plug 'yuttie/comfortable-motion.vim'
Plug 'fatih/vim-go'
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

set background=light
colorscheme one

if has("gui_macvim")
  set macmeta

  " Remove scroll bars
  set guioptions-=t
  set guioptions-=r

  set guifont=Menlo:h16
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

" Ale

let g:ale_linters = {
\   'javascript': [''],
\}


" Custom linting symbols

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'

" MiniBufLine

let g:miniBufExplUseSingleClick = 1
let g:miniBufExplBRSplit = 0
let g:miniBufExplStatusLineText = ' '

nmap <leader>b :MBEToggle<CR>
noremap <C-Tab> :MBEbn<CR>
noremap <C-S-Tab> :MBEbp<CR>
noremap <C-W> :MBEbd<CR>

" fastUnit

map <C-p> [unite]p
nmap <leader>p [unite]p


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

" Replace

nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>


" Clear last search

nmap <leader>/ :noh<CR>

" command JsonFormat :%!python -m json.tool

" Easy navigation between splits

nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
