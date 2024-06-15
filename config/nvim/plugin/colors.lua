function ColorMyPencils(color)
    color = color or "srcery"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal",  { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none"})

    vim.api.nvim_set_hl(0, "StatusLineDef",     {fg = "#FCE8C3", bg = "#1C1B19"})
    vim.api.nvim_set_hl(0, "Mode",              {fg = "#FCE8C3", bg = "#519F50", bold = true})
    vim.api.nvim_set_hl(0, "ModeToGitSep",      {fg = "#519F50", bg = "#D75F00", bold = true})
    vim.api.nvim_set_hl(0, "Git",               {fg = "#FCE8C3", bg = "#D75F00"})
    vim.api.nvim_set_hl(0, "GitToNormSep",      {fg = "#D75F00", bg = "#1C1B19"})
    vim.api.nvim_set_hl(0, "Normalhl",          {fg = "#FCE8C3", bg = "#1C1B19"})
    vim.api.nvim_set_hl(0, "NormToTypeSep",     {fg = "#2C78BF", bg = "none"})
    vim.api.nvim_set_hl(0, "Filetype",          {fg = "#FCE8C3", bg = "#2C78BF"})
    vim.api.nvim_set_hl(0, "TypeToRowColSep",   {fg = "#519F50", bg = "#2C78BF"})
    vim.api.nvim_set_hl(0, "RowCol",            {fg = "#FCE8C3", bg = "#519F50"})
    vim.api.nvim_set_hl(0, "StatusLineExtra",   {fg = "#FCE8C3", bg = "#519F50"})
end

ColorMyPencils()
