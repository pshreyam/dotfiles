call plug#begin('~/.config/nvim/plugged')

Plug 'mcchrish/nnn.vim'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
Plug 'dracula/vim'
Plug 'itchyny/vim-gitbranch'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"colorscheme dracula
colorscheme gruvbox

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
"set number
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

"set new splits to open below or right to the previous files
set splitbelow
set splitright

let g:python3_host_prog = '/usr/bin/python3'

"configure the status bar
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"configure the nnn layout
"let g:nnn#layout = 'new'
"let g:nnn#layout = { 'left': '~20%' }
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"run nnn in detail
let g:nnn#command = 'nnn -d'
"Hidden files/folders can be toggled with :. or by placing -H flag

"mapping \nnn to open nnn
map <Leader>nnn :Np<CR>

"mapping Alt+j and Alt+k to move lines down and up
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
