---@module 'termbuf'
---@class TermBuf
---@field term_win_id integer id of the terminal buffer's window
---@field term_buf_id integer id of the terminal buffer
---@field term_win_heigth integer height of the terminal buffer's window
local M = {
    term_win_id = -1,
    term_buf_id = -1,
    term_win_height = 0
}

---@class TermBufConfig
---@field default_win_height integer the default user-configurable height
M.config = {
    default_win_height = 12;
}

---Creates a new terminal buffer
function M.create_terminal_buffer()
    M.term_buf_id = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_call(M.term_buf_id, vim.cmd.term)
    vim.api.nvim_buf_set_name(M.term_buf_id, "Terminal Buffer")
end

---Opens a new terminal window and creates a new terminal buffer using create_terminal_buffer
---
---@see TermBuf.create_terminal_buffer
function M.open_term()
    if M.term_buf_id == -1 then
        M.create_terminal_buffer()
    end
    M.term_win_id = vim.api.nvim_open_win(M.term_buf_id, true,
    {
        split = 'below',
        height = M.term_win_height
    })
end

---Closes the terminal window. This function does not close the terminal buffer
function M.close_term()
    M.term_win_height = vim.api.nvim_win_get_height(M.term_win_id)
    vim.api.nvim_win_close(M.term_win_id, false)
    M.term_win_id = -1
end

---Toggles the terminal buffer open and close. Corrects any incorrect buffer/window ids
---
---@see TermBuf.open_term
---@see TermBuf.close_term
function M.toggle_term()
    if not vim.api.nvim_buf_is_valid(M.term_buf_id) then
        M.term_buf_id = -1;
        M.term_win_height = M.config.default_win_height
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
---@param config? table optional config table
function M.setup(config)
    M.config = config or {
        default_win_height = 12
    }
    M.term_win_height = M.config.default_win_height
end

return M
