return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      icons_enabled = false,
      component_separators = { left = "│", right = "│" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = { {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      } },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "diagnostics", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
