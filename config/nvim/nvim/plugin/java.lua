local jdtls = require('jdtls')

local home = os.getenv("HOME")

local function localProjectDir()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

    local workspace_dir = home .. '/Documents/JavaWorkspaces/' .. project_name
    return workspace_dir
end

function StartJavaServer()
    jdtls.start_or_attach({
        cmd = {
            home .. '/.local/share/nvim/mason/packages/jdtls/bin/jdtls',
            'java',
            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xmx1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
            '-data', localProjectDir(),
            '-jar', home .. '/.local/share/nvim/mason/packages/jdtls/org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar',
            '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
        },
        settings = {
            java = {
                import = {enabled = true},
                rename = {enabled = true},
            },
        },
        root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', ".classpath"}, { upward = true })[1]),
    })
end

vim.keymap.set("n", "<leader>jj", ":lua StartJavaServer()<CR>")
vim.keymap.set("n", "<leader>jc", ":lua require'jdtls'.compile({'full'})<CR>")

vim.keymap.set("n", "<leader>ji", ":lua require'jdtls'.organize_imports()<CR>")
vim.keymap.set("n", "<leader>jb", ":lua require'jdtls'.build_projects()<CR>")
