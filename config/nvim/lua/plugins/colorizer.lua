return {
  "catgoose/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      options = {
        parsers = {
          names = {
            enable = false,
          },
        },
        display = {
          mode = { "virtualtext" },
        },
      },
    })
  end,
}
