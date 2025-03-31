
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local html_lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
html_lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true


require("mason").setup({
})

require("mason-nvim-dap").setup({
    ensure_installed = { "codelldb" }
})

require('mason-lspconfig').setup({
    ensure_installed = {
        "jdtls",
        "clangd",
        "lua_ls",
    },
})

local kind_icons = {
    Method = "",
    Function = "󰊕",
    Variable = "",
    Snippet = "",
    Strucure = "",
    Class = "",
    Constructor = "",
    Field = "",
    Keyword = "",
    Enum = "󰘻",
    Value = "󰎠",
    Reference = "",
    Text = "󰦨",
    Constant = "󰏿",
    Interface = "󱘖",
    Property = "",
    Color = "",
}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local ls = require ("luasnip")

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
        end
    },
    sources = {
        {name = 'nvim_lsp_signature_help' },
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'cmp_luasnip'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
        {name = 'render-markdown' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-l>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
})

-- vim.api.nvim_create_autocmd("User", {
--     pattern = "Cmp",
--     callback = function ()
--         vim.opt_local.winborder = "none"
--         vim.api.nvim_create_autocmd("WinLeave", {
--             once = true,
--             callback = function ()
--                 vim.opt_local.winborder = "rounded"
--             end
--         })
--     end
-- })


