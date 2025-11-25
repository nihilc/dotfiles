local M = {}

--- Add new mappings
---@param keymaps { desc: string, lhs: string, rhs: string|function, mode?: string|string[], opts?: vim.keymap.set.Opts}[]
--- - if not mode specified use "n"
--- - if not opts specified use { noremap = true, silent = true, nowait = true}
M.set = function(keymaps)
  for _, keymap in pairs(keymaps) do
    local mode = keymap.mode or "n"
    local opts = keymap.opts or { noremap = true, silent = true, nowait = true }
    opts.desc = keymap.desc
    vim.keymap.set(mode, keymap.lhs, keymap.rhs, opts)
  end
end

M.set({
  -- General
  { mode = "n", lhs = "<esc>", rhs = "<cmd>nohlsearch<cr>", desc = "Clear search highlight" },
  { mode = { "n", "i" }, lhs = "<c-s>", rhs = "<cmd>w<cr>", desc = "Save File" },
  { mode = "t", lhs = "<esc><esc>", rhs = "<C-\\><C-n>", desc = "Exit terminal mode" },
  -- Navigation
  { mode = "n", lhs = "j", rhs = "gj", desc = "Move down" },
  { mode = "n", lhs = "k", rhs = "gk", desc = "Move up" },
  { mode = "i", lhs = "<c-h>", rhs = "<left>", desc = "Move left" },
  { mode = "i", lhs = "<c-l>", rhs = "<right>", desc = "Move right" },
  { mode = "i", lhs = "<c-j>", rhs = "<down>", desc = "Move down" },
  { mode = "i", lhs = "<c-k>", rhs = "<up>", desc = "Move up" },
  { mode = "n", lhs = "<c-h>", rhs = "<c-w><c-h>", desc = "Move focus to the left window" },
  { mode = "n", lhs = "<c-l>", rhs = "<c-w><c-l>", desc = "Move focus to the right window" },
  { mode = "n", lhs = "<c-j>", rhs = "<c-w><c-j>", desc = "Move focus to the lower window" },
  { mode = "n", lhs = "<c-k>", rhs = "<c-w><c-k>", desc = "Move focus to the upper window" },
  { mode = "n", lhs = "<c-d>", rhs = "<c-d>zz", desc = "keep screen centered when <c-d>" },
  { mode = "n", lhs = "<c-u>", rhs = "<c-u>zz", desc = "keep screen centered when <c-u>" },
  { mode = "n", lhs = "n", rhs = "nzzzv", desc = "keep screen centered when jump next" },
  { mode = "n", lhs = "N", rhs = "Nzzzv", desc = "keep screen centered when jump prev" },
  -- Edition
  { mode = "v", lhs = "J", rhs = ":m '>+1<CR>gv=gv", desc = "Move selected lines down" },
  { mode = "v", lhs = "K", rhs = ":m '<-2<CR>gv=gv", desc = "Move selected lines up" },
  -- UI
  { mode = "n", lhs = "<leader>uw", rhs = "<cmd>set wrap!<cr>", desc = "UI Toggle wrap" },
  { mode = "n", lhs = "<leader>ul", rhs = "<cmd>set list!<cr>", desc = "UI Toggle list" },
})

return M
