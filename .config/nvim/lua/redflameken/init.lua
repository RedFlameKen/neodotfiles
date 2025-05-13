require("redflameken.packer")
require("redflameken.statusline")
require("redflameken.lsp")
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

vim.opt.signcolumn = 'yes:1'

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

vim.opt.splitbelow = true
vim.opt.undofile = true

vim.g.have_nerd_font = true
vim.g.c_syntax_for_h = 1

---@class TermBufConfig
local termbuf_conf = {
    default_win_height = 12
}

require("redflameken.termbuf").setup(termbuf_conf)

---@class NoteConfig
local note_conf = {
    main_note_file = "~/docs/notes/todo.md",
    notes_dir = "~/docs/notes"
}
require("redflameken.note-buf").setup(note_conf)
