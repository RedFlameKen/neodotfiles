vim.g.mapleader = " "

vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- navigate panes
vim.keymap.set("n", "<M-h>", "<C-w>h", {silent = true});
vim.keymap.set("n", "<M-j>", "<C-w>j", {silent = true});
vim.keymap.set("n", "<M-k>", "<C-w>k", {silent = true});
vim.keymap.set("n", "<M-l>", "<C-w>l", {silent = true});

-- backspacce
vim.keymap.set("i", "<C-BS>", "<C-w>", {noremap = true, silent = true})

-- BIG yank
vim.keymap.set("n", "Y", "yy")

-- Move line with auto indenting by Primeagen
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv")

-- Yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set("n", "<leader>m", "<CMD>Mason<CR>")

-- Color binds
vim.keymap.set("n", "<leader>cp", "<CMD>lua ColorMyPencils()<CR>")
vim.keymap.set("n", "<leader>ch", "<CMD>ColorHighlight<CR>")
vim.keymap.set("n", "<leader>cl", "<CMD>CLC<CR>")

-- quick fix list binds
vim.keymap.set("n", "<leader>lh", "<CMD>cw<CR>")
vim.keymap.set("n", "<leader>lo", "<CMD>copen<CR>")
vim.keymap.set("n", "<leader>lc", "<CMD>ccl<CR>")
vim.keymap.set("n", "<leader>ln", "<CMD>cn<CR>")
vim.keymap.set("n", "<leader>lp", "<CMD>cp<CR>")

-- Util function for cacnelling inputs
function Cancelled(input)
    if input == "" then
        print("cancelled");
        return true
    end
end

-- Create new file and open it in a new buffer
vim.keymap.set("n", "<leader>en", function()
    local filename = vim.fn.input("New File: ");
    if Cancelled(filename) then
        return
    end
    filename = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h") .. "/" .. filename;
    vim.cmd("e " .. filename)
end)
