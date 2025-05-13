vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = { current_line = true },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
        }
    }
})


vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP keybinds",
    callback = function()
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
        vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.signature_help {border = "rounded"} end)
        vim.keymap.set("n", "<leader>ld", function() require"telescope.builtin".diagnostics() end)
        vim.keymap.set("n", "grd", vim.lsp.buf.definition);
        vim.keymap.set("n", "grt", vim.lsp.buf.type_definition);
    end
})

vim.lsp.config.clangd = {
    cmd = { 'clangd', '--background-index' },
    root_markers = { 'compile_commands.json', 'compile_flags.txt' },
    filetypes = { 'c', 'cpp' },
}

vim.lsp.config['bashls'] = {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'bash', 'sh' },
}

vim.lsp.config['digestif'] = {
    cmd = { 'digestif' },
    filetypes = { 'tex', 'plaintex' },
}

vim.lsp.config.html = {
    cmd = { 'vscode-html-language-server', '--stdio' },
    root_markers = { '.htmlhintrc' },
    filetypes = { 'html' },
}

vim.lsp.config["jsonls"] = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json' },
}

vim.lsp.config['ts_ls'] = {
    cmd = { 'typescript-language-server', '--stdio' },
    root_markers = { 'eslint.config.js' },
    filetypes = { 'typescript', 'ts', 'javascript', 'js' },
    settings = {
        javascript = {
            validate = false
        },
        js = {
            validate = false
        }
    }
}

vim.lsp.config['cssls'] = {
    cmd = { 'vscode-css-language-server', '--stdio' },
    root_markers = { '.htmlhintrc' },
    settings = {
        css = {
            validate = true
        },
        less = {
            validate = true
        },
        scss = {
            validate = true
        }
    },
    filetypes = { 'css', 'scss' },
}

vim.lsp.config['css_variables'] = {
    cmd = { 'css-variables-language-server', '--stdio' },
    root_markers = { '.htmlhintrc' },
    settings = {
        cssVariables = {
            lookupFiles = {
                "**/*.css",
                "**/*.scss",
            }
        }
    },
    filetypes = { 'css', 'scss' },
}

vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            runtime = {
                version = 'Lua5.4',
                -- version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                }
            }
        }
    }
}

vim.lsp.enable({
    'clangd',
    'lua_ls',
    'html',
    'ts_ls',
    'cssls',
    'css_variables',
    'bashls',
    'digestif',
})

vim.lsp.enable('jdtls', false)

vim.keymap.set("n", "K", function() vim.lsp.buf.hover { border = "rounded" } end);
