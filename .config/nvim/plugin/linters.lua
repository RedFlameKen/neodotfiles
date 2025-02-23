local lint = require'lint'


lint.linters_by_ft = {
  html = {'htmlhint'},
  javascript = {'eslint_d'},
}

-- local htmlhint = lint.linters.htmlhint
-- htmlhint.args = {
--     "--config",
--     "~/.config/htmlhint/htmlhint.conf",
-- }

