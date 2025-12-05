return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>f", group = "find", mode = { "n", "v" } },
      { "<leader>g", group = "git", mode = { "n", "v" } },
      { "<leader>h", group = "help" },
      { "<leader>l", group = "lsp" },
      { "<leader>t", group = "typst" },
      { "<leader>u", group = "ui" },
      { "<leader>s", group = "session" },
    },
    win = {
      border = "single",
    },
    icons = {
      mappings = false,
    },
    show_help = false,
    show_keys = false,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
