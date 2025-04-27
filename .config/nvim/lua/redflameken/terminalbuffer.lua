---@module 'termbuf'
---@class TermBuf
---@field term_win_id integer id of the terminal buffer's window
---@field term_buf_id integer id of the terminal buffer
---@field term_win_heigth integer height of the terminal buffer's window
local M = {}

---@private
M.term_win_id = -1
---@private
M.term_buf_id = -1
---@private
M.term_win_height = 12

function M.create_terminal_buffer()
    vim.cmd("terminal");
    M.term_buf_id = vim.fn.bufnr()
    vim.api.nvim_buf_set_name(M.term_buf_id, "Terminal Buffer")
end

function M.open_term()
    vim.cmd(M.term_win_height .." split");
    M.term_win_id = vim.fn.win_getid()
    if M.term_buf_id == -1 then
        M.create_terminal_buffer()
    else
        vim.api.nvim_win_set_buf(M.term_win_id, M.term_buf_id)
    end
end

function M.close_term()
    M.term_win_height = vim.api.nvim_win_get_height(M.term_win_id)
    vim.api.nvim_win_close(M.term_win_id, false)
    M.term_win_id = -1
end

---@type function toggles the terminal buffer open and close
function M.toggle_term()
    if not vim.api.nvim_buf_is_valid(M.term_buf_id) then
        M.term_buf_id = -1;
        M.term_win_height = 12
    end
    if not vim.api.nvim_win_is_valid(M.term_win_id) then
        M.term_win_id = -1;
    end
    if M.term_win_id == -1 then
        M.open_term()
    else
        M.close_term()
    end
end

---@type function execute this to setup the TermBuf functionality
function M.start()
    vim.keymap.set("n", "<leader>t", M.toggle_term);
end

return M
