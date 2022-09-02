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
local servers = {
  'clangd',       -- C, C++
  'pyright',      -- Python
  'bashls',       -- Bash
  'intelephense', -- Php
  'cssls',        -- Css
}
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = lsp_keymap,
    capabilities = capabilities,
    handlers = handlers,
  }
end
---- With some Specifications
-- Html
lspconfig.html.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
  handlers = handlers,
  filetypes = { 'html', 'php' }
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
