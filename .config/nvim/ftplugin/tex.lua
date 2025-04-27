vim.g.vimtex_view_method = "zathura"

vim.g.vimtex_compiler_latexmk_engines = {
    _ = "-xelatex"
}

vim.keymap.set("n", "<leader>cp", "<CMD>VimtexCompile<CR>")

