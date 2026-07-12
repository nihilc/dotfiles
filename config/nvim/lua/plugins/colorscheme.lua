return {
  {
    "oxidescheme/nvim",
    enabled = false,
    name = "oxide",
    priority = 1000,
    config = function()
      require("oxide").setup({
        transparent = true,
        on_highlights = function(highlights, colors)
          highlights.Visual = { bg = "#2e2e2e" } -- better visual selection
        end,
      })
      vim.cmd.colorscheme("oxide")
    end,
  },
  {
    "vague-theme/vague.nvim",
    enabled = true,
    priority = 1000,
    config = function()
      require("vague").setup()
      vim.cmd.colorscheme("vague")
    end,
  },
}
