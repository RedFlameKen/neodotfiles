vim.env.ESLINT_D_PPID = vim.fn.getpid()
local lint = require'lint'

lint.linters_by_ft = {
  html = {'htmlhint'},
  -- typescript = {'eslint_d'},
  -- javascript = {'eslint_d'},
}

