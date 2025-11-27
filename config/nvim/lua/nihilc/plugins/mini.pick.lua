return {
  "nvim-mini/mini.pick",
  dependencies = {
    {"nvim-mini/mini.extra", version = "*", opts = {}},
  },
  version = "*",
  config = function()
    require("mini.pick").setup()
    -- Change vim.ui.select to MiniPick.ui_select()
    vim.ui.select = function(items, opts, on_choice)
      start_opts = { window = { config = { width = 60, height = 10 } } }
      return MiniPick.ui_select(items, opts, on_choice, start_opts)
    end
    -- Set Global Keymaps
    local keymaps = require("nihilc.keymaps")
    keymaps.set({
      { desc = "Find Files", lhs = "<leader>ff", rhs = "<cmd>Pick files<cr>" },
      { desc = "Find Buffer", lhs = "<leader>fb", rhs = "<cmd>Pick buffers<cr>" },
      { desc = "Find Grep Live", lhs = "<leader>fg", rhs = "<cmd>Pick grep_live<cr>" },
      {
        desc = "Find Word",
        lhs = "<leader>fw",
        rhs = function()
          local word = vim.fn.expand("<cword>")
          MiniPick.builtin.grep({ pattern = word }, { source = { name = string.format("Grep: %s", word) } })
        end,
      },
      {
        desc = "Find WORD",
        lhs = "<leader>fW",
        rhs = function()
          local word = vim.fn.expand("<cWORD>")
          MiniPick.builtin.grep({ pattern = word }, { source = { name = string.format("Grep: %s", word) } })
        end,
      },
      { desc = "Help Tags", lhs = "<leader>ht", rhs = "<cmd>Pick help<cr>" },
      { desc = "Help Keymaps", lhs = "<leader>hk", rhs = "<cmd>Pick keymaps<cr>" },
    })
  end,
}
