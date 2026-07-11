-- require'nvim-treesitter'.setup {
--     sync_install = false,
--     auto_install = true,
-- }

local parsers_to_install = {
    "javascript",
    "cpp",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query"
}

require'nvim-treesitter'.install(parsers_to_install)

vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function(e)
        if vim.treesitter.get_parser(e.buf) ~= nil then
            vim.treesitter.start(e.buf)
        end
    end
})

require'treesitter-context'.setup({
    enable = true,
    max_lines = 1
})

vim.keymap.set("n", "[c", function()
    require'treesitter-context'.go_to_context(vim.v.count1)
end)
