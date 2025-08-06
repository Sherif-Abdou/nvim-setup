return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config = function()
      require('oil').setup({
          keymaps = {
              ["<ESC>"] = { "actions.close", mode = "n" },
          }
      })
      vim.keymap.set('n', 't', function() require('oil').toggle_float(nil) end, {silent=true})
  end
}
