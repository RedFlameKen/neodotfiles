vim.g.vimtex_view_method = "zathura"

vim.g.vimtex_compiler_latexmk_engines = {
    _ = "-xelatex"
}

vim.g.vimtex_compiler_latexmk = {
    out_dir = "output",
    aux_dir = "output/aux",
    continuous = 0,
    options = {
        "-bibtex",
        -- "-bibfudge output"
    }
}

vim.keymap.set("n", "<leader>cp", "<CMD>VimtexCompile<CR>")

