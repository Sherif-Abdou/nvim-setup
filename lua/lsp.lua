local lspconfig = require('lspconfig')

local on_attach = function(client)
    require('completion').on_attach(client)
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })


function set_keybinds()
    local map = vim.keymap.set
    local opts = { silent = true }
    map('n', '<leader>.', vim.lsp.buf.code_action, opts)
    map('n', '<leader>c', vim.lsp.buf.code_action, opts)
    map('v', '<leader>c', vim.lsp.buf.code_action, opts)
    map('n', '<leader>r', vim.lsp.buf.rename, opts)
    map('n', '<leader>R', vim.lsp.buf.format, opts)
end

set_keybinds()

vim.api.nvim_create_autocmd('LspAttach', {
    callback=function(args)
        vim.lsp.inlay_hint.enable(true)
    end
})

features = {}

function enable_feature(feature)
    table.insert(features, feature)
    vim.lsp.config('rust_analyzer', {
        settings = {
            ['rust-analyzer'] = {
                procMacro = true,
                cargo = {
                    features = features,
                },
                check = {
                    command = "clippy",
                }
            }
        }
    })
    vim.cmd("LspRestart")
    vim.cmd("LspCargoReload")
    -- vim.lsp.enable("rust_analyzer", false)
    -- vim.lsp.enable("rust_analyzer", true)
end

vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            procMacro = true,
            cargo = {
                features = features,
            },
        }
    }
})

vim.lsp.config('elixirls', {
    cmd = { "/home/sherif/.elixir-ls/release/language_server.sh" },
})

vim.lsp.enable('clangd')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')
vim.lsp.enable('jdtls')
vim.lsp.enable('pyright')
vim.lsp.enable('gopls')
vim.lsp.enable('sqlls')
vim.lsp.enable('elixirls')
vim.lsp.enable('ocamllsp')
vim.lsp.enable('kotlin_lsp')
