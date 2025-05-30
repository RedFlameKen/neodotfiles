local jdtls = require('jdtls')

local home = os.getenv("HOME")

local function workspaceDir()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

    local workspace_dir = home .. '/.eclipse_workspaces/' .. project_name
    return workspace_dir
end

local cmp_nvim_lsp = require('cmp_nvim_lsp')

local jdtls_path = home ..  '/.local/share/nvim/mason/packages/jdtls'
local launcher_jar = jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar'

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

local root_files = {
    '.classpath',
    '.project',
    '.git',
    'pom.xml',
    'build.xml',
    'gradlew',
    'mvnw'
}
local config = {
    capabilities = capabilities,
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        -- '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1G',
        -- '--add-modules=ALL-SYSTEM',
        -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', launcher_jar,
        '-configuration', jdtls_path .. '/config_linux',
        '-data', workspaceDir(),
    },
    root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
    settings = {
        java = {
            -- jdt = {
            --     ls = {
            --         androidSupport = true
            --     },
            -- },
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-11",
                        path = "/usr/lib/jvm/java-11-openjdk/"
                    },
                    {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/java-17-openjdk/"
                    },
                    {
                        name = "JavaSE-21",
                        path = "/usr/lib/jvm/java-21-openjdk/"
                    },
                },
            },
            -- project = {
            --     referencedLibraries = {
            --     },
            -- },
            -- import = {
            --     gradle = {
            --         enabled = true,
            --         wrapper = {
            --             enabled = true
            --         }
            --     },
            -- },
            rename = {enabled = true},
        },
        -- references = {
        --     includeDecompiledSources = true,
        -- },
    },
    init_options = {
        bundles = {
            vim.fn.glob("/home/kenneth/git/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.0.jar", true)
        },
        extendedCapabilities = jdtls.extendedCapabilities,
    },
    -- capabilities = {
    --     workspace = {
    --         configuration = true;
    --     },
    -- },
    on_attach = function(client, bufnr)
        local opts = {silent = true, buffer = bufnr}
        -- vim.keymap.set("n", "<leader>js", StartJavaServer)
        vim.keymap.set("n", "<leader>jc", ":lua require'jdtls'.compile({'incremental'})<CR>")
        vim.keymap.set("n", "<leader>ji", jdtls.organize_imports, { desc = 'Organize Imports', buffer = bufnr})
        vim.keymap.set("n", "<leader>jb", jdtls.build_projects, { desc = 'Build Projects', buffer = bufnr})
        vim.keymap.set('n', '<leader>jev', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
        vim.keymap.set('v', '<leader>jem', "<CMD>lua jdtls.extract_method(true)<CR>", {desc = 'Extract method', buffer = bufnr})
        vim.keymap.set('n', '<leader>jec', jdtls.extract_constant, { desc = 'Extract constant', buffer = bufnr })

        vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
        vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
    end
}

jdtls.start_or_attach(config)

function StartJavaServer()
    jdtls.start_or_attach(config)
end

-- vim.g.ale_enabled = 1
-- vim.g.ale_java_eclipselsp_path = home .. "/git/eclipse.jdt.ls/"
-- vim.g.ale_java_eclipselsp_workspace_path = workspaceDir()

