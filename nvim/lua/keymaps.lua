local g = vim.g
local map = vim.keymap.set
local opts = { noremap=true, silent=true }


---- General
-- Map leader key space
g.mapleader = ' '
-- Control s to save
map('n', '<C-s>', ':w<cr>', opts)
-- Manage buffers
map('n', '<Tab>', ':bnext<cr>', opts)
map('n', '<S-Tab>', ':bprevious<cr>', opts)
map('n', '<leader>bc', ':bdelete<cr>', opts)
map('n', '<leader>bn', ':new<cr>', opts)
-- Alt h,j,k,l to move (insert mode)
map('i', '<M-h>', '<left>', opts)
map('i', '<M-j>', '<down>', opts)
map('i', '<M-k>', '<up>', opts)
map('i', '<M-l>', '<right>', opts)
-- Control h,j,k,l to between in windows
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
-- Clear highlight search
map('n', '<Esc>', '<cmd>nohlsearch<cr>', opts)


---- Telescope
-- find
map('n', '<leader>ff', ':Telescope find_files<cr>', opts)
map('n', '<leader>fa', ':Telescope find_files hidden=true<cr>', opts)
map('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
map('n', '<leader>fb', ':Telescope buffers<cr>', opts)
-- help
map('n', '<leader>th', ':Telescope help_tags<cr>', opts)
map('n', '<leader>tk', ':Telescope keymaps<cr>', opts)
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

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
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

  map('n', '<leader>aa', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>an', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>af', vim.lsp.buf.formatting, bufopts)
end


-- Cmp
-- function cmp_keymap(cmp)
--   return {
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-u>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.close(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true })
--   }
-- end
