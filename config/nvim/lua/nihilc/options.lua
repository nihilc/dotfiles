-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- General
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true -- true color support
vim.o.ignorecase = true -- ignore case in search
vim.o.smartcase = true -- Override ignore case if search has upper case
vim.o.undofile = true -- Save undo file
vim.o.undolevels = 10000 -- number of changes to undo
vim.o.timeout = true -- wait for a mapped sequence
vim.o.timeoutlen = 500 -- time to wait for a mapped sequence to complete.
-- Status line
vim.o.laststatus = 3 -- always show status line and only one
vim.o.ruler = true -- show line and column number of cursor
vim.o.showmode = false -- show mode
-- Editor
vim.o.cursorline = true -- highlights cursor line
vim.o.colorcolumn = "80" -- highlights column 80
vim.o.signcolumn = "yes" -- always show sign column
vim.o.number = true -- line number
vim.o.numberwidth = 2 -- line number width
vim.o.relativenumber = true -- line relative number
vim.o.scrolloff = 8 -- lines of context vertical
vim.o.sidescrolloff = 8 -- lines of context horizontal
vim.o.splitright = true -- new windows below current
vim.o.splitbelow = true -- new windows right of current
vim.o.pumheight = 10 -- pop-up height
vim.o.pumblend = 0 -- pop-up transparency 0-100
vim.o.wrap = true -- line wrap
vim.o.breakindent = true -- wrapped lines continue visually indent
-- Indentation
vim.o.smartindent = true -- smart indent on new line
vim.o.expandtab = true -- use spaces instead of tabs
vim.o.shiftround = true -- round indent
vim.o.shiftwidth = 2 -- indent size
vim.o.tabstop = 2 -- indent size
vim.o.softtabstop = 2 -- indent size
-- Spell
vim.o.spell = true -- enable spell
vim.o.spelloptions = "camel" -- fix camelCase spell
vim.o.spelllang = "en,es" -- Spell languages
-- Folding
vim.o.foldmethod = "manual" -- Use manual to fold
