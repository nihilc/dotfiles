local M = {}

M.group = vim.api.nvim_create_augroup("nihilc", {})
M.create = vim.api.nvim_create_autocmd

M.create("TextYankPost", {
  desc = "Highlight when yanking text",
  group = M.group,
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

M.create("BufWritePre", {
  desc = "Remove white spaces before save",
  group = M.group,
  command = "%s/\\s\\+$//e",
})

M.create("TermOpen", {
  desc = "Start terminal in insert mode",
  group = M.group,
  command = "startinsert | set winfixheight | setlocal nospell",
})

return M
