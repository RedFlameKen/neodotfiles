vim.g.mapleader = " "

vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")
vim.keymap.set("n", "<M-h>", "<C-w>h", {silent = true});
vim.keymap.set("n", "<M-j>", "<C-w>j", {silent = true});
vim.keymap.set("n", "<M-k>", "<C-w>k", {silent = true});
vim.keymap.set("n", "<M-l>", "<C-w>l", {silent = true});

vim.keymap.set("i", "<C-BS>", "<C-w>", {noremap = true, silent = true})

vim.keymap.set("n", "Y", "yy")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set("n", "<leader>m", "<CMD>Mason<CR>")
vim.keymap.set("n", "<leader>cp", "<CMD>lua ColorMyPencils()<CR>")
vim.keymap.set("n", "<leader>ch", "<CMD>ColorHighlight<CR>")
vim.keymap.set("n", "<leader>cl", "<CMD>CLC<CR>")

vim.keymap.set("n", "<leader>hh", "<CMD>cw<CR>")
vim.keymap.set("n", "<leader>ho", "<CMD>copen<CR>")
vim.keymap.set("n", "<leader>hc", "<CMD>ccl<CR>")
vim.keymap.set("n", "<leader>hn", "<CMD>cn<CR>")
vim.keymap.set("n", "<leader>hp", "<CMD>cp<CR>")
vim.keymap.set("n", "<leader>hm", "<CMD>make -C build<CR>")

function Cancelled(input)
    if input == "" then
        print("cancelled");
        return true
    end
end

vim.keymap.set("n", "<leader>en", function()
    local filename = vim.fn.input("New File: ");
    if Cancelled(filename) then
        return
    end
    filename = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h") .. "/" .. filename;
    vim.cmd("e " .. filename)
end)
