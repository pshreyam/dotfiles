call plug#begin('~/.config/nvim/plugged')

" nvim settings
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" language settings
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'

" colorscheme
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'ulwlu/elly.vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

colorscheme onedark

set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

syntax enable
set laststatus=2
set background=dark

set colorcolumn=80
set mouse=a
set cursorline
set number relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set linebreak
set wrap
set noswapfile
set nobackup
set incsearch
set noshowmode
set completeopt=menuone,noinsert

" set list to on (shows whitespace characters) and customize them using listchars
set list listchars=tab:>·,trail:~,extends:>,precedes:<,space:•

"set new splits to open below or right to the previous files
set splitbelow
set splitright

"enable folding
set foldmethod=indent
set foldlevel=99

set termguicolors

" configure the status bar
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" set leader key to ','
let mapleader=","

map <Leader>t :NERDTreeToggle<CR>
map <Leader>w :set list!<CR>

" map Alt+j and Alt+k to move lines down and up
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" map Ctrl + H for replacing patterns
nnoremap <C-h> :%s///gc<Left><Left><Left><Left>

" remove search highlight upon pressing escape twice; silent gets rid of message in the status bar
nnoremap <silent><Esc><Esc> :noh<return>

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

source ~/.config/nvim/coc.nvim
