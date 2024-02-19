return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' 
    	use 'hrsh7th/cmp-nvim-lsp'
    	use 'hrsh7th/cmp-nvim-lua'
    	use 'hrsh7th/cmp-nvim-lsp-signature-help'
    	use 'hrsh7th/cmp-vsnip'                             
    	use 'hrsh7th/cmp-path'                              
    	use 'hrsh7th/cmp-buffer'                          
    	-- use 'hrsh7th/vim-vsnip'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-lua/plenary.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use {'nvim-telescope/telescope.nvim', tag = '0.1.1',}
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use {
    		'numToStr/Comment.nvim',
    		config = function()
        		require('Comment').setup()
    		end
	}
	use 'mfussenegger/nvim-dap'
end)
