local set = vim.opt

set.fileencoding = "utf-8"
set.encoding = "utf-8"
set.fileformat = "unix"

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
  eol = "↲",
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
set.cmdheight = 1

set.winborder = "rounded"

vim.cmd("colorscheme onedark")
