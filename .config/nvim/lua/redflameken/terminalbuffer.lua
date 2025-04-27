local term_win_id = -1
local term_buf_id = -1
local term_win_height = 12

local function create_terminal_buffer()
    vim.cmd("terminal");
    term_buf_id = vim.fn.bufnr()
    vim.api.nvim_buf_set_name(term_buf_id, "Terminal Buffer")
end

local function open_term()
    vim.cmd(term_win_height .." split");
    term_win_id = vim.fn.win_getid()
    if term_buf_id == -1 then
        create_terminal_buffer()
    else
        vim.api.nvim_win_set_buf(term_win_id, term_buf_id)
    end
end

local function close_term()
    term_win_height = vim.api.nvim_win_get_height(term_win_id)
    vim.api.nvim_win_close(term_win_id, false)
    term_win_id = -1
end

local function toggle_term()
    if not vim.api.nvim_buf_is_valid(term_buf_id) then
        term_buf_id = -1;
        term_win_height = 12
    end
    if not vim.api.nvim_win_is_valid(term_win_id) then
        term_win_id = -1;
    end
    if term_win_id == -1 then
        open_term()
    else
        close_term()
    end
end

vim.keymap.set("n", "<leader>t", toggle_term);

