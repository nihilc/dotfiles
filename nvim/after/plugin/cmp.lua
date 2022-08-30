local cmp = require('cmp')
local lspkind = require("lspkind")

-- Change borders of menu
local function border(hl_name)
  return {
    { "┌", hl_name },
    { "─", hl_name },
    { "┐", hl_name },
    { "│", hl_name },
    { "┘", hl_name },
    { "─", hl_name },
    { "└", hl_name },
    { "│", hl_name },
  }
end
local cmp_window = require "cmp.utils.window"
cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
  local info = self:info_()
  info.scrollable = false
  return info
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  sources = require('cmp').config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer',
      keyword_length = 4 },
  }),

  mapping = cmp_keymap(cmp),

  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        buffer = "[buf]",
        luasnip = "[snip]",
      },
    }),
  },

  experimental = {
    native_menu = false,

    ghost_text = true,
  },

  window = {
    completion = {
      border = border "CmpBorder",
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = border "CmpDocBorder",
    },
  },
})
