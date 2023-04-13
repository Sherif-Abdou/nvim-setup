local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd('colorscheme slate')


map('n', 't', [[:NvimTreeToggle<CR>]], {silent=True})
map('n', '<leader>j', '<C-w>j', {silent=true})
map('n', '<leader>k', '<C-w>k', {silent=true})
map('n', '<leader>l', '<C-w>l', {silent=true})
map('n', '<leader>h', '<C-w>h', {silent=true})
map('n', ' ', '<Nop>', {silent = true})
local opts = {silent=true}
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
kmap('n', 'gD', vim.lsp.buf.declaration, opts)
kmap('n', 'gd', vim.lsp.buf.definition, opts)
kmap('n', 'gi', vim.lsp.buf.implementation, opts)
kmap('n', 'gr', vim.lsp.buf.references, opts)
kmap('n', '<leader>c', vim.lsp.buf.code_action, opts)
kmap('n', '<CR>', ":noh<CR><CR>", opts)
