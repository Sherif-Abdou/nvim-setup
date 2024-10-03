vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 2
vim.opt.foldnestmax = 8

require('leap').create_default_mappings()

vim.cmd('colorscheme tokyonight-storm')
vim.cmd('set number')
vim.cmd('set relativenumber')

local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option_value('background', 'dark', {})
		-- vim.cmd('colorscheme gruvbox')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option_value('background', 'light', {})
        vim.cmd('colorscheme tokyonight-day')
		-- vim.cmd('colorscheme gruvbox')
	end,
})

