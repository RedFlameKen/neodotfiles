local wezterm = require('wezterm')

local config = {}

config.font = wezterm.font "JetBrainsMono Nerd Font"
config.font_size = 12

config.window_background_opacity = 0.9
config.enable_tab_bar = false

require('window').inject_config_window(config)
require('colors').inject_config_colors(config)
require('keybinds').inject_config_keybinds(config)

return config
