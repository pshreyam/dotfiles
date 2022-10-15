local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

vim.g.mapleader = ','

map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>w', ':set list!<CR>', opts)
map('n', '<leader>e', ':edit ~/.config/nvim/init.lua<CR>', opts)
map('n', '<leader>s', ':source ~/.config/nvim/init.lua<CR>', opts)

vim.keymap.set({'n', 'x'}, '<leader>y', '"+y', opts)
vim.keymap.set({'n', 'x'}, '<leader>p', '"+p', opts)

map('n', '<leader>h', '<C-w>h', opts)
map('n', '<leader>j', '<C-w>j', opts)
map('n', '<leader>k', '<C-w>k', opts)
map('n', '<leader>l', '<C-w>l', opts)

map('n', '<leader>rh', ':vertical resize -5<CR>', opts)
map('n', '<leader>rj', ':resize -5<CR>', opts)
map('n', '<leader>rk', ':resize +5<CR>', opts)
map('n', '<leader>rl', ':vertical resize +5<CR>', opts)

map('n', '<leader>hh', ':windo wincmd K', opts)
map('n', '<leader>vv', ':windo wincmd H', opts)

map('n', '<leader>n', ':bn<CR>:echo expand("%:p")<CR>', opts)
map('n', '<leader>N', ':bp<CR>:echo expand("%:p")<CR>', opts)

-- map Alt+j and Alt+k to move lines down and up
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
map('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
map('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- map('t', '<leader><Esc>', '<C-\><C-n>', opts)

map('n', '<Esc><Esc>', ':noh<CR>', opts)
