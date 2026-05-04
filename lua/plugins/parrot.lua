
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
            "gemma-3-4b-it-qat",
          }
        },
      },
    }
    vim.keymap.set("n", "gai", "<cmd>PrtImplement<cr>", { noremap = true, silent = true});
    vim.keymap.set("v", "gai", ":PrtImplement<cr>", { noremap = true, silent = true});
    vim.keymap.set("n", "gar", "<cmd>PrtRewrite<cr>", { noremap = true, silent = true});
    vim.keymap.set("v", "gar", ":PrtRewrite<cr>", { noremap = true, silent = true});
    vim.keymap.set({"n", "v"}, "gaa", ":PrtAsk<cr>", { noremap = true, silent = true});
    vim.keymap.set({"n", "v"}, "gac", "<cmd>PrtChatToggle<cr>", { noremap = true, silent = true});
    vim.keymap.set({"n", "v"}, "gad", "<cmd>PrtChatDelete<cr>", { noremap = true, silent = true});
  end,
}
