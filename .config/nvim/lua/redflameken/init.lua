require("redflameken.packer")
require("redflameken.statusline")
require("redflameken.remap")
require("redflameken.git")
require("redflameken.autocommand")

ShowBranch = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.linebreak = true

vim.opt.scrolloff = 6

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.laststatus = 3
vim.opt.cursorline = true

vim.opt.updatetime = 60
vim.opt.lazyredraw = true

vim.opt.hlsearch = true

vim.opt.colorcolumn = {80}

vim.g.have_nerd_font = true

vim.opt.undofile = true

-- vim.g.c_syntax_for_h = 1
