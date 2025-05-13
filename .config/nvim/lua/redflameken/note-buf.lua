---@module "note-buf"
---@class NoteUtil
---@field note_buf_id integer This will store the buffer id of the todo file
---@field note_win_id integer This will store the window id of the notes window
local M = {}

---@private
M.note_buf_id = -1
---@private
M.last_buf_id = -1

---@class NoteConfig
---@field main_note_file string The file to open when opening a notes buffer
---@field notes_dir string The directory in which the user's notes are located
M.config = {}

---@private
M.config.main_note_file = ""
M.config.notes_dir = ""

--- Opens the note buffer
function M.open_buffer()
    M.last_buf_id = vim.fn.bufnr()
    vim.cmd("e " .. M.config.main_note_file)
    M.note_buf_id = vim.fn.bufnr()
end

--- Closes the note buffer
function M.close_buffer()
    vim.api.nvim_buf_delete(M.note_buf_id, {})
    M.note_buf_id = -1
    if vim.api.nvim_buf_is_valid(M.last_buf_id) then
        vim.api.nvim_win_set_buf(0, M.last_buf_id)
    end
    M.last_buf_id = -1
end

---Toggles the note buffer
---
---@see NoteUtil.open_buffer
---@see NoteUtil.close_buffer
function M.toggle_buffer()
    if not vim.api.nvim_buf_is_valid(M.note_buf_id) then
        M.note_buf_id = -1
    end
    if M.note_buf_id == -1 then
        M.open_buffer()
    else
        M.close_buffer()
    end
end

---Finds a note within the NoteUtil.config.notes_dir directory
---
---@see NoteConfig.notes_dir
function M.find_note()
    require("telescope.builtin").find_files({cwd = M.config.notes_dir})
end

---@param opts? NoteConfig
function M.setup(opts)
    M.config = opts or {}
end

return M
