return {
  "nvim-mini/mini.sessions",
  version = "*",
  config = function()
    require("mini.sessions").setup({
      force = { delete = true },
    })
    -- Set Global Keymaps
    local keymaps = require("nihilc.keymaps")
    keymaps.set({
      {
        desc = "Session New",
        lhs = "<leader>sn",
        rhs = function()
          MiniSessions.write(vim.fn.input("Session name: "))
        end,
      },
      {
        desc = "Session Read",
        lhs = "<leader>sr",
        rhs = function()
          MiniSessions.select("read")
        end,
      },
      {
        desc = "Session Delete",
        lhs = "<leader>sd",
        rhs = function()
          MiniSessions.select("delete")
        end,
      },
    })
  end,
}
