
return {
  "frankroeder/parrot.nvim",
  dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
  -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require("parrot").setup {
      -- Providers must be explicitly set up to make them available.
      providers = {
        openai = {
          name = "openai",
          api_key = "fortnite",
          endpoint = "http://127.0.0.1:9090/v1/chat/completions",
          params = {
            chat = { temperature = 1.1, top_p = 1 },
            command = { temperature = 1.1, top_p = 1 },
          },
          models ={
            "qwen2.5-coder-3b",
            "gemma-3-4b-it",
          }
        },
      },
    }
    vim.keymap.set({"n", "v"}, "gai", "<cmd>PrtImplement<cr>", { noremap = true, silent = true});
    vim.keymap.set({"n", "v"}, "gar", "<cmd>PrtRewrite<cr>", { noremap = true, silent = true});
    vim.keymap.set({"n", "v"}, "gac", "<cmd>PrtChatToggle<cr>", { noremap = true, silent = true});
  end,
}
