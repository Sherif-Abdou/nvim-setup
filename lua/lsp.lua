local lspconfig = require('lspconfig')

local on_attach = function(client)
    require('completion').on_attach(client)

end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })


function set_keybinds()
    local map = vim.keymap.set
    local opts = {silent=true}
    map('n', '<leader>.', vim.lsp.buf.code_action, opts)
    map('n', '<leader>c', vim.lsp.buf.code_action, opts)
    map('v', '<leader>c', vim.lsp.buf.code_action, opts)
    map('n', '<leader>r', vim.lsp.buf.rename, opts)
    map('n', '<leader>R', vim.lsp.buf.format, opts)
end

set_keybinds()

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')
