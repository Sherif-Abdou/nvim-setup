local map = vim.keymap.set

local opts = {silent=true}
map('n', '<leader>j', '<C-w>j', {silent=true})
map('n', '<leader>k', '<C-w>k', {silent=true})
map('n', '<leader>l', '<C-w>l', {silent=true})
map('n', '<leader>h', '<C-w>h', {silent=true})
map('n', '<leader>u', '<C-o>', opts)
map('n', '<F10>', function()
    vim.cmd("LspClangdSwitchSourceHeader")
end, opts)

