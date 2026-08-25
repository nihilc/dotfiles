return {
  "chomosuke/typst-preview.nvim",
  version = "1.*",
  config = function()
    require("typst-preview").setup({
      open_cmd = "flatpak run app.zen_browser.zen %s -P typst-preview > /dev/null 2>&1",
      -- dependencies_bin = { tinymist = "tinymist" },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "typst",
      callback = function()
        vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreviewToggle<cr>", { desc = "Typst Preview" })
        vim.keymap.set("n", "<leader>ts", "<cmd>TypstPreviewSyncCursor<cr>", { desc = "Typst Preview Sync" })
      end,
    })
  end,
}
