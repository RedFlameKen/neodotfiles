
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
    {"javascript", " "},
    {"typescript", " "},
    {"json", "󰘦 "},
    {"python", "󰌠 "},
    {"ino", " "},
    {"rust", "󱘗 "},
    {"markdown", "󰍔 "},
    {"tex", " "}
}
local function getLangIcon(lang)
    for _, language in ipairs(languages) do
        if lang == language[1] then
            return language[2]
        end
    end
    return ""
end

local git_has_diff = false

local function gitBranch()
    if not ShowBranch then
        return ""
    end
    local gitDir = vim.fn.finddir('.git', vim.fn.getcwd() .. ";")
    if gitDir == "" then
        return ""
    end
    local branch = vim.fn.system("git branch --show-current | tr -d '\n'")
    local diff = ""
    if git_has_diff then
        diff = "*"
    end
    return " 󰘬 " .. branch .. diff .. ' '
end

vim.api.nvim_create_autocmd({ "BufWrite", "BufEnter"}, {
    callback = function()
        git_has_diff = require("redflameken.git").has_diff()
    end
})

local function filename()
    local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
    -- local fname = vim.fn.expand("%:t")
    return string.format("%%<%s", fpath) .. " %m%r"
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
    modenormal = "%#ModeNormal# ",
    modeinsert = "%#ModeInsert# ",
    modereplace = "%#ModeReplace# ",
    modevisual = "%#ModeVisual# ",
    modevisualb = "%#ModeVisual-Block# ",
    modecommand = "%#ModeCommand# ",
    modeselect = "%#ModeSelect# ",
    git = "%#Git#",

    modenormaltogitsep = "%#ModeNormalToGitSep#",
    modeinserttogitsep = "%#ModeInsertToGitSep#",
    modereplacetogitsep = "%#ModeReplaceToGitSep#",
    modevisualtogitsep = "%#ModeVisualToGitSep#",
    modevisualbtogitsep = "%#ModeVisual-BlockToGitSep#",
    modecommandtogitsep = "%#ModeCommandToGitSep#",
    modeselecttogitsep = "%#ModeSelectToGitSep#",
    gittonormsep = "%#GitToNormSep#",
    normtotypesep = "%=%#NormToTypeSep#",
    type = "%#Filetype#",
    typetorowcolsep = "%#TypeToRowColSep#",
    rowcol = "%#RowCol# ",
    extra = "%=%#StatusLineExtra#",
}
local modes = {
    ["n"] =     {name = "NORMAL",           highlight = highlights.modenormal,  sephighlight = highlights.modenormaltogitsep },
    ["no"] =    {name = "NORMAL-OP",        highlight = highlights.modenormal,  sephighlight = highlights.modenormaltogitsep },
    ["nov"] =   {name = "NORMAL-OP",        highlight = highlights.modenormal,  sephighlight = highlights.modenormaltogitsep },
    ["noV"] =   {name = "NORMAL-OP",        highlight = highlights.modenormal,  sephighlight = highlights.modenormaltogitsep },
    ["no"] =  {name = "NORMAL-OP",        highlight = highlights.modenormal,  sephighlight = highlights.modenormaltogitsep },
    ["niI"] =   {name = "NORMAL-I",         highlight = highlights.modenormal,  sephighlight = highlights.modenormaltogitsep },
    ["niR"] =   {name = "NORMAL-R",         highlight = highlights.modenormal,  sephighlight = highlights.modenormaltogitsep },
    ["niV"] =   {name = "NORMAL-V",         highlight = highlights.modenormal,  sephighlight = highlights.modenormaltogitsep },
    ["ic"] =    {name = "COMPLETION",       highlight = highlights.modeinsert,  sephighlight = highlights.modeinserttogitsep },
    ["i"] =     {name = "INSERT",           highlight = highlights.modeinsert,  sephighlight = highlights.modeinserttogitsep },
    ["R"] =     {name = "REPLACE",          highlight = highlights.modereplace, sephighlight = highlights.modereplacetogitsep },
    ["v"] =     {name = "VISUAL",           highlight = highlights.modevisual,  sephighlight = highlights.modevisualtogitsep },
    ["V"] =     {name = "VISUAL-LINE",      highlight = highlights.modevisual,  sephighlight = highlights.modevisualtogitsep },
    [""] =    {name = "VISUAL-BLOCK",     highlight = highlights.modevisualb, sephighlight = highlights.modevisualbtogitsep },
    ["c"] =     {name = "COMMAND",          highlight = highlights.modecommand, sephighlight = highlights.modecommandtogitsep },
    ["s"] =     {name = "SELECT",           highlight = highlights.modeselect,  sephighlight = highlights.modeselecttogitsep },
    ["S"] =     {name = "SELECT-LINE",      highlight = highlights.modeselect,  sephighlight = highlights.modeselecttogitsep },
    ["t"] =     {name = "Terminal-I",         highlight = highlights.modeinsert,  sephighlight = highlights.modeinserttogitsep },
    ["nt"] =     {name = "Terminal",         highlight = highlights.modeinsert,  sephighlight = highlights.modeinserttogitsep },
}
local function mode()
    local curMode = vim.api.nvim_get_mode().mode
    return modes[curMode].highlight .. string.format("%s ", modes[curMode].name) .. modes[curMode].sephighlight .. ""
end


Statusline = function()
    return table.concat{
        highlights.default,
        mode(),
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
