
local keymap_config_util = {}

local act = require'wezterm'.action

local keys = {
    {
        key = "=",
        mods = "CTRL",
        action = act.ResetFontSize
    },
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = act.SendString '\x1b[27;6;104~'
    },
    {
        key = "j",
        mods = "CTRL|SHIFT",
        action = act.SendString '\x1b[27;6;106~'
    },
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = act.SendString '\x1b[27;6;107~'
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = act.SendString '\x1b[27;6;108~'
    },
    {
        key = "Backspace",
        mods = "CTRL",
        action = act.SendString '\x17'
    },
    {
        key = "Tab",
        mods = "CTRL|SHIFT",
        action = act.SendString '\x1b[27;6;9~'
    },
    {
        key = "Tab",
        mods = "CTRL",
        action = act.SendString '\x1b[27;5;9~'
    },
    {
        key = "LeftArrow",
        mods = "CTRL|SHIFT",
        action = act.SendString '\x1b[1;5D'
    },
    {
        key = "RightArrow",
        mods = "CTRL|SHIFT",
        action = act.SendString '\x1b[1;5C'
    },
    {
        key = "m",
        mods = "CTRL|SHIFT",
        action = act.ShowDebugOverlay
    },
}

function keymap_config_util.inject_config_keybinds(config)
    config.keys = keys
end

return keymap_config_util
