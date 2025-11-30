return {
  "stevearc/conform.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local conform = require("conform")
    local keymaps = require("nihilc.keymaps")

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

    keymaps.set({
      {
        desc = "Lsp/Conform Format",
        lhs = "<leader>lf",
        rhs = function()
          conform.format({ lsp_format = "fallback" })
        end,
      },
    })
  end,
}
