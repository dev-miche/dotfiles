set nocompatible
" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" My bundles
Plug 'ervandew/supertab'
Plug 'kchmck/vim-coffee-script'
Plug 'skwp/greplace.vim'
Plug 'tomtom/tcomment_vim'
Plug 'thoughtbot/vim-rspec'
Plug 'Townk/vim-autoclose'              " Insert matching pair () {} []
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rizzatti/dash.vim'
Plug 'mileszs/ack.vim'                  " Use Ag for search
Plug 'terryma/vim-multiple-cursors'     " Sublime text style multiple cursors
Plug 'mortice/pbcopy.vim'               " Easy copy paste in terminal vim
" Colors
Plug 'nanotech/jellybeans.vim'
" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" ========================================================================
" Ruby stuff
" ========================================================================
syntax on                 " Enable syntax highlighting
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END
" Enable built-in matchit plugin
runtime macros/matchit.vim
" ================
" Use ag for text search
let g:ackprg = 'ag --vimgrep'
let mapleader = ","
imap jj <esc>
map <Leader>ac :sp app/controllers/application_controller.rb<cr>
map <Leader>bb :!bundle install<cr>
map <Leader>d orequire 'pry'<cr>binding.pry<esc>:w<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>sg :sp<cr>:grep<space>
vmap <F2> :w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map  <leader>dd   :Dash<cr>
" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^
map  <leader>fa   :Ack<space>
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500        " keep 500 lines of command line history
set ruler        " show the cursor position all the time
set showcmd        " display incomplete commands
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set guifont=Triskweline_10:h10
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set relativenumber
set number
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set lazyredraw " Don't redraw screen when running macros.
colorscheme jellybeans
" Set the tag file search order
set tags=./tags;
" Use Silver Searcher instead of grep
set grepprg=ag
" Make the omnicomplete text readable
highlight PmenuSel ctermfg=black
" Ignore stuff that can't be opened
set wildignore+=tmp/**
" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow
" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.
set nofoldenable " Say no to code folding...
" Execute macro in q
map Q @q
" Disable K looking stuff up
map K <Nop>
au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace
" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full
" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1
