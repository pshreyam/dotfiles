call plug#begin('~/.config/nvim/plugged')

" IDE settings
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" language settings
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'ulwlu/elly.vim'

call plug#end()

set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

syntax enable

set background=dark
set termguicolors
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
set laststatus=2

set completeopt=menuone,noinsert
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:•,eol:↲
"set list "to set list on

"set new splits to open below or right to the previous files
set splitbelow
set splitright

"enable folding
set foldmethod=indent
set foldlevel=99

colorscheme onedark

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

nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

noremap <leader>h :vertical resize -5<CR>
noremap <leader>j :resize -5<CR>
noremap <leader>k :resize +5<CR>
noremap <leader>l :vertical resize +5<CR>

nnoremap <leader><leader>h <C-w>h
nnoremap <leader><leader>j <C-w>j
nnoremap <leader><leader>k <C-w>k
nnoremap <leader><leader>l <C-w>l

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

source ~/.config/nvim/configplugins/coc.vim
source ~/.config/nvim/configplugins/startify.vim
source ~/.config/nvim/configplugins/treesitter.vim
