vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('lualine').setup({
})
require('nvim-tree').setup({
	-- open_on_setup = true,
--	ignore_buffer_on_setup = true,
})
