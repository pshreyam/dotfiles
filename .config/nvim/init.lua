require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'navarasu/onedark.nvim'

  use 'neovim/nvim-lspconfig'

  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}

  use { 'Everblush/everblush.nvim', as='everblush' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "lukas-reineke/indent-blankline.nvim"
end)

require("lualine").setup{
options = {
        theme = "onedark",
        globalstatus = true
    }
}


-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = "clippy"
            },
        }
    }
}

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#141b1e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#202a2e gui=nocombine]]

require("indent_blankline").setup{
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = false,
}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.completeopt = {"menuone", "noinsert"}
-- vim.opt.mouse = "a"
vim.opt.list = false
vim.opt.listchars = { tab = ">-", trail = "~", extends = ">", precedes = "<", space = "", eol = "↲"}
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.scrolloff = 4
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"

vim.cmd("colorscheme onedark")

vim.cmd([[

set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

syntax enable

set colorcolumn=80

"enable folding
set foldmethod=indent
set foldlevel=99

autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2

" set leader key to ','
let mapleader=","

map <leader>w :set list!<CR>
map <leader>s :source ~/.config/nvim/init.lua<CR>
map <leader>e :edit ~/.config/nvim/init.lua<CR>

nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

noremap <leader>rh :vertical resize -5<CR>
noremap <leader>rj :resize -5<CR>
noremap <leader>rk :resize +5<CR>
noremap <leader>rl :vertical resize +5<CR>

nnoremap <leader>hh :windo wincmd K<CR>
nnoremap <leader>vv :windo wincmd H<CR>

nnoremap <leader>n :bn<CR>:echo expand('%:p')<CR>
nnoremap <leader>N :bp<CR>:echo expand('%:p')<CR>

" map Alt+j and Alt+k to move lines down and up
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

tnoremap <leader><Esc> <C-\><C-n>

" get rid of trailing spaces before saving
autocmd BufWritePre *.py :%s/\s\+$//e

" remove search highlight upon pressing escape twice
" silent gets rid of message in the status bar
nnoremap <silent><Esc><Esc> :noh<return>
]])
