-- Monitor
-- See https://wiki.hypr.land/configuring/core/monitors/
-- hl.monitor({
--     output   = "VGA-1",
--     mode     = "1920x1080@60",
--     position = "0x0",
--     scale    = "auto",
-- })
--
-- hl.monitor({
--     output   = "LVDS-1",
--     mode     = "1366x768@60",
--     position = "0x1080",
--     scale    = "auto",
-- })

hl.monitor({
    output   = "LVDS-1",
    mode     = "1366x768@60",
    position = "0x0",
    scale    = "auto",
})


-- bindl = , switch:off:Lid Switch, exec, hyprctl keyword monitor "VGA-1, 1280x1024@60, 0x0, 1, bitdepth, 10"

hl.workspace_rule({
    workspace = "1",
    monitor = "LVDS-1",
})

hl.workspace_rule({
    workspace = "5",
    monitor = "LVDS-1",
})

hl.workspace_rule({
    workspace = "6",
    monitor = "LVDS-1",
})

hl.workspace_rule({
    workspace = "7",
    monitor = "LVDS-1",
})

hl.workspace_rule({
    workspace = "4",
    monitor = "VGA-1",
    default = true,
})

hl.window_rule({
    match = { workspace = "3" },
})

hl.window_rule({
    match = { class = "Minecraft.*" },
    workspace = 3,
})

hl.window_rule({
    match = { class = "krita" },
    workspace = 2,
})

hl.window_rule({
    match = { class = "discord" },
    workspace = 5,
})

hl.window_rule({
    match = { class = "vesktop" },
    workspace = 5,
})

hl.window_rule({
    match = { class = "com.obsproject.Studio" },
    workspace = 6,
})

hl.window_rule({
    name = "remove_spotify_popup_decoration",
    match = { class = "chromium-browser" },
    decorate = false,
    workspace = 7,
})


-- Startup Execution
hl.on("hyprland.start", function ()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("hyprctl setcursor Dracula-cursors 24")
    hl.exec_cmd("awww-daemon -f xrgb ")
    hl.exec_cmd("~/.local/bin/lowbatNotifd BAT0")
    hl.exec_cmd("~/.scripts/awwwWallpaper.sh cur")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("~/.config/waybar/scripts/reload.sh")
    -- hl.exec_cmd("eww open bar")
    hl.exec_cmd("systemctl --user start plasma-polkit-agent.service")
end)


-- program variables
local terminal = "alacritty"
local terminal_tmux = "alacritty -e tmux new"
local fileManager = "thunar"
local browser = "floorp"
local menu = "~/.local/bin/rofi-runner"
local gnomeSchema = "org.gnome.desktop.interface"
local lockscreen = "hyprlock"

-- env
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", " Dracula-cursors")
hl.env("HYPRCURSOR_THEME", "Dracula-cursors ")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct ")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

hl.exec_cmd("gsettings set " .. gnomeSchema .. "gtk-theme 'Nordic-bluish-accent'")
hl.exec_cmd("gsettings set " .. gnomeSchema .." icon-theme 'Papirus'")
hl.exec_cmd("gsettings set " .. gnomeSchema .." cursor-theme 'Dracula-cursors'")

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,

        accel_profile = "adaptive",

        touchpad = {
                disable_while_typing = true,
                natural_scroll = true,
            },

            sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        }
})

hl.config({
    general = {
        -- # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 2,
        gaps_out = 2,
        border_size = 2,
        -- col.active_border = rgba(FFC371EE) rgba(FF5F6DEE) 90deg
        -- col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col = {
            active_border = { colors = {"rgb(b8bb26)"} },
            inactive_border = { colors = {"rgb(a89984)"} },
        },

        layout = "dwindle",

        allow_tearing = true,
    }
})

hl.config({
    decoration = {
        -- See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 0,

        blur = {
            enabled = true,
            size = 4,
            passes = 1,
        },

        -- animations = {
        --     enabled = true
        -- }

        -- drop_shadow = true,
        -- shadow_range = 4,
        -- shadow_render_power = 3,
        -- col.shadow = { colors = {"rgba(1a1a1aee)"} },
    },
    animations = {
        enabled = true,
    }
})

hl.curve("straight", {
    type = "bezier",
    points = {
        {0.05, 0.9},
        {0.1, 1.05}
    },
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 2,
    bezier = "straight"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2,
    bezier = "straight",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 4,
    bezier = "default",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 2,
    bezier = "straight"
})

