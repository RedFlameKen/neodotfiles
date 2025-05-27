
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local html_lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
html_lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true


require("mason").setup({
})

require("mason-nvim-dap").setup({
    ensure_installed = { "codelldb" }
})

require('mason-lspconfig').setup({
    automatic_enable = {
        exclude = {"jdtls"}
    },
    ensure_installed = {
        "clangd",
        "lua_ls",
        "ts_ls",
        "cssls",
        "css_variables",
        "html",
        "bashls",
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
    Unit = "󰘻",
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

local function cmp_toggle_docs()
    if cmp.visible_docs() then
        cmp.close_docs()
    else
        cmp.open_docs()
    end
end

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
        {name = 'ale'},
        {name = 'path'},
        {name = 'cmp_luasnip'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
        {name = 'render-markdown' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<M-k>'] = cmp.mapping.scroll_docs(-2),
        ['<M-j>'] = cmp.mapping.scroll_docs(2),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-d>'] = cmp_toggle_docs,
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-l>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
})

