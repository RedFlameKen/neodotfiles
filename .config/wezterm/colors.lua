local colors_config_util = {}

local colors = {
    foreground = "#ebdbb2",
    background = "#282829",

    cursor_fg = "#665c54",
    cursor_bg = "#fabd2f",
    selection_fg = "#282829",
    selection_bg = "#ebdbb2",

    split = "#98971a",

    ansi = {
        "#3c3836",
        "#cc241d",
        "#98971a",
        "#d79921",
        "#458588",
        "#b16286",
        "#689d6a",
        "#a89984",
    },

    brights = {
        "#928374",
        "#fb4934",
        "#b8bb26",
        "#fabd2f",
        "#83a598",
        "#d3869b",
        "#8ec07c",
        "#fbf1c7",
    },

}

local bold_brightens_ansi_colors = false

function colors_config_util.inject_config_colors(config)
    config.colors = colors
    config.bold_brightens_ansi_colors = bold_brightens_ansi_colors
end

return colors_config_util
