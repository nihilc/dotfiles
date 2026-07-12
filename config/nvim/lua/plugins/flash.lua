return {
  "folke/flash.nvim",
  config = function()
    local flash = require("flash")
    flash.setup({
      modes = {
        char = {
          highlight = { backdrop = false },
        },
      },
    })

    vim.keymap.set({ "n", "x", "o" }, "<leader>j", flash.jump, { desc = "Flash" })
    vim.keymap.set({ "n", "x", "o" }, "<leader>J", flash.treesitter, { desc = "Flash Treesitter" })
    --Incremental Selection
    vim.keymap.set({ "n", "x", "o" }, "<c-space>", function()
      require("flash").treesitter({
        labels = "",
        actions = {
          ["<c-j>"] = "next",
          ["<c-k>"] = "prev",
        },
      })
    end, { desc = "Incremental selection" })
  end,
}
