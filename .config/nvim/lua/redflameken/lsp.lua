vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = {current_line = true},
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] ='',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
        }
    }
})

vim.o.winborder = 'rounded'

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP keybinds",
    callback = function()
        vim.keymap.set("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>")
        -- vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references);
    end
})

vim.lsp.config.clangd = {
    cmd = { 'clangd', '--background-index' },
    root_markers = { 'compile_commands.json', 'compile_flags.txt' },
    filetypes = { 'c', 'cpp' },
}

vim.lsp.enable({'clangd'})

