vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }

vim.opt.shortmess = vim.opt.shortmess + { c = true }

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'vsnip' },
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
    },
    mapping = {
        -- Shift+TAB to go to the Previous Suggested item
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        -- Tab to go to the next suggestion
        ['<Tab>'] = cmp.mapping.select_next_item(),
        -- CTRL+SHIFT+f to scroll backwards in description
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        -- CTRL+F to scroll forwards in the description
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- CTRL+SPACE to bring up completion at current Cursor location
        ['<C-Space>'] = cmp.mapping.complete(),
        -- CTRL+e to exit suggestion and close it
        ['<C-e>'] = cmp.mapping.close(),
        -- CR (enter or return) to CONFIRM the currently selection suggestion
        -- We set the ConfirmBehavior to insert the Selected suggestion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

