return {
  "stevearc/conform.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        -- Languages
        sh = { "shfmt" },
        lua = { "stylua" },
        python = { "black" },
        typst = { "typstyle" },
        -- Web
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        -- Docs
        markdown = { "prettier" },
      },
    })

    vim.keymap.set("n", "<leader>F", function()
      conform.format({ lsp_format = "fallback" })
    end, { desc = "Format Conform/Lsp" })
  end,
}
