vim.opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}

vim.opt.shortmess = vim.opt.shortmess + { c =true}

local cmp = require('cmp')
cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua' },
		{ name = 'buffer'  },
		{ name = 'vsnip'},
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
    		['<CR>'] = cmp.mapping.confirm({
      			behavior = cmp.ConfirmBehavior.Insert,
      			select = true,
    		})
	}
})
