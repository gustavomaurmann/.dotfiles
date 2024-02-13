vim.g.mapleader = " " 

-- Stolen from ThePrimeagen
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

-- QoL Yank/Paste
vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>d', '"+d')
vim.keymap.set('v', '<leader>d', '"+d')


-- Window movement
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

-- Window layout
vim.keymap.set('n', '<leader>H', '<C-w>H')
vim.keymap.set('n', '<leader>J', '<C-w>J')
vim.keymap.set('n', '<leader>K', '<C-w>K')
vim.keymap.set('n', '<leader>L', '<C-w>L')

-- Resizing
vim.keymap.set('n', '<leader>-', '<C-w>-')
vim.keymap.set('n', '<leader>+', '<C-w>+')
vim.keymap.set('n', '<leader><', '<C-w><')
vim.keymap.set('n', '<leader>>', '<C-w>>')

-- Splitting
vim.keymap.set('n', '<leader>v', '<C-w>v')
vim.keymap.set('n', '<leader>s', '<C-w>s')
vim.keymap.set('n', '<leader>n', ':vnew<CR>')

-- Misc
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', '<C-w>q')
vim.keymap.set('n', '<leader>Q', ':q!<CR>')
vim.keymap.set('n', '<leader>c', ':nohl<CR>')
