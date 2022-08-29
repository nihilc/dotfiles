local actions = require "telescope.actions"
local config = require "telescope.config"

require('telescope').setup{
  defaults = {
    prompt_prefix = "   ",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.9,
      height = 0.8,
      preview_cutoff = 20,
    },

    -- Borders straight, rounded, double
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
