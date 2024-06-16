vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

vim.keymap.set("v", "<C-c>", "\"+y")
vim.keymap.set("i", "<C-BS>", "<C-w>", {noremap = true, silent = true})
-- vim.keymap.set("n", "<C-BS>", "bdw>")
-- vim.keymap.set("i", "[", "[]");
vim.keymap.set("n", "<leader>m", ":Mason<CR>")
vim.keymap.set("n", "<leader>cp", ":lua ColorMyPencils()<CR>")
vim.keymap.set("n", "<leader>ch", ":ColorHighlight<CR>")

