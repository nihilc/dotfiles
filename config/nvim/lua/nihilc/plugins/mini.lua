local autocmd = require("nihilc.autocmd")
local keymaps = require("nihilc.keymaps")
return {
  -- Appearance
  {
    "nvim-mini/mini.starter",
    version = "*",
    config = function()
      local starter = require("mini.starter")
      starter.setup({
        items = {
          starter.sections.sessions(5, true),
          starter.sections.recent_files(4, true),
          starter.sections.recent_files(4, false),
          starter.sections.builtin_actions(),
        },
        content_hooks = {
          starter.gen_hook.aligning("center", "center"),
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing("all", { "Sessions", "Builtin actions" }),
        },
        footer = "Type query to filter items\n<esc> resets query\n<c-c> closes this buffer",
      })
    end,
  },
  { "nvim-mini/mini.icons", version = "*", opts = {} },
  { "nvim-mini/mini.indentscope", version = "*", opts = { symbol = "│" } },
}
