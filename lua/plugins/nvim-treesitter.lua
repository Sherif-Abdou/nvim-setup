return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'c', 'rust', 'lua', 'cpp', 'java', 'go', 'elixir', 'markdown', 'markdown_inline' },
            callback = function()
                vim.treesitter.start()
                vim.cmd('set foldmethod=expr')
                vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
