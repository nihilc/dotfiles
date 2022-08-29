local packer = require('packer')

packer.startup({
  function(use)
    ---- Packer ----
    use 'wbthomason/packer.nvim'

    ---- UI ----
    -- Theme
    use 'folke/tokyonight.nvim'
    -- Lualine
    use 'nvim-lualine/lualine.nvim'
    -- bufferline
    use { 'akinsho/bufferline.nvim',
      tag = 'v2.*'
    }

    ---- File manager, picker ----
    -- Nvim-tree
    use 'kyazdani42/nvim-tree.lua'
    -- Telescope
    use { 'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
      }
    }

    ---- Highlight ----
    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    -- Indent blankline
    use "lukas-reineke/indent-blankline.nvim"

    ---- Completion ----
    -- LSP Config
    use 'neovim/nvim-lspconfig'
    -- Mason
    use { 'williamboman/mason.nvim',
      -- config = function() require('mason').setup() end
    }
    -- Cmp
    use { 'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
      }
    }

    ---- Git ----
    -- gitsings
    use 'lewis6991/gitsigns.nvim'

    ---- Others ----
    -- Autopairs
    use 'windwp/nvim-autopairs'
    -- Auto tag
    use 'windwp/nvim-ts-autotag'
    -- Comment
    use 'numToStr/Comment.nvim'
    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'


  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
