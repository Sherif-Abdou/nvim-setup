local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd('colorscheme catppuccin')
vim.cmd('set number')
vim.cmd('set relativenumber')


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
kmap('n', '<leader>q', ":silent bd<CR>", opts)
kmap('n', '<CR>', ":noh<CR><CR>", opts)
kmap('n', '<leader>p', ":Telescope find_files<CR>", opts)
kmap('n', '<leader>g', ":Telescope live_grep<CR>", opts)
kmap('n', '<leader>b', require('dap').toggle_breakpoint, opts)
kmap('n', '<leader>c', require('dap').continue, opts)
kmap('n', '<leader>s', require('dap').step_into, opts)
kmap('n', '<leader>S', require('dap').step_over, opts)
kmap('n', '<leader>O', require('dap').step_out, opts)
kmap('n', '<leader>T', require('dap').terminate, opts)
kmap('n', '<leader>f', require('dap').focus_frame, opts)
kmap('n', '<leader>f', require('dap').focus_frame, opts)
kmap('n', '<leader>C', require('dap').run_to_cursor, opts)
kmap('n', '<leader>o', require('dap').repl.open, opts)

local dap = require('dap')
local api = vim.api
local keymap_restore = {}
dap.listeners.after['event_initialized']['me'] = function()
  for _, buf in pairs(api.nvim_list_bufs()) do
    local keymaps = api.nvim_buf_get_keymap(buf, 'n')
    for _, keymap in pairs(keymaps) do
      if keymap.lhs == "K" then
        table.insert(keymap_restore, keymap)
        api.nvim_buf_del_keymap(buf, 'n', 'K')
      end
    end
  end
  api.nvim_set_keymap(
    'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
end

dap.listeners.after['event_terminated']['me'] = function()
  for _, keymap in pairs(keymap_restore) do
    api.nvim_buf_set_keymap(
      keymap.buffer,
      keymap.mode,
      keymap.lhs,
      keymap.rhs,
      { silent = keymap.silent == 1 }
    )
  end
  keymap_restore = {}
end
