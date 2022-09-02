local present, lspconfig = pcall(require, 'lspconfig')

if not present then
  return
end

---- Diagnostic icons
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({ virtual_text = { prefix = '●' } })
---- Botders
local border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}
---- Autocomplete
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

---- Setup servers
-- Html
lspconfig.html.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
  handlers = handlers,
  filetypes = { 'html', 'php' }
}
-- Css
lspconfig.cssls.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
  handlers = handlers,
}
-- Php
lspconfig.intelephense.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
  handlers = handlers,
}
-- Lua
lspconfig.sumneko_lua.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
  handlers = handlers,
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
lspconfig.clangd.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
  handlers = handlers,
}
