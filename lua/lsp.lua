local nvim_lsp = require('lspconfig')

local on_attach = function(client)
	require('completion').on_attach(client)
end

-- nvim_lsp.jedi_language_server.setup({})
nvim_lsp.pyright.setup({})
nvim_lsp.asm_lsp.setup({})
nvim_lsp.glslls.setup({})
nvim_lsp.cmake.setup({})
nvim_lsp.clangd.setup({
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders"
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
    semanticHighlighting = true
  },
  -- on_attach = on_attach,
  flags = { debounce_text_changes = 150 }
})
nvim_lsp.ts_ls.setup({})
nvim_lsp.omnisharp.setup({})
nvim_lsp.gopls.setup({})
nvim_lsp.elixirls.setup({})
nvim_lsp.lua_ls.setup({})


nvim_lsp.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro= {
                enable= true,
            },
            check = {
                command="clippy"
            }
        }
    }
})


require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "rust", "toml", "c", "cpp", "go" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=false,
    },
    ident = { enable = true }, 
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

--vim.cmd([[
--set signcolumn=yes
--autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
--]])

vim.lsp.inlay_hint.enable(true)

require('lspconfig')
--nvim_lsp.rust_analyzer.setup({
    --   on_attach = function(client, bufnr)
        --      vim.lsp.inlay_hint.enable(bufnr)
        -- end
        --})

