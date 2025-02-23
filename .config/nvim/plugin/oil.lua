
local oil = require("oil")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local config = {
    default_file_explorer = false,
    skip_confirm_on_simple_edits = true,
    prompt_save_on_select_new_entry = true,
    constrain_cursor = "editable",
    buf_options = {
        buflisted = false,
        bufhidden = "hide"
    },
    columns = {
        "icon",
    },
    view_options = {
        show_hidden = false,
    },
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-y>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
    },
    float = {
        padding = 4,
    },
}

oil.setup(config)
