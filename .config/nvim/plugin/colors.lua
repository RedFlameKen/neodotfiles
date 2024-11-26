function ColorMyPencils(color, transparent)
    color = color or "gruvbox"
    transparent = transparent or "true"

    vim.cmd.colorscheme(color)

    if transparent == "true" or transparent ~= "false" then
        vim.api.nvim_set_hl(0, "Normal",  { bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none"})
    end

    vim.api.nvim_set_hl(0, "StatusLineDef",             {fg = "#FCE8C3", bg = "#1C1B19",    ctermfg = 7,   ctermbg = 8,  })
    vim.api.nvim_set_hl(0, "ModeNormal",                {fg = "#1C1B19", bg = "#519F50",    ctermfg = 8,   ctermbg = 2,  bold = true})
    vim.api.nvim_set_hl(0, "ModeInsert",                {fg = "#1C1B19", bg = "#BAA67F",    ctermfg = 8,   ctermbg = 15, bold = true})
    vim.api.nvim_set_hl(0, "ModeReplace",               {fg = "#1C1B19", bg = "#F75341",    ctermfg = 8,   ctermbg = 1,  bold = true})
    vim.api.nvim_set_hl(0, "ModeVisual",                {fg = "#1C1B19", bg = "#68A8E4",    ctermfg = 8,   ctermbg = 12, bold = true})
    vim.api.nvim_set_hl(0, "ModeVisual-Block",          {fg = "#FCE8C3", bg = "#2C78BF",    ctermfg = 7,   ctermbg = 4,  bold = true})
    vim.api.nvim_set_hl(0, "ModeCommand",               {fg = "#1C1B19", bg = "#FBB829",    ctermfg = 8,   ctermbg = 3,  bold = true})
    vim.api.nvim_set_hl(0, "ModeSelect",                {fg = "#FCE8C3", bg = "#E02C6D",    ctermfg = 7,   ctermbg = 5,  bold = true})
    vim.api.nvim_set_hl(0, "ModeNormalToGitSep",        {fg = "#519F50", bg = "#D75F00",    ctermfg = 2,   ctermbg = 1,  })
    vim.api.nvim_set_hl(0, "ModeInsertToGitSep",        {fg = "#BAA67F", bg = "#D75F00",    ctermfg = 15,  ctermbg = 1,  })
    vim.api.nvim_set_hl(0, "ModeReplaceToGitSep",       {fg = "#F75341", bg = "#D75F00",    ctermfg = 1,   ctermbg = 1,  })
    vim.api.nvim_set_hl(0, "ModeVisualToGitSep",        {fg = "#68A8E4", bg = "#D75F00",    ctermfg = 12,  ctermbg = 1,  })
    vim.api.nvim_set_hl(0, "ModeVisual-BlockToGitSep",  {fg = "#2C78BF", bg = "#D75F00",    ctermfg = 4,   ctermbg = 1,  })
    vim.api.nvim_set_hl(0, "ModeCommandToGitSep",       {fg = "#FBB829", bg = "#D75F00",    ctermfg = 3,   ctermbg = 1,  })
    vim.api.nvim_set_hl(0, "ModeSelectToGitSep",        {fg = "#E02C6D", bg = "#D75F00",    ctermfg = 5,   ctermbg = 1,  })
    vim.api.nvim_set_hl(0, "Git",                       {fg = "#FCE8C3", bg = "#D75F00",    ctermfg = 7,   ctermbg = 1,  })
    vim.api.nvim_set_hl(0, "GitToNormSep",              {fg = "#D75F00", bg = "#1C1B19",    ctermfg = 1,   ctermbg = 8,  })
    vim.api.nvim_set_hl(0, "Normalhl",                  {fg = "#FCE8C3", bg = "#1C1B19",    ctermfg = 7,   ctermbg = 8,  })
    vim.api.nvim_set_hl(0, "NormToTypeSep",             {fg = "#2C78BF", bg = "#1C1B19",    ctermfg = 4,   ctermbg = 8,  })
    vim.api.nvim_set_hl(0, "Filetype",                  {fg = "#FCE8C3", bg = "#2C78BF",    ctermfg = 7,   ctermbg = 4,  })
    vim.api.nvim_set_hl(0, "TypeToRowColSep",           {fg = "#519F50", bg = "#2C78BF",    ctermfg = 2,   ctermbg = 4,  })
    vim.api.nvim_set_hl(0, "RowCol",                    {fg = "#1C1B19", bg = "#519F50",    ctermfg = 8,   ctermbg = 2,  })
    vim.api.nvim_set_hl(0, "StatusLineExtra",           {fg = "#1C1B19", bg = "#519F50",    ctermfg = 8,   ctermbg = 2,  })
end

local clcMode = 1

vim.api.nvim_create_user_command("CLC", function()
    if clcMode == 1 then
        vim.api.nvim_set_hl(0, "CursorLine",  { bg = "#2D1B19"})
        clcMode = 0
    else
        clcMode = 1
        vim.api.nvim_set_hl(0, "CursorLine",  { bg = "#303030"})
    end

end,{})

vim.api.nvim_create_user_command("ColorMyPencils", function(args)
    ColorMyPencils(args.fargs[1], args.fargs[2])
end, {nargs="*"})

ColorMyPencils()
