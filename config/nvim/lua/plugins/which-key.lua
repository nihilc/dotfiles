return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      preset = "helix",
      win = { border = vim.o.winborder },
      icons = { mappings = false },
      show_help = false,
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "help" },
        { "<leader>t", group = "typst" },
        { "<leader>s", group = "session" },
        { "<leader>u", group = "ui" },
      },
    })

    vim.keymap.set("n", "<leader>?", function()
      require("which-key").show({ global = false })
    end, { desc = "Buffer Local Keymaps (which-key)" })
  end,
}
