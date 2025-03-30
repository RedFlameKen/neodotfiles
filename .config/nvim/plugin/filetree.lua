local api = require("nvim-tree.api")

local sort = {
    sorter = "case_sensitive"
}

local view = {
    width = 30
}

local renderer = {
    group_empty = true
}

local filters = {
    dotfiles = true
}

require("nvim-tree").setup {
    sort = sort,
    view = view,
    renderer = renderer,
    filters = filters,
}

vim.keymap.set("n", "<leader>et", api.tree.toggle)
