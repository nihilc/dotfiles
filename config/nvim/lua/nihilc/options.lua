-- stylua: ignore start
-- General ====================================================================
vim.g.mapleader      = " "           -- Use `<space>` as <Leader> key
vim.g.maplocalleader = " "           -- Use <space> al local <leader> key
vim.o.clipboard      = "unnamedplus" -- Use '+' register for clipboard
vim.o.termguicolors  = true          -- True color support
vim.o.undofile       = true          -- Save undo file
vim.o.undolevels     = 10000         -- number of changes to undo
vim.o.timeout        = true          -- wait for a mapped sequence
vim.o.timeoutlen     = 500           -- time to wait for a mapped sequence

-- UI =========================================================================
vim.o.number         = true      -- Show line numbers
vim.o.relativenumber = true      -- Show line realtive numbers
vim.o.signcolumn     = 'yes'     -- Always show signcolumn (less flicker)
vim.o.colorcolumn    = '80'      -- Draw column on the right of maximum width
vim.o.cursorline     = true      -- Enable current line highlighting
vim.o.laststatus     = 3         -- always show status line and only one
vim.o.ruler          = true      -- Show cursor coordinates
vim.o.showmode       = false     -- Don't show mode in command line
vim.o.pumheight      = 10        -- Make popup menu smaller
vim.o.pumblend       = 0         -- pop-up transparency 0-100
vim.o.winborder      = 'single'  -- Use border in floating windows
vim.o.splitkeep      = 'cursor'  -- 'screen' Reduce scroll during window split
vim.o.splitbelow     = true      -- Horizontal splits will be below
vim.o.splitright     = true      -- Vertical splits will be to the right
vim.o.scrolloff      = 8         -- lines of context vertical
vim.o.sidescrolloff  = 8         -- lines of context horizontal
vim.o.list           = false     -- Don't show helpful text indicators
vim.o.wrap           = true      -- Visually wrap lines
vim.o.breakindent    = true      -- Indent wrapped lines to match line start
vim.o.breakindentopt = 'list:-1' -- Add padding for lists (if 'wrap' is set)
vim.o.linebreak      = true      -- Wrap lines at 'breakat' (if 'wrap' is set)

-- Editing ====================================================================
vim.o.autoindent    = true    -- Use auto indent
vim.o.expandtab     = true    -- Convert tabs to spaces
vim.o.tabstop       = 2       -- Show tab as this number of spaces
vim.o.shiftwidth    = 2       -- Use this number of spaces for indentation
vim.o.ignorecase    = true    -- Ignore case during search
vim.o.incsearch     = true    -- Show search matches while typing
vim.o.smartcase     = true    -- Respect case if search pattern has upper case
vim.o.smartindent   = true    -- Make indenting smart
vim.o.infercase     = true    -- Infer case in built-in completion
vim.o.formatoptions = 'rqnl1j'-- Improve comment editing
vim.o.virtualedit   = 'block' -- Allow going past end of line in blockwise mode
-- Spelling
vim.o.spell         = true    -- Enable spelling
vim.o.spelllang     = 'en,es' -- Set spell languages
vim.o.spelloptions  = 'camel' -- Treat camelCase word parts as separate words
-- Built-in completion
vim.o.complete      = '.,w,b,kspell'                  -- Use less sources
vim.o.completeopt   = 'menuone,noselect,fuzzy,nosort' -- Use custom behavior

-- Others =====================================================================
-- Disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-- stylua: ignore end