hl.config({
    dwindle = {
        preserve_split = true -- you probably want this
    }
})

-- master {
--     # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
--     new_is_master = true
-- }
--

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.config({
    misc = {
        disable_hyprland_logo = true,
        -- vfr = true,
        vrr = true,
    }
})

-- blurls = waybarmonitors

-- Keybinds Section

local mod = "SUPER"

hl.bind(mod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + Shift + Q", hl.dsp.exec_cmd(terminal_tmux))
hl.bind(mod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + Shift + W", hl.dsp.exec_cmd(browser .. " --private-window"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + Shift + R", hl.dsp.reload_config())

hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind("Alt + F4", hl.dsp.window.close())
hl.bind(mod .. " + Shift + V", hl.dsp.window.fullscreen_state({ internal = 0, client = 2}))
hl.bind(mod .. " + V", hl.dsp.window.fullscreen())

hl.bind(mod .. "+ SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + Alt  + SPACE", hl.dsp.window.cycle_next({ floating = true }))
hl.bind(mod .. "+ Shift + SPACE", hl.dsp.window.cycle_next({ next = false, tiled = true }))
hl.bind(mod .. "+ Control + SPACE", hl.dsp.window.pin())

hl.bind(mod .. "+ Control + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mod .. " + Shift + M", hl.dsp.exec_cmd(lockscreen))

hl.bind(mod .. " + Shift + Y", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mod .. " + Y", hl.dsp.layout("togglesplit")) -- dwindle

-- bind = $mod Shift, R, exec, bash ~/.config/eww/scripts/toggle_eww_bar.sh

-- ThinkVantage Button, could be anything lol
-- commented out for vimmode layer in keyd
-- bind = , XF86Launch1, exec, kitty


hl.bind(mod .. " + I", hl.dsp.exec_cmd("dunstctl close"))
hl.bind(mod .. " + Shift + I", hl.dsp.exec_cmd("dunstctl close-all"))

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- volume controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

-- screenshot
hl.bind("Print", hl.dsp.exec_cmd("~/.local/bin/screenshot"))
hl.bind("Shift + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot -r"))

-- screenshot and save
hl.bind(mod .. " + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot -s"))
hl.bind(mod .. " + Shift + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot -rs"))

