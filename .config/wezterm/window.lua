local wezterm = require('wezterm')

local window_config_util = {}

local window_padding = {
    left = "0cell",
    right = "0cell",
    top = "0cell",
    bottom = "0cell"
}

local window_content_alignment = {
    vertical = "Center",
    horizontal = "Left"
}

local initial_cols = 80
local initial_rows = 24
local adjust_window_size_when_changing_font_size = false

local tiling_desktop_environments = {
    'X11 LG3D',
    'X11 bspwm',
    'X11 i3',
    'X11 dwm',
    'X11 awesome',
    'Wayland',
    'Wayland swaywm',
}

---@param config table
function window_config_util.inject_config_window(config)
    config.window_padding = window_padding
    config.window_content_alignment = window_content_alignment
    config.initial_cols = initial_cols
    config.initial_rows = initial_rows
    config.adjust_window_size_when_changing_font_size = adjust_window_size_when_changing_font_size
    config.tiling_desktop_environments = tiling_desktop_environments
end

return window_config_util
