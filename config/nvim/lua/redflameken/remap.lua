vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

vim.keymap.set("v", "<C-c>", "\"+y")
vim.keymap.set("i", "<C-BS>", "<C-w>", {noremap = true, silent = true})

vim.keymap.set("n", "Y", "_y$")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>m", "<CMD>Mason<CR>")
vim.keymap.set("n", "<leader>cp", "<CMD>lua ColorMyPencils()<CR>")
vim.keymap.set("n", "<leader>ch", "<CMD>ColorHighlight<CR>")

function SourceTmux()
    os.execute("tmux source ~/.config/tmux/tmux.conf")
end
