return {
  "NeogitOrg/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
    "nvim-mini/mini.nvim",
  },
  config = function()
    local Neogit = require("neogit")
    Neogit.setup({
      disable_hint = true,
    })

    vim.keymap.set("n", "<leader>gg", Neogit.open, { desc = "Git Open" })
  end,
}
