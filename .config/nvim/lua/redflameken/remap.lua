vim.g.mapleader = " "

vim.keymap.set("n", "<M-h>", "<C-w>h", {silent = true});
vim.keymap.set("n", "<M-j>", "<C-w>j", {silent = true});
vim.keymap.set("n", "<M-k>", "<C-w>k", {silent = true});
vim.keymap.set("n", "<M-l>", "<C-w>l", {silent = true});

vim.keymap.set("v", "<C-c>", "\"+y")
vim.keymap.set("i", "<C-BS>", "<C-w>", {noremap = true, silent = true})

vim.keymap.set("n", "Y", "_y$")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set("n", "<leader>m", "<CMD>Mason<CR>")
vim.keymap.set("n", "<leader>cp", "<CMD>lua ColorMyPencils()<CR>")
vim.keymap.set("n", "<leader>ch", "<CMD>ColorHighlight<CR>")

vim.keymap.set("n", "<leader>hh", "<CMD>cw<CR>")
vim.keymap.set("n", "<leader>ho", "<CMD>copen<CR>")
vim.keymap.set("n", "<leader>hc", "<CMD>ccl<CR>")
vim.keymap.set("n", "<leader>hn", "<CMD>cn<CR>")
vim.keymap.set("n", "<leader>hp", "<CMD>cp<CR>")
vim.keymap.set("n", "<leader>hm", "<CMD>make -C build<CR>")

