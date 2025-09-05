local cursor_line_hl

function ColorMyPencils(color, transparent)
    color = color or "gruvbox"
    transparent = transparent or "true"

    vim.cmd.colorscheme(color)

    cursor_line_hl = vim.api.nvim_get_hl(0, { name = "CursorLine"});

    local normhl = cursor_line_hl.bg

    if transparent == "true" then
        vim.api.nvim_set_hl(0, "Normal",  { bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none"})
    end

    local black     = vim.g.terminal_color_0
    local red       = vim.g.terminal_color_1
    local green     = vim.g.terminal_color_2
    local yellow    = vim.g.terminal_color_3
    local blue      = vim.g.terminal_color_4
    local magenta   = vim.g.terminal_color_5
    local cyan      = vim.g.terminal_color_6
    local white     = vim.g.terminal_color_7
    local black_l   = vim.g.terminal_color_8
    local red_l     = vim.g.terminal_color_9
    local green_l   = vim.g.terminal_color_10
    local yellow_l  = vim.g.terminal_color_11
    local blue_l    = vim.g.terminal_color_12
    local magenta_l = vim.g.terminal_color_13
    local cyan_l    = vim.g.terminal_color_14
    local white_l   = vim.g.terminal_color_15

    vim.api.nvim_set_hl(0, "SignColumn",                {fg = white_l,  bg = cursor_line_hl.bg } )
    vim.api.nvim_set_hl(0, "StatusLineDef",             {fg = white_l,  bg = normhl    } )
    vim.api.nvim_set_hl(0, "ModeNormal",                {fg = black,    bg = green,    bold = true} )
    vim.api.nvim_set_hl(0, "ModeInsert",                {fg = black,    bg = white,    bold = true} )
    vim.api.nvim_set_hl(0, "ModeReplace",               {fg = black,    bg = red_l,     bold = true} )
    vim.api.nvim_set_hl(0, "ModeVisual",                {fg = white_l,  bg = blue,    bold = true} )
    vim.api.nvim_set_hl(0, "ModeVisual-Block",          {fg = black,    bg = blue_l,      bold = true} )
    vim.api.nvim_set_hl(0, "ModeCommand",               {fg = black,    bg = yellow,    bold = true} )
    vim.api.nvim_set_hl(0, "ModeSelect",                {fg = white_l,  bg = magenta,   bold = true} )
    vim.api.nvim_set_hl(0, "ModeNormalToGitSep",        {fg = green,    bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeInsertToGitSep",        {fg = white,    bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeReplaceToGitSep",       {fg = red_l,    bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeVisualToGitSep",        {fg = blue,     bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeVisual-BlockToGitSep",  {fg = blue_l,   bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeCommandToGitSep",       {fg = yellow,   bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeSelectToGitSep",        {fg = magenta,  bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "Git",                       {fg = white_l,  bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "GitToNormSep",              {fg = "#D75F00",bg = normhl    } )
    vim.api.nvim_set_hl(0, "Normalhl",                  {fg = white_l,  bg = normhl    } )
    vim.api.nvim_set_hl(0, "NormToTypeSep",             {fg = blue,     bg = normhl    } )
    vim.api.nvim_set_hl(0, "Filetype",                  {fg = white_l,  bg =  blue} )
    vim.api.nvim_set_hl(0, "TypeToRowColSep",           {fg = green,    bg =  blue} )
    vim.api.nvim_set_hl(0, "RowCol",                    {fg = black,    bg =  green } )
    vim.api.nvim_set_hl(0, "StatusLineExtra",           {fg = black,    bg =  green } )
end

local clcMode = 1

vim.api.nvim_create_user_command("CLC", function()
    if clcMode == 1 then
        vim.api.nvim_set_hl(0, "CursorLine",  { bg = "#545454" })
        clcMode = 0
    else
        clcMode = 1
        vim.api.nvim_set_hl(0, "CursorLine",  { bg = cursor_line_hl.bg})
    end

end,{})

vim.api.nvim_create_user_command("ColorMyPencils", function(args)
    ColorMyPencils(args.fargs[1], args.fargs[2])
end, {nargs="*"})

ColorMyPencils()
