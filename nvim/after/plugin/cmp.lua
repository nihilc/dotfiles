local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local lspkind = require("lspkind")
local luasnip = require("luasnip")

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

  mapping = {
    ["<C-d>"] = require('cmp').mapping.scroll_docs(-4),
    ["<C-f>"] = require('cmp').mapping.scroll_docs(4),
    ["<C-e>"] = require('cmp').mapping.abort(),
    ['<C-y>'] = require('cmp').mapping.confirm({ select = true }),
    ["<c-space>"] = require('cmp').mapping.complete(),

    ["<C-n>"] = require('cmp').mapping(function(fallback)
      if require('cmp').visible() then
        require('cmp').select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        require('cmp').complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-p>"] = require('cmp').mapping(function(fallback)
      if require('cmp').visible() then
        require('cmp').select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

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
