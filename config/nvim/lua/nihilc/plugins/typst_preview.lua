return {
  "chomosuke/typst-preview.nvim",
  lazy = false,
  version = "1.*",
  config = function()
    local tp = require("typst-preview")
    local keymaps = require("nihilc.keymaps")

    tp.setup({
      open_cmd = "zen-browser %s -P typst-preview"
    })

    keymaps.set({
      { lhs = "<leader>tp", rhs = "<cmd>TypstPreviewToggle<cr>", desc = "Typst Preview" },
      { lhs = "<leader>ts", rhs = "<cmd>TypstPreviewSyncCursor<cr>", desc = "Typst Sync" },
      { lhs = "<leader>tc", rhs = "<cmd>!typst compile %<cr>", desc = "Typst Compile" },
    })
  end,
}
