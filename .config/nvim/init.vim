call plug#begin('~/.config/nvim/plugged')

" IDE settings
" Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" language settings
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'rust-lang/rust.vim'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:•,eol:↲
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

map <leader>t :NERDTreeToggle<CR>
map <leader>w :set list!<CR>
map <leader>s :source ~/.config/nvim/init.vim<CR>
map <leader>e :edit ~/.config/nvim/init.vim<CR>

nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

noremap <leader><leader>h :vertical resize -5<CR>
noremap <leader><leader>j :resize -5<CR>
noremap <leader><leader>k :resize +5<CR>
noremap <leader><leader>l :vertical resize +5<CR>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Force to use hjkl keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

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

" get rid of trailing spaces before saving
autocmd BufWritePre * :%s/\s\+$//e

source ~/.config/nvim/configplugins/coc.vim
" source ~/.config/nvim/configplugins/startify.vim
source ~/.config/nvim/configplugins/treesitter.vim
source ~/.config/nvim/configplugins/telescope.vim
source ~/.config/nvim/configplugins/lspconfig.vim
