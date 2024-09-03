local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ef", builtin.find_files)

vim.keymap.set("n", "<leader>es", function()
    local keyword = vim.fn.input("Search Keyword: ")
    if Cancelled(keyword) then return end
    builtin.grep_string({ search = keyword })
end)

vim.keymap.set("n", "<leader>ed", function()
    builtin.grep_string({ search = "TODO" })
end)

vim.keymap.set("n", "<leader>eh", builtin.help_tags)
