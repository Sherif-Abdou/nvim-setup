return {
    {
        'Shatur/neovim-ayu'
    },
    {
        "everviolet/nvim"
    },
    {
        "ribru17/bamboo.nvim"
    },
    {
        'catppuccin/nvim'
    },
    {
        "vague2k/vague.nvim",
    },
    {
        'everviolet/nvim',
        name = 'evergarden',
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        opts = {
            theme = {
                variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
                accent = 'green',
            },
            editor = {
                transparent_background = false,
                sign = { color = 'none' },
                float = {
                    color = 'mantle',
                    solid_border = false,
                },
                completion = {
                    color = 'surface0',
                },
            },
        }
    },
    {
        "dgox16/oldworld.nvim",
        lazy = false,
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nordic').load()
        end
    },
    {
        'maxmx03/solarized.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        'maxmx03/fluoromachine.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local fm = require 'fluoromachine'

            fm.setup {
                glow = false,
                theme = 'delta',
                -- theme = 'retrowave',
                -- theme = 'fluoromachine',
                -- transparent = true,
            }
        end
    }
}
