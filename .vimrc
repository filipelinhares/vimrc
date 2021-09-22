" flp's vimrc

set nocompatible
set encoding=utf-8
let $LANG = 'en_US'

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/vim-clap'
Plug 'kshenoy/vim-signature'
Plug 'preservim/nerdtree'
Plug 'tyru/columnskip.vim'
Plug 'rking/ag.vim'
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'danro/rename.vim'
Plug 'zefei/vim-wintabs'
Plug 'dense-analysis/ale'
Plug 'gregsexton/MatchTag'
Plug 'bpietravalle/vim-bolt'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug '~/Projects/dumb-palette.vim'
call plug#end()

" MacVim
if has("gui_macvim")
  set macmeta

  " Remove scroll bars
  set guioptions-=t
  set guioptions-=r

  set guifont=Mononoki:h24
  hi Cursor guifg=#222222 guibg=#91c1f8 gui=bold
endif

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
set foldmethod=indent
set foldlevelstart=2
set autoread
set noswapfile

" GUI
set background=dark
colorscheme spaceduck

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

" CtrlP
map <C-p> :CtrlP<CR>
nmap <leader>p :Clap files<CR>
nmap <leader>b :Clap buffers<CR>
nmap <leader>c :Clap<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$|node_modules'
let g:ctrlp_show_hidden = 1

nmap <leader>a :Ag<space>
let g:ag_working_path_mode='r'

" NERDTree
map <leader>f :NERDTreeFind<CR>
map <leader>m :NERDTreeToggle<CR>
let NERDTreeMinimalMenu = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1


" LightTable
let g:lightline = {
      \ 'colorscheme': 'spaceduck',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Mapping
map <leader>r :source ~/.vimrc<CR>
map <leader>fl :set nofoldenable<CR>
nmap <Esc> :noh<CR>

" Replace
nmap <leader>s :%S//<left>
vmap <leader>s :S//<left>
nmap <Leader>d :%S/<C-r><C-w>/
nmap <Leader>x :/<C-r><C-w><CR>

" Easy navigation between splits
nmap <leader>j <C-W><C-J>
nmap <leader>k <C-W><C-K>
nmap <leader>l <C-W><C-L>
nmap <leader>h <C-W><C-H>

" Easy navigation between buffers
map <leader>w :bd<CR>
map <leader><Right> :bn<CR>
map <leader><Left> :bp<CR>

" Commentary
map <leader>/ :Commentary<CR>

" Sneak
let g:sneak#label = 1
nmap sf <Plug>SneakLabel_s
nmap sF <Plug>SneakLabel_S

" Wintabs
map <C-S-Tab> <Plug>(wintabs_previous)
map <C-Tab> <Plug>(wintabs_next)
map <leader>w <Plug>(wintabs_close)
map <leader>t <Plug>(wintabs_undo)

" Ale
let b:ale_fixers = ['prettier', 'eslint']

" Vim Clap
let g:clap_open_preview = 'never'

" Surround
let g:surround_no_mappings = 0

" dumb palette
let dumb_commands = [
      \ {'text': 'Prettier', 'command': 'PrettierAsync' },
      \ {'text': 'Close all but not', 'command': 'WintabsOnly' },
      \ {'text': 'Package Install', 'command': 'PlugInstall' },
      \ {'text': 'Package Clean', 'command': 'PlugClean' },
      \ {'text': 'Terminal', 'command': 'term' },
      \ {'text': 'Copy file name', 'type': 'filename', 'func': 'ClipboardFilter' },
      \ {'text': 'Copy project path', 'type': 'filename-project', 'func': 'ClipboardFilter' },
      \ ]

func ClipboardFilter(option)
  if a:option.type == 'filename'
    let @* = expand('%:t')
  endif

  if a:option.type == 'filename-project'
    let @* = expand('%:p')
  endif
endfunc

" Column skip
map sj <Plug>(columnskip:nonblank:next)
map sk <Plug>(columnskip:nonblank:prev)
map s] <Plug>(columnskip:first-nonblank:next)
map s[ <Plug>(columnskip:first-nonblank:prev)

" Run macros between lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

