local cursor_line_hl

function ColorMyPencils(color, transparent)
    color = color or "gruvbox"
    transparent = transparent or "false"

    vim.cmd.colorscheme(color)

    cursor_line_hl = vim.api.nvim_get_hl(0, { name = "CursorLine"});

    local normhl = cursor_line_hl.bg

    if transparent == "true" then
        vim.api.nvim_set_hl(0, "Normal",  { bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none"})
    end

    vim.api.nvim_set_hl(0, "SignColumn",                {fg = "#FCE8C3", bg = "#303030" } )
    vim.api.nvim_set_hl(0, "StatusLineDef",             {fg = "#FCE8C3", bg = normhl } )
    vim.api.nvim_set_hl(0, "ModeNormal",                {fg = "#1C1B19", bg = "#519F50" } )
    vim.api.nvim_set_hl(0, "ModeInsert",                {fg = "#1C1B19", bg = "#BAA67F" } )
    vim.api.nvim_set_hl(0, "ModeReplace",               {fg = "#1C1B19", bg = "#F75341" } )
    vim.api.nvim_set_hl(0, "ModeVisual",                {fg = "#1C1B19", bg = "#68A8E4" } )
    vim.api.nvim_set_hl(0, "ModeVisual-Block",          {fg = "#FCE8C3", bg = "#2C78BF" } )
    vim.api.nvim_set_hl(0, "ModeCommand",               {fg = "#1C1B19", bg = "#FBB829" } )
    vim.api.nvim_set_hl(0, "ModeSelect",                {fg = "#FCE8C3", bg = "#E02C6D" } )
    vim.api.nvim_set_hl(0, "ModeNormalToGitSep",        {fg = "#519F50", bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeInsertToGitSep",        {fg = "#BAA67F", bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeReplaceToGitSep",       {fg = "#F75341", bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeVisualToGitSep",        {fg = "#68A8E4", bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeVisual-BlockToGitSep",  {fg = "#2C78BF", bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeCommandToGitSep",       {fg = "#FBB829", bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "ModeSelectToGitSep",        {fg = "#E02C6D", bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "Git",                       {fg = "#FCE8C3", bg = "#D75F00" } )
    vim.api.nvim_set_hl(0, "GitToNormSep",              {fg = "#D75F00", bg = normhl } )
    vim.api.nvim_set_hl(0, "Normalhl",                  {fg = "#FCE8C3", bg = normhl } )
    vim.api.nvim_set_hl(0, "NormToTypeSep",             {fg = "#2C78BF", bg = normhl } )
    vim.api.nvim_set_hl(0, "Filetype",                  {fg = "#FCE8C3", bg = "#2C78BF" } )
    vim.api.nvim_set_hl(0, "TypeToRowColSep",           {fg = "#519F50", bg = "#2C78BF" } )
    vim.api.nvim_set_hl(0, "RowCol",                    {fg = "#1C1B19", bg = "#519F50" } )
    vim.api.nvim_set_hl(0, "StatusLineExtra",           {fg = "#1C1B19", bg = "#519F50" } )
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
