-- General
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

-- UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "0"
vim.o.cursorline = true
vim.o.laststatus = 3
vim.o.showmode = false
vim.o.pumheight = 10
vim.o.winborder = "single"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 8
vim.o.list = false
vim.o.wrap = false
vim.o.breakindent = true
vim.o.breakindentopt = "list:-1"
vim.o.linebreak = true

-- Editing
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.inccommand = "split"

-- Speeling
vim.o.spell = true
vim.o.spelllang = "en,es"
vim.o.spelloptions = "camel"

-- Others
vim.g.markdown_recommended_style = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

-- Autocmd
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Start terminal in insert mode, and disable spell",
  command = "startinsert | set winfixheight | setlocal nospell",
})
