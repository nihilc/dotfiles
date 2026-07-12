return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "saghen/blink.cmp",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
    },
  },
  config = function()
    require("mason").setup()

    local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
    vim.lsp.config("*", { capabilities = capabilities })
    vim.lsp.enable({
      -- Languages
      "lua_ls",
      "bashls",
      "gopls",
      -- Math
      "tinymist",
      -- Web
      "ts_ls",
      "jsonls",
      "html",
      "cssls",
    })

    vim.diagnostic.config({
      jump = {
        on_jump = function()
          vim.diagnostic.open_float({ focus = false })
        end,
      },
    })

    -- Lsp keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "Lsp Keymaps",
      callback = function(e)
        -- Language specific keymaps
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if client and client.name == "tinymist" then
          vim.keymap.set("n", "<leader>te", "<cmd>LspTinymistExportPdf<cr>", { desc = "Tinymist Export PDF" })
          vim.keymap.set("n", "<leader>tm", "<cmd>LspTinymistPinMain<cr>", { desc = "Tinymist Pin Main" })
        end
      end,
    })
  end,
}
