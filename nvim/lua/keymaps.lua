local g = vim.g
local map = vim.keymap.set
local opts = { noremap = true, silent = true }


---- General
-- Map leader key space
g.mapleader = ' '
-- Control s to save
map('n', '<C-s>', ':w<cr>', opts)
map('i', '<C-s>', '<Esc>:w<cr>', opts)
-- Manage buffers
map('n', '<Tab>', ':bnext<cr>', opts)
map('n', '<S-Tab>', ':bprevious<cr>', opts)
map('n', '<leader>bc', ':bdelete<cr>', opts)
map('n', '<leader>bn', ':new<cr>', opts)
-- Alt h,j,k,l to move (insert mode)
map('i', '<C-h>', '<left>', opts)
map('i', '<C-j>', '<down>', opts)
map('i', '<C-k>', '<up>', opts)
map('i', '<C-l>', '<right>', opts)
-- Control h,j,k,l to between in windows
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
-- Clear highlight search
map('n', '<Esc>', '<cmd>nohlsearch<cr>', opts)

-- Emmet
g.user_emmet_leader_key = '<M-m>'

---- Telescope
-- find
map('n', '<leader>ff', ':Telescope find_files<cr>', opts)
map('n', '<leader>fa', ':Telescope find_files hidden=true<cr>', opts)
map('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
map('n', '<leader>fb', ':Telescope buffers<cr>', opts)
-- help
map('n', '<leader>th', ':Telescope help_tags<cr>', opts)
map('n', '<leader>tk', ':Telescope keymaps<cr>', opts)
map('n', '<leader>tt', ':Telescope colorscheme<cr>', opts)
-- git
map('n', '<leader>gt', ':Telescope git_status<cr>', opts)
map('n', '<leader>gc', ':Telescope git_commits<cr>', opts)
map('n', '<leader>gf', ':Telescope git_files<cr>', opts)


-- Nvtree
map('n', '<leader>et', ':NvimTreeToggle<cr>', opts)
map('n', '<leader>ee', ':NvimTreeFocus<cr>', opts)


-- LSP
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)

function lsp_keymap(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.opt_local.signcolumn = 'yes'

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local telescope = require('telescope.builtin')

  map('n', 'gd', telescope.lsp_definitions, bufopts)
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', '<M-k>', vim.lsp.buf.signature_help, bufopts)

  map('n', '<leader>li', telescope.lsp_implementations, bufopts)
  map('n', '<leader>lr', telescope.lsp_references, bufopts)
  map('n', '<leader>ls', telescope.lsp_document_symbols, bufopts)
  map('n', '<leader>lS', telescope.lsp_workspace_symbols, bufopts)
  map('n', '<leader>ll', telescope.diagnostics, bufopts)

  map('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>ln', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
end

-- Cmp
function cmp_keymap(cmp)
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  local luasnip = require("luasnip")

  return {
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),

    ["<C-n>"] = require('cmp').mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-p>"] = require('cmp').mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end
