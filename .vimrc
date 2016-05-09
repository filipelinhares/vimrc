" Enable Indent in plugins
filetype plugin indent on
syntax enable

" Enable syntax highlighting
syntax on

" do not create backup, swap file, use git for version managment
set nobackup
set nowritebackup
set noswapfile

set history=1000  "store lots of :cmdline history

" Let vim know what encoding we use in our terminal
set termencoding=utf-8

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" Make < and > match as well
set matchpairs+=<:>

" Use 256 colors in vim
set t_Co=256

" Set bash as vim default - http://stackoverflow.com/a/31002786
set shell=/bin/bash

" ---------------------------------------------------------------------------
" UI
" ---------------------------------------------------------------------------
set title
set encoding=utf-8
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set wildcharm=<TAB> " Autocmpletion hotkey
set novisualbell
set cursorline
set ttyfast
set backspace=indent,eol,start "allow backspacing over everything in insert mode
set laststatus=2
set nonumber
set relativenumber " show relative numbers
set number
set colorcolumn=+1 " higlight column right after max textwidth
set nostartofline "The cursor should stay where you leave it, instead of moving to the first non blank of the line
set smarttab

"--------------------------------------------------
" Splitpanels options

" Hotkeys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Preferences
set splitbelow
set splitright

" some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" ---------------------------------------------------------------------------
" Text Formatting
" ---------------------------------------------------------------------------
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
set list
set listchars=tab:»\ ,eol:¬,trail:·

" ---------------------------------------------------------------------------
" Gui options
" ---------------------------------------------------------------------------
set guifont=Fira\ Mono\ for\ Powerline\ 16

" Don't blink normal mode cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guitablabel=%M\ %t
endif

" Add a bit extra margin to the left
set foldcolumn=1

source $VIMRUNTIME/mswin.vim
behave mswin

" ---------------------------------------------------------------------------
" Plugin configuration
" ---------------------------------------------------------------------------

"-------------------------
" ctrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"-------------------------
" VimFiler

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

silent! nmap <silent> <Leader>f :VimFilerExplorer<CR>

"-------------------------
" Airline
let g:airline_theme='behelit'

"-------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

let delimitMate_matchpairs = "(:),[:],{:}"

" Delimit
au FileType html let b:delimitMate_autoclose = 0

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Snippets
" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" git-vim
nmap <leader>gst :GitStatus<CR>
nmap <leader>glog :GitLog<CR>
nmap <leader>gd :GitDiff<CR>

" Ag
nnoremap <leader>a :Ag!<space>

" ---------------------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------------------

" Disable directions key navigation
noremap <up>    :echoerr 'Use K to go up'<CR>
noremap <down>  :echoerr 'Use J to go down'<CR>
noremap <left>  :echoerr 'Use H to go left'<CR>
noremap <right> :echoerr 'Use L to go right'<CR>

" Tab keyboard navigation options
nnoremap t^  :tabfirst<CR>
nnoremap t$  :tablast<CR>
nnoremap th  :tabprev<CR>
nnoremap tl  :tabnext<CR>
nnoremap tt  :tabedit<CR>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>

" Tab navigation like Firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-w>     :tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i

" Replace
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Fixing typos
nmap :E :e
nmap :W :w

" Spelling
map <leader>ss :setlocal spell!<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Clear last search
silent! nmap <silent> <Leader>/ :noh<CR>

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
" Style and theming
Plug 'sheerun/vim-polyglot'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'felixhummel/setcolors.vim'
Plug 'flazz/vim-colorschemes'
Plug 'dag/vim-fish'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'

" Snippets
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'filipelinhares/vim-css-comments'
Plug 'filipelinhares/vim-mini-snippets'

" Useful
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'jszakmeister/vim-togglecursor'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'vim-scripts/loremipsum'
Plug 'danro/rename.vim'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/vim-show-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'motemen/git-vim'
Plug 'moll/vim-node'
call plug#end()

" Colorscheme
set background=dark

try
  colorscheme duotone-dark
catch
endtry

" "--------------------------------------------------
" " Aautocmd

" It executes specific command when specific events occured
" like reading or writing file, or open or close buffer
if has("autocmd")
    " Define group of commands,
    " Commands defined in .vimrc don't bind twice if .vimrc will reload
    augroup vimrc
    " Delete any previosly defined autocommands
    au!
        " Auto reload vim after your cahange it
        au BufWritePost *.vim source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

        " Restore cursor position :help last-position-jump
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif

        " Set filetypes aliases
        au FileType htmldjango set ft=html.htmldjango
        au FileType scss set ft=scss.css
        au FileType less set ft=less.css
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
        au BufRead,BufNewFile *.js set ft=javascript.javascript-jquery
        au BufRead,BufNewFile *.json set ft=json
        " Execute python \ -mjson.tool for autoformatting *.json
        au BufRead,BufNewFile *.bemhtml set ft=javascript
        au BufRead,BufNewFile *.bemtree set ft=javascript
        au BufRead,BufNewFile *.xjst set ft=javascript
        au BufRead,BufNewFile *.tt2 set ft=tt2
        au BufRead,BufNewFile *.plaintex set ft=plaintex.tex

        " Auto close preview window, it uses with tags,
        " I don't use it
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

        " Not enable Folding - it really slow on large files, uses plugin vim-javascript-syntax
        " au FileType javascript* call JavaScriptFold()
        au FileType html let b:loaded_delimitMate = 1
        au FileType handlebars let b:loaded_delimitMate = 1

    " Group end
    augroup END
endif

" "--------------------------------------------------
" " Trailing white space

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

augroup whitespace
  autocmd!
  autocmd BufWrite *.py :call DeleteTrailingWS()
  autocmd BufWrite *.coffee :call DeleteTrailingWS()
  autocmd BufWrite *.rb :call DeleteTrailingWS()
augroup END

silent! nmap <silent> <Leader>w :call DeleteTrailingWS()<CR>

