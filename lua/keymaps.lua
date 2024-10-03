local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set

--:tnoremap <Esc> <C-\><C-n>
map('n', "<F2>", ":ToggleTerm<CR>", {silent=true})
map('t', '<F2>', [[<C-\><C-n>:ToggleTerm<CR>]], {silent=true})

map('n', 't', [[:NvimTreeToggle<CR>]], {silent=true})
map('n', '<leader>j', '<C-w>j', {silent=true})
map('n', '<leader>k', '<C-w>k', {silent=true})
map('n', '<leader>l', '<C-w>l', {silent=true})
map('n', '<leader>h', '<C-w>h', {silent=true})
map('n', ' ', '<Nop>', {silent = true})
local opts = {silent=true}
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

local builtin = require("telescope.builtin")

kmap('n', 'T', builtin.diagnostics, {silent=true})
kmap('n', 'gD', builtin.lsp_type_definitions, opts)
kmap('n', 'gd', builtin.lsp_definitions, opts)
kmap('n', 'gi', builtin.lsp_implementations, opts)
kmap('n', 'gr', builtin.lsp_references, opts)

kmap('n', '<F10>', ':ClangdSwitchSourceHeader<CR>', opts)
kmap('i', '<F10>', '<ESC>:ClangdSwitchSourceHeader<CR>', opts)
kmap('n', '<leader>u', '<C-o>', opts)
kmap('n', '<leader>.', vim.lsp.buf.code_action, opts)
kmap('n', '<leader>c', vim.lsp.buf.code_action, opts)
kmap('v', '<leader>c', vim.lsp.buf.code_action, opts)
kmap('n', '<leader>r', vim.lsp.buf.rename, opts)
kmap('n', '<leader>R', vim.lsp.buf.format, opts)
kmap('n', '<leader>q', ":silent bd<CR>", opts)
kmap('n', '<CR>', ":noh<CR><CR>", opts)
kmap('n', '<leader>p', ":Telescope find_files<CR>", opts)
kmap('n', '<leader>g', ":Telescope live_grep<CR>", opts)
kmap('n', '<leader>d', ":Telescope lsp_dynamic_workspace_symbols<CR>", opts)
kmap('n', '<leader>b', require('dap').toggle_breakpoint, opts)
kmap('n', '<leader>C', require('dap').continue, opts)
kmap('n', '<leader>s', require('dap').step_into, opts)
kmap('n', '<leader>S', require('dap').step_over, opts)
kmap('n', '<leader>n', require('dap').step_over, opts)
kmap('n', '<leader>O', require('dap').step_out, opts)
kmap('n', '<leader>T', require('dap').terminate, opts)
kmap('n', '<leader>f', require('dap').focus_frame, opts)
kmap('n', '<leader>f', require('dap').focus_frame, opts)
kmap('n', '<leader>M', require('dap').run_to_cursor, opts)
kmap('n', '<leader>o', require('dap').repl.open, opts)
kmap('n', '<leader>;',  ":Telescope colorscheme<CR>", opts)
kmap('n', '<leader>z',  ":ZenMode<CR>", opts)

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
