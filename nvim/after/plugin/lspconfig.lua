local present, lspconfig = pcall(require, 'lspconfig')

if not present then
  return
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

---- Setup servers
-- Html
lspconfig.html.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
  filetypes = { 'html', 'php'}
}
-- Css
lspconfig.cssls.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
}
-- Php
lspconfig.phpactor.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  }
}

-- Lua
lspconfig.sumneko_lua.setup {
  on_attach = lsp_keymap,
  capabilities = capabilities,
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
}


---- Diagnostic icons
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({ virtual_text = { prefix = '●' } })
