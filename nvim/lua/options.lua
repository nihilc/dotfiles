local o = vim.opt

-- General
o.encoding       = 'utf-8'        -- Use UTF-8
o.fileencoding   = 'utf-8'        -- Use UTF-8
o.clipboard   = 'unnamedplus'     -- Use '+' register for clipboard
o.matchpairs  = '(:),{:},[:],<:>' -- Characters that form pairs

-- Indentation
o.tabstop     = 2     -- Number of visual spaces per tab
o.softtabstop = 2     -- Number of spaces in tab
o.shiftwidth  = 2     -- Indent width
o.expandtab   = true  -- Use spaces for tabs
o.shiftround  = true  -- Round indents to specified indent width
o.breakindent = true  -- Preserve indentation for wrapped lines
o.smartindent = true

-- Search
o.incsearch  = true   -- Enable incremental search
o.hlsearch   = true   -- Highlight search matches
o.ignorecase = true   -- Case-insensitive search by default
o.smartcase  = true   -- Switch to case-sensitive search if there's capital letter

-- UI
o.number          = true  -- Show line numbers
o.relativenumber  = true  -- Show relative line numbers
o.cursorline      = true  -- Highlight cursor line
o.showcmd         = true  -- Show command at the bottom
o.showmode        = false -- Don't show mode
o.ruler           = false -- Don't Show cursor position
o.laststatus      = 2     -- Always show status
o.showtabline     = 2     -- Always show tabline
o.scrolloff       = 4     -- Add lines above and below the cursor
o.splitbelow      = true  -- Horizontal split to the bottom
o.splitright      = true  -- Vertical split to the right 
o.pumheight       = 15    -- Menu height
o.completeopt     = 'menuone,noselect,noinsert'
