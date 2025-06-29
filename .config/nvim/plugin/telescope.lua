local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ef", function()
    builtin.find_files({hidden = true})
end)

vim.keymap.set("n", "<leader>es", function()
    local keyword = vim.fn.input("Search Keyword: ")
    if Cancelled(keyword) then return end
    builtin.grep_string({ search = keyword })
end)

vim.keymap.set("n", "<leader>ed", function()
    builtin.grep_string({ search = "TODO:" })
end)

vim.keymap.set("n", "<leader>eg", function()
    vim.cmd("vimgrep TODO: **")
    vim.cmd("copen")
end)

local cur_file = "";

local function setCurFile()
    cur_file = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
end

vim.keymap.set("n", "<leader>eh", builtin.help_tags)

-- vim.keymap.set("n", "<leader>nn", function()
--     builtin.find_files {cwd = "~/docs/notes/"}
-- end)

vim.keymap.set("n", "<leader>nb", function()
    if cur_file ~= "" then
        vim.cmd("e " .. cur_file)
        cur_file = ""
    end
end)

-- vim.keymap.set("n", "<leader>nt", function()
--     if cur_file == "" then
--         setCurFile()
--         vim.cmd("e ~/docs/notes/todo.md")
--     else
--         vim.cmd("e " .. cur_file)
--         cur_file = ""
--     end
-- end)

-- vim.api.nvim_create_autocmd("User", {
--     pattern = "TelescopeFindPre",
--     callback = function ()
--         vim.opt_local.winborder = "none"
--         vim.api.nvim_create_autocmd("WinLeave", {
--             once = true,
--             callback = function ()
--                 vim.opt_local.winborder = "rounded"
--             end
--         })
--     end
-- })
--
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
