-- vim.api.nvim_create_autocmd( {"BufEnter", "BufWritePost"}, {
--     callback = function()
--         require'lint'.try_lint("eslint_d")
--     end
-- })
vim.o.tabstop = 2
vim.o.shiftwidth = 2
