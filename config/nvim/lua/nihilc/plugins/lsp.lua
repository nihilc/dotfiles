return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
    },
    "nvim-mini/mini.extra",
  },
  config = function()
    local servers = {
      -- Languages
      "bashls",
      "lua_ls",
      "tinymist",
      "pyright",
      "gopls",
      -- Web
      "ts_ls",
      "html",
      "cssls",
      "jsonls",
      -- Docs
      "marksman",
    }

    -- Install servers
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_enable = false,
    })
    -- Configure servers
    vim.lsp.config("*", {
      capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      ),
    })
    -- Enable servers
    vim.lsp.enable(servers)

    -- Keymaps
    local autocmd = require("nihilc.autocmd")
    local keymaps = require("nihilc.keymaps")
    autocmd.create("LspAttach", {
      desc = "Lsp keymaps",
      callback = function(e)
        local keys = {
          {
            desc = "Next Diagnostic",
            lhs = "]d",
            rhs = function()
              vim.diagnostic.jump({ count = 1, float = true })
            end,
          },
          {
            desc = "Prev Diagnostic",
            lhs = "[d",
            rhs = function()
              vim.diagnostic.jump({ count = -1, float = true })
            end,
          },
          { desc = "Hover Symbol", lhs = "K", rhs = vim.lsp.buf.hover },
          { desc = "Go Definition", lhs = "gd", rhs = vim.lsp.buf.definition },
          { desc = "Go Declaration", lhs = "gD", rhs = vim.lsp.buf.declaration },
          { desc = "Go References", lhs = "gr", rhs = vim.lsp.buf.references },
          {
            desc = "Go References (mini.pick)",
            lhs = "gR",
            rhs = function()
              MiniExtra.pickers.lsp({ scope = "references" })
            end,
          },
          { desc = "Go Implementation", lhs = "gi", rhs = vim.lsp.buf.implementation },
          {
            desc = "Go Implementation (mini.pick)",
            lhs = "gI",
            rhs = function()
              MiniExtra.pickers.lsp({ scope = "implementation" })
            end,
          },
          { desc = "Lsp Rename", lhs = "<leader>lr", rhs = vim.lsp.buf.rename },
          { desc = "Lsp Code Action", lhs = "<leader>la", rhs = vim.lsp.buf.code_action },
          { desc = "Lsp Diagnostics", lhs = "<leader>ld", rhs = vim.diagnostic.open_float },
        }
        for _, key in pairs(keys) do
          key.opts = key.opts or { buffer = e.buf }
        end
        keymaps.set(keys)
      end,
    })
  end,
}
