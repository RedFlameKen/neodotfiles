
local function setBinds()
    vim.keymap.set("n", "<leader>tp", "<CMD>VimtexCompile<CR>")
    -- vim.cmd("VimtexCompile")
end

setBinds()

