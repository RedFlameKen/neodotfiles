local modes = {
    ["n"] = "NORMAL",
    ["i"] = "INSERT",
    ["R"] = "REPLACE",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL-LINE",
    ['^V'] = "VISUAL-BLOCK",
    ["c"] = "COMMAND",
    ["s"] = "SELECT",
    ["S"] = "SELECT-LINE",
}
local languages = {
    {"lua", "󰢱 "},
    {"cpp", " "},
    {"c", " "},
    {"vim", " "},
    {"java", "󰬷 "},
    {"class", "󰬷 "},
    {"html", "󰌝 "},
    {"css", " "},
    {"scss", " "},
    {"js", " "},
    {"json", "󰘦 "},
    {"py", "󰌠 "},
    {"ino", " "},
    {"rs", "󱘗 "},
    {"md", "󰍔 "}
}

local function getLangIcon(lang)
    for _, language in ipairs(languages) do
        if lang == language[1] then
            return language[2]
        end
    end
    return ""
end
local function mode()
    local curMode = vim.api.nvim_get_mode().mode
    return string.format("%s ", modes[curMode])
end

local function gitBranch()
    local gitDir = vim.fn.finddir('.git', vim.fn.getcwd() .. ";")
    if gitDir == "" then
        return ""
    end
    local branch = vim.fn.system("git branch --show-current | tr -d '\n'")
    return " 󰘬 " .. branch .. ' '
end

local function filename()
    local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
    local fname = vim.fn.expand("%:t")
    return string.format("%%<%s/", fpath) .. fname .. " %m%r"
end


local function filetype()
    local type = string.format("%s", vim.bo.filetype)
    return ' ' .. getLangIcon(type) .. type .. ' '
end

local function lineinfo()
    return "%3l:%-3c %P "
end
--[[
local separators = {
    arrow = {"", ""},
    round = {"", ""},
    blank = {"", ""}
}
]]--

local highlights = {
    default = "%#StatusLineDef#",
    normal = "%#Normalhl# ",
    mode = "%#Mode# ",
    modetogitsep= "%#ModeToGitSep#",
    git = "%#Git#",
    gittonormsep = "%#GitToNormSep#",
    normtotypesep = "%=%#NormToTypeSep#",
    type = "%#Filetype#",
    typetorowcolsep = "%#TypeToRowColSep#",
    rowcol = "%#RowCol# ",
    extra = "%=%#StatusLineExtra#",
}

Statusline = function()
    return table.concat{
        highlights.default,
        highlights.mode,
        mode(),
        highlights.modetogitsep,
        highlights.git,
        gitBranch(),
        highlights.gittonormsep,
        highlights.normal,
        filename(),
        highlights.normtotypesep,
        highlights.type,
        filetype(),
        highlights.typetorowcolsep,
        highlights.rowcol,
        lineinfo(),
    }
end

function InitStatusline()
    vim.cmd('set statusline=%!v:lua.Statusline()')
end

InitStatusline()
