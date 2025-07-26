local lspconfig = require('lspconfig')

local on_attach = function(client)
    require('completion').on_attach(client)
end

-- vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }
--
-- vim.opt.shortmess = vim.opt.shortmess + { c = true }
--
-- local cmp = require('cmp')
-- cmp.setup({
--     sources = {
--         { name = 'path' },
--         { name = 'nvim_lsp' },
--         { name = 'nvim_lsp_signature_help' },
--         { name = 'nvim_lua' },
--         { name = 'buffer' },
--         { name = 'vsnip' },
--     },
--     snippet = {
--         -- REQUIRED - you must specify a snippet engine
--         expand = function(args)
--             -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--             -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--             -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--             -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--             vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
--         end,
--     },
--     experimental = {
--         ghost_text = false,
--     },
--     mapping = {
--         -- Shift+TAB to go to the Previous Suggested item
--         ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--         -- Tab to go to the next suggestion
--         ['<Tab>'] = cmp.mapping.select_next_item(),
--         -- CTRL+SHIFT+f to scroll backwards in description
--         ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
--         -- CTRL+F to scroll forwards in the description
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         -- CTRL+SPACE to bring up completion at current Cursor location
--         ['<C-Space>'] = cmp.mapping.complete(),
--         -- CTRL+e to exit suggestion and close it
--         ['<C-e>'] = cmp.mapping.close(),
--         -- CR (enter or return) to CONFIRM the currently selection suggestion
--         -- We set the ConfirmBehavior to insert the Selected suggestion
--         ['<CR>'] = cmp.mapping.confirm({ select = false }),
--     },
--     matching = {
--       disallow_fuzzy_matching = false,
--       disallow_fullfuzzy_matching = false,
--       disallow_partial_fuzzy_matching = false,
--       disallow_partial_matching = false,
--       disallow_prefix_unmatching = false,
--       disallow_symbol_nonprefix_matching = true,
--     },
--     window = {
--         completion = cmp.config.window.bordered({
--             winhighlight="CursorLine:Visual",
--         }),
--         documentation = cmp.config.window.bordered(),
--     },
--     formatting = {
--         format = require("lspkind").cmp_format({
--             mode = 'symbol_text', -- show only symbol annotations
--             maxwidth = {
--                 -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--                 -- can also be a function to dynamically calculate max width such as
--                 -- menu = function() return math.floor(0.45 * vim.o.columns) end,
--                 menu = 50,      -- leading text (labelDetails)
--                 abbr = 50,      -- actual suggestion item
--             },
--             ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
--             show_labelDetails = true, -- show labelDetails in menu. Disabled by default
--
--             -- The function below will be called before any actual modifications from lspkind
--             -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
--             before = function(entry, vim_item)
--                 -- ...
--                 return vim_item
--             end
--         })
--     }
--     -- formatting = {
--     --     fields = { "kind", "abbr", "menu" },
--     --     format = function(entry, vim_item)
--     --         local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
--     --         local strings = vim.split(kind.kind, "%s", { trimempty = true })
--     --         kind.kind = " " .. (strings[1] or "") .. " "
--     --         kind.menu = "    (" .. (strings[2] or "") .. ")"
--     --
--     --         return kind
--     --     end,
--     -- },
-- })

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })


vim.lsp.enable('rust_analyzer')
