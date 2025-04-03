
local function keybinds()
    vim.keymap.set("n", "<leader>cx", ":s/\\[ \\]/\\[x\\]/<CR>")
    vim.keymap.set("n", "<leader>cu", ":s/\\[x\\]/\\[ \\]/<CR>")
end

keybinds()
