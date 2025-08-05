return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter'},
    config = function() 
        local builtin = require('telescope.builtin')
        local themes = require('telescope.themes')
        function ivy(outer)
            function inner()
                outer(themes.get_ivy())
            end
            return inner
        end
        function cursor(outer)
            function inner()
                outer(themes.get_cursor())
            end
            return inner
        end
        vim.keymap.set('n', '<leader>p', ivy(builtin.find_files), { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>g', ivy(builtin.live_grep), { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', ivy(builtin.buffers), { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>ff', ivy(builtin.grep_string), { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', ivy(builtin.help_tags), { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>;', ivy(builtin.colorscheme), { desc = 'Telescope help tags' })

        local opts = { silent = true }

        vim.keymap.set('n', 'gD', cursor(builtin.lsp_type_definitions), opts)
        vim.keymap.set('n', 'gd', cursor(builtin.lsp_definitions), opts)
        vim.keymap.set('n', 'gi', cursor(builtin.lsp_implementations), opts)
        vim.keymap.set('n', 'gr', cursor(builtin.lsp_references), opts)

        vim.keymap.set('n', 'T', ivy(builtin.diagnostics), {silent=true})
    end
}

