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
    use 'hrsh7th/vim-vsnip'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-lua/plenary.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'nvim-telescope/telescope.nvim'
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
    use {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.3',
        config = function()
            require('distant'):setup()
        end
    }
    use 'rebelot/kanagawa.nvim'
    use 'Yazeed1s/minimal.nvim'
    use {
        "tiagovla/tokyodark.nvim",
        opts = {
            -- custom options here
        },
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
        end,
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-tree/nvim-web-devicons'
    use {
        'folke/trouble.nvim',
        opts = {
            icons = false
        },
    }
    use 'nyoom-engineering/oxocarbon.nvim'
    use 'savq/melange-nvim'
    use 'tikhomirov/vim-glsl'
    use 'p00f/clangd_extensions.nvim'
    use {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        lazy = false, -- This plugin is already lazy
    }
        use {
            "folke/zen-mode.nvim",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
end)
