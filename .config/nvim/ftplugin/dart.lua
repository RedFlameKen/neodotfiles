vim.b.ale_enabled = 1
vim.b.completion_enabled = 1
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set("n", "<leader>cp", "<CMD>!kill -SIGUSR1 $(pgrep -f '[f]lutter_tools.*run')<CR>")
