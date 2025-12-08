return {
  "catgoose/nvim-colorizer.lua",
  lazy = false,
  opts = {
    user_default_options = {
      names = false, -- "Name" codes like Blue or red.
      RGB = true,
      RGBA = true,
      RRGGBB = true,
      RRGGBBAA = false,
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      mode = "virtualtext", -- 'background'|'foreground'|'virtualtext'
      virtualtext = "■",
      virtualtext_mode = "foreground", -- 'background'|'foreground' },
    },
  },
  keys = {
    {"<leader>uc", "<cmd>ColorizerToggle<cr>", desc = "UI Toggle Colorizer"}
  }
}
