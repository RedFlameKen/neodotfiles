local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ef", builtin.find_files)

vim.keymap.set("n", "<leader>es", function()
    local keyword = vim.fn.input("Search Keyword: ")
    if Cancelled(keyword) then return end
    builtin.grep_string({ search = keyword })
end)

vim.keymap.set("n", "<leader>ed", function()
    builtin.grep_string({ search = "TODO:" })
end)

vim.keymap.set("n", "<leader>etd", function()
    vim.cmd("vimgrep TODO: **")
    vim.cmd("copen")
end)

vim.keymap.set("n", "<leader>eh", builtin.help_tags)

vim.keymap.set("n", "<leader>nn", function()
    builtin.find_files {cwd = "~/docs/notes/"}
end)

vim.keymap.set("n", "<leader>nt", function()
    vim.cmd("e ~/docs/notes/todo.md")
end)

-- require('telescope').setup({
--     extensions = {
--         ['ui-select'] = {
--             require('telescope.themes').get_dropdown{
--                 layout_strategy = "vertical",
--                 layout_config = {
--                     width = 0.5,
--                     prompt_position = "top"
--                 }
--             }
--         }
--     }
-- })
-- require'telescope'.load_extension('ui-select')
