return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "nvim-mini/mini.nvim",
  },
  config = function()
    require("blink-cmp").setup({
      keymap = { preset = "default" },
      signature = { enabled = true },
      completion = {
        documentation = { auto_show = true },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    })
  end,
}
