return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-mini/mini.pick",
  },
  config = function()
    local neogit = require('neogit')
    local keymaps = require("nihilc.keymaps")
    local autocmd = require("nihilc.autocmd")
    neogit.setup({
      disable_hint = true,
      floating = {
        style = "minimal",
        border = "single",
      },
    })
    keymaps.set({
      { desc = "Git Open", lhs = "<leader>gg", rhs = neogit.open }
    })
  end
}
