
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

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
    handlers = {
        -- function(server_name)
        --     require('lspconfig')[server_name].setup({
        --         capabilities = lsp_capabilities,
        --     })
        -- end,
        clangd = function()
            require('lspconfig').clangd.setup({
                capabilities = lsp_capabilities,
            })
        end,
        html = function()
            require('lspconfig').html.setup({
                capabilities = html_lsp_capabilities,
            })
        end,
        ts_ls = function()
            require('lspconfig').ts_ls.setup({
                -- capabilities = lsp_capabilities,
                -- cmd = { "typescript-language-server", "--stdio" },
                -- filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
                -- root_dir = function(fname)
                --     return util.root_pattern 'tsconfig.json'(fname)
                --     or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
                -- end,

            })
        end,
        bashls = function()
            require('lspconfig').bashls.setup({
                capabilities = lsp_capabilities,
            })
        end,
        cssls = function()
            require('lspconfig').cssls.setup({
                capabilities = lsp_capabilities,
            })
        end,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            -- version = 'LuaJIT',
                            version = 'Lua 5.4'
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                }
            })
        end,
    }

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


