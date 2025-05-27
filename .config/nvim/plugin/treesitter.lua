require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "javascript",
        "cpp",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query"
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
    },
}

require'treesitter-context'.setup({
    enable = true,
    max_lines = 1
})

vim.keymap.set("n", "[c", function()
    require'treesitter-context'.go_to_context(vim.v.count1)
end)