hl.bind("XF86Display", hl.dsp.exec_cmd("wl-mirror -F LVDS-1"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl --min-val=2 -q set 5%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q set 5%+"))

-- pass binds
hl.bind(mod .. "+ F12", hl.dsp.pass({ window = "class:com\\.obsproject\\.Studio" }))
hl.bind(mod .. "+ F11", hl.dsp.pass({ window = "class:com\\.obsproject\\.Studio" }))

-- Move focus with mod + arrow keys
hl.bind(mod .. " + left", hl.dsp.focus({direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({direction = "right"}))
hl.bind(mod .. " + up", hl.dsp.focus({direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({direction = "down" }))

-- Move focus with mod + vim dir keys
hl.bind(mod .. " + H", hl.dsp.focus({direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({direction = "right"}))
hl.bind(mod .. " + K", hl.dsp.focus({direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({direction = "down" }))

-- move window positions
hl.bind(mod .. " + Shift + left",   hl.dsp.window.move({direction = "left" }))
hl.bind(mod .. " + Shift + right",  hl.dsp.window.move({direction = "right"}))
hl.bind(mod .. " + Shift + up",	    hl.dsp.window.move({direction = "up" }))
hl.bind(mod .. " + Shift + down",   hl.dsp.window.move({direction = "down" }))

-- Move focus positions using vim dir keys
hl.bind(mod .. " + Shift + H", hl.dsp.window.move({direction = "left" }))
hl.bind(mod .. " + Shift + L", hl.dsp.window.move({direction = "right"}))
hl.bind(mod .. " + Shift + K", hl.dsp.window.move({direction = "up" }))
hl.bind(mod .. " + Shift + J", hl.dsp.window.move({direction = "down" }))

hl.bind(mod .. " + Shift + Control + H",	hl.dsp.window.move({ monitor = "left" }))
hl.bind(mod .. " + Shift + Control + L",	hl.dsp.window.move({ monitor = "right" }))
hl.bind(mod .. " + Shift + Control + K",	hl.dsp.window.move({ monitor = "up" }))
hl.bind(mod .. " + Shift + Control + J",	hl.dsp.window.move({ monitor = "down" }))

hl.bind(mod .. " + Shift + Control + left",	hl.dsp.window.move({ monitor = "left" }))
hl.bind(mod .. " + Shift + Control + right",	hl.dsp.window.move({ monitor = "right" }))
hl.bind(mod .. " + Shift + Control + up",	hl.dsp.window.move({ monitor = "up" }))
hl.bind(mod .. " + Shift + Control + down",	hl.dsp.window.move({ monitor = "down" }))

-- resize window 
hl.bind(mod .. " + Control + left", hl.dsp.window.resize({ x = -100, y = 0 }))
hl.bind(mod .. " + Control + right", hl.dsp.window.resize({x = 100, y = 0}))
hl.bind(mod .. " + Control + up", hl.dsp.window.resize({x = 0, y = -100}))
hl.bind(mod .. " + Control + down", hl.dsp.window.resize({x = 0, y = 100}))

-- resize window using vim dir keys
hl.bind(mod .. " + Control + H", hl.dsp.window.resize({ x = -100, y = 0 }))
hl.bind(mod .. " + Control + J", hl.dsp.window.resize({x = 100, y = 0}))
hl.bind(mod .. " + Control + K", hl.dsp.window.resize({x = 0, y = -100}))
hl.bind(mod .. " + Control + L", hl.dsp.window.resize({x = 0, y = 100}))


hl.bind(mod .. " + Tab", hl.dsp.focus({ last = true }))

hl.bind(mod .. " + D", hl.dsp.focus({workspace = "3" }))
hl.bind(mod .. " + F", hl.dsp.focus({workspace = "4" }))
hl.bind(mod .. " + S", hl.dsp.focus({workspace = "2" }))
hl.bind(mod .. " + A", hl.dsp.focus({workspace = "1" }))
hl.bind(mod .. " + G", hl.dsp.focus({workspace = "5" }))
hl.bind(mod .. " + T", hl.dsp.focus({workspace = "6" }))
hl.bind(mod .. " + B", hl.dsp.focus({workspace = "7" }))

-- Switch workspaces with mod + [0-9]
hl.bind(mod .. " + 1", hl.dsp.focus({workspace = "1" }))
hl.bind(mod .. " + 2", hl.dsp.focus({workspace = "2" }))
hl.bind(mod .. " + 3", hl.dsp.focus({workspace = "3" }))
hl.bind(mod .. " + 4", hl.dsp.focus({workspace = "4" }))
hl.bind(mod .. " + 5", hl.dsp.focus({workspace = "5" }))
hl.bind(mod .. " + 6", hl.dsp.focus({workspace = "6" }))
hl.bind(mod .. " + 7", hl.dsp.focus({workspace = "7" }))
hl.bind(mod .. " + 8", hl.dsp.focus({workspace = "8" }))
hl.bind(mod .. " + 9", hl.dsp.focus({workspace = "9" }))
hl.bind(mod .. " + 0", hl.dsp.focus({workspace = "10" }))

hl.bind(mod .. " + Shift + D", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mod .. " + Shift + F", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mod .. " + Shift + S", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mod .. " + Shift + A", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mod .. " + Shift + G", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mod .. " + Shift + T", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mod .. " + Shift + B", hl.dsp.window.move({ workspace = 7 }))

hl.bind(mod .. " + Control + Shift + D", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind(mod .. " + Control + Shift + F", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind(mod .. " + Control + Shift + S", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(mod .. " + Control + Shift + A", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(mod .. " + Control + Shift + G", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(mod .. " + Control + Shift + T", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind(mod .. " + Control + Shift + B", hl.dsp.window.move({ workspace = 7, follow = false }))

-- Move active window to a workspace with mod + SHIFT + [0-9]
hl.bind(mod .. " + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mod .. " + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mod .. " + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mod .. " + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mod .. " + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mod .. " + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mod .. " + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mod .. " + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mod .. " + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mod .. " + 0", hl.dsp.window.move({ workspace = 10 }))

-- bind = $mod Control, Y, swapactiveworkspaces

-- bind = $mod, U, exec, hyprmag -r 400 -s 1.5

-- Example special workspace (scratchpad)
hl.bind(mod .. " + Z", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mod .. " + X", hl.dsp.window.center())

-- Scroll through existing workspaces with mod + scroll
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mod .. " + N", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + P",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mod + LMB/RMB and dragging

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
