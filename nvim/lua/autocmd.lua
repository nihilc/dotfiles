-- Highlight yanked text
local hl_yank_grp = vim.api.nvim_create_augroup('hl_yank_grp', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', { group = hl_yank_grp, callback = function ()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 500 })
end })
