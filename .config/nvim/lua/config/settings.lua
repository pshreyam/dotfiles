local set = vim.opt

set.fileencoding = 'utf-8'
set.encoding = 'utf-8'
set.fileformat = 'unix'

set.number = true
set.relativenumber = true

set.smarttab = true
set.smartindent = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.termguicolors = true
set.background = "dark"

set.completeopt = { "menuone", "noinsert" }
set.list = false
set.listchars = {
    tab = ">-",
    trail = "~",
    extends = ">",
    precedes = "<",
    space = ".",
    eol = "↲"
}

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.swapfile = false
set.backup = false
set.hidden = true

set.splitbelow = true
set.splitright = true
set.linebreak = true
set.scrolloff = 4
set.wrap = true
set.cursorline = true
set.signcolumn = "yes"
set.colorcolumn = "100"

set.showmode = false
set.laststatus = 3
set.cmdheight = 0

vim.cmd("colorscheme onedark")

vim.cmd([[
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2

" get rid of trailing spaces before saving
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.lua :%s/\s\+$//e
]])

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
        vim.opt.foldenable = false
    end
})

