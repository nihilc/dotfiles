return {
  {
    "rebelot/kanagawa.nvim",
    enabled = true,
    priority = 1000,
    lazy = false,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            IblIndent = { fg = colors.palette.sumiInk4 },
            MiniIndentscopeSymbol = { fg = colors.palette.dragonBlue },
          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
