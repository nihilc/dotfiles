return {
  "romus204/tree-sitter-manager.nvim",
  version = "1.*",
  config = function()
    require("tree-sitter-manager").setup({
      ensure_installed = {
        -- Languages
        "bash",
        "go",
        -- Math
        "typst",
        -- Web
        "javascript",
        "typescript",
        "jsx",
        "tsx",
        "json",
        "html",
        "css",
      },
      border = vim.o.winborder,
    })
  end,
}
