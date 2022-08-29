local present, lspconfig = pcall(require, 'lspconfig')

if not present then
  return
end

---- Setup servers
-- Html
lspconfig.html.setup { on_attach = lsp_keymap }
-- Css
lspconfig.cssls.setup { on_attach = lsp_keymap }
-- Php
lspconfig.intelephense.setup { on_attach = lsp_keymap }
-- Lua
lspconfig.sumneko_lua.setup { on_attach = lsp_keymap,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}
-- C and C++
lspconfig.clangd.setup { on_attach = lsp_keymap }


---- Diagnostic icons
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({ virtual_text = { prefix = '●' } })
