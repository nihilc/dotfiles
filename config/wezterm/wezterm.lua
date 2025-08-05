local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font('JetbrainsMono Nerd Font')
config.font_size = 12
config.color_scheme = "Kanagawa (Gogh)" -- "OneDark (base16)" "catppuccin-mocha"

config.window_decorations = "NONE"
config.enable_tab_bar = false

config.disable_default_key_bindings = true
config.keys = {
  { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo('Clipboard') },
  { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom('Clipboard') },
  { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
  { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
  { key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize },
}

return config
