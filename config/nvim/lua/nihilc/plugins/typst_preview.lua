return {
  "chomosuke/typst-preview.nvim",
  lazy = false,
  version = "1.*",
  config = function()
    local tp = require("typst-preview")
    local keymaps = require("nihilc.keymaps")
    local autocmd = require("nihilc.autocmd")

    tp.setup({
      open_cmd = "flatpak run app.zen_browser.zen %s -P typst-preview > /dev/null 2>&1",
    })

    autocmd.create("FileType", {
      pattern = "typst",
      callback = function()
        keymaps.set({
          { lhs = "<leader>tp", rhs = "<cmd>TypstPreviewToggle<cr>", desc = "Typst Preview" },
          { lhs = "<leader>ts", rhs = "<cmd>TypstPreviewSyncCursor<cr>", desc = "Typst Sync" },
          { lhs = "<leader>tc", rhs = "<cmd>LspTinymistExportPdf<cr>", desc = "Typst Export" },
        })
      end,
    })
  end,
}
