vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

vim.keymap.set("v", "<C-c>", "\"+y")
vim.keymap.set("i", "<C-BS>", "<C-w>")
-- vim.keymap.set("n", "<C-BS>", "bdw>")

-- vim.keymap.set("i", "[", "[]");
vim.keymap.set("n", "<leader>m", ":Mason<CR>")
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>")
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>")
vim.keymap.set("n", "<leader>cs", ":Copilot status<CR>")
vim.keymap.set("n", "<leader>ct", ":Copilot setup<CR>")

vim.keymap.set("n", "<leader>ch", ":lua ColorMyPencils()<CR>")


