-- Theme
vim.cmd [[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.cmd [[colorscheme tokyonight]]

-- Nvim-tree
require('nvim-tree').setup()
-- Mason
require('mason').setup()
-- Git signs
require('gitsigns').setup()

-- Autopairs
require('nvim-autopairs').setup()
-- Autotag
require('nvim-ts-autotag').setup()
-- Comment
require('Comment').setup()
-- Colorizer
require('colorizer').setup()
