function ColorMyPencils(color)
    color = color or "srcery"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal",  { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none"})

    vim.api.nvim_set_hl(0, "StatusLineDef",     {fg = "#FCE8C3", bg = "#1C1B19"})
    vim.api.nvim_set_hl(0, "ModeNormal",        {fg = "#1C1B19", bg = "#519F50", bold = true})
    vim.api.nvim_set_hl(0, "ModeInsert",        {fg = "#1C1B19", bg = "#BAA67F", bold = true})
    vim.api.nvim_set_hl(0, "ModeReplace",       {fg = "#1C1B19", bg = "#F75341", bold = true})
    vim.api.nvim_set_hl(0, "ModeVisual",        {fg = "#1C1B19", bg = "#68A8E4", bold = true})
    vim.api.nvim_set_hl(0, "ModeVisual-Block",  {fg = "#FCE8C3", bg = "#2C78BF", bold = true})
    vim.api.nvim_set_hl(0, "ModeCommand",       {fg = "#1C1B19", bg = "#FBB829", bold = true})
    vim.api.nvim_set_hl(0, "ModeSelect",        {fg = "#1C1B19", bg = "#FF5C8F", bold = true})

    vim.api.nvim_set_hl(0, "ModeNormalToGitSep",        {fg = "#519F50", bg = "#D75F00"})
    vim.api.nvim_set_hl(0, "ModeInsertToGitSep",        {fg = "#BAA67F", bg = "#D75F00"})
    vim.api.nvim_set_hl(0, "ModeReplaceToGitSep",       {fg = "#F75341", bg = "#D75F00"})
    vim.api.nvim_set_hl(0, "ModeVisualToGitSep",        {fg = "#68A8E4", bg = "#D75F00"})
    vim.api.nvim_set_hl(0, "ModeVisual-BlockToGitSep",  {fg = "#2C78BF", bg = "#D75F00"})
    vim.api.nvim_set_hl(0, "ModeCommandToGitSep",       {fg = "#FBB829", bg = "#D75F00"})
    vim.api.nvim_set_hl(0, "ModeSelectToGitSep",        {fg = "#FF5C8F", bg = "#D75F00"})

    vim.api.nvim_set_hl(0, "Git",               {fg = "#FCE8C3", bg = "#D75F00"})
    vim.api.nvim_set_hl(0, "GitToNormSep",      {fg = "#D75F00", bg = "#1C1B19"})
    vim.api.nvim_set_hl(0, "Normalhl",          {fg = "#FCE8C3", bg = "#1C1B19"})
    vim.api.nvim_set_hl(0, "NormToTypeSep",     {fg = "#2C78BF", bg = "none"})
    vim.api.nvim_set_hl(0, "Filetype",          {fg = "#FCE8C3", bg = "#2C78BF"})
    vim.api.nvim_set_hl(0, "TypeToRowColSep",   {fg = "#519F50", bg = "#2C78BF"})
    vim.api.nvim_set_hl(0, "RowCol",            {fg = "#1C1B19", bg = "#519F50"})
    vim.api.nvim_set_hl(0, "StatusLineExtra",   {fg = "#1C1B19", bg = "#519F50"})
end

ColorMyPencils()
