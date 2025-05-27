local silicon = require"nvim-silicon"

local function get_output()
    local cwd = vim.fn.getcwd() .. "/"
    local curfile = vim.fn.expand("%")
    local filename = cwd .. curfile .. " at " .. os.date("%Y-%m-%d_%H:%M:%S") .. "_codeshot.png"
    local output = "~/Pictures/codeshots/" .. vim.fn.substitute(filename, "/", "_", "g")
    return output;
end

local document_setup = {
    theme = "gruvbox-dark",
    pad_horiz = 0,
    pad_vert = 0,
    no_round_corner = true,
    no_window_controls = true,
    language = function()
        return vim.bo.filetype
    end,
    output = get_output()
}

local casual_setup = {
    theme = "gruvbox-dark",
    pad_horiz = 100,
    pad_vert = 80,
    no_round_corner = false,
    no_window_controls = false,
    -- window_title = "Kenneth Lacaba",
    -- no_line_number = true,
    language = function()
        return vim.bo.filetype
    end,
    output = get_output()
}

silicon.setup(casual_setup)

vim.keymap.set({"n", "v"}, "<leader>sc", function()
    silicon.clip()
end)

vim.keymap.set({"n", "v"}, "<leader>ss", function()
    silicon.shoot()
end)

vim.keymap.set({"n", "v"}, "<leader>sf", function()
    silicon.file()
end)

local silicon_is_casual = true

vim.keymap.set("n", "<leader>sa", function()
    if silicon_is_casual then
        silicon.options = silicon.parse_options(document_setup)
        silicon_is_casual = false
    else
        silicon.options = silicon.parse_options(casual_setup)
        silicon_is_casual = true
    end
end)

