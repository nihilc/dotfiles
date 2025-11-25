return {
  {
    "rebelot/kanagawa.nvim",
    enabled = true,
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
            TelescopeBorder = { bg = "none" },
            IblIndent = { fg = colors.palette.sumiInk4 },
            NvimTreeIndentMarker = { fg = colors.palette.sumiInk4 },
          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
