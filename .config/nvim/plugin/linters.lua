vim.env.ESLINT_D_PPID = vim.fn.getpid()
local lint = require'lint'

lint.linters_by_ft = {
  html = {'htmlhint'},
  -- typescript = {'eslint_d'},
  -- javascript = {'eslint_d'},
}

vim.g.ale_linters_explicit = 1

vim.g.ale_linters = {
    xml = { "android", "xmllint" },
    java = { "android" },
    groovy = { "android" },
    kotlin = { "android" }
}

vim.g.ale_enabled = 0
vim.g.gradle_show_signs = 0

-- vim.g.ale_java_javalsp_executable = "~/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_linux.sh"
