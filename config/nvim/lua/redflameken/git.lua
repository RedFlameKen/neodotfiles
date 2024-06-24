local function commit()
    local message = vim.fn.input("Message: ", "")
    os.execute("git add .")
    os.execute("git commit -m \'" .. message .. "\'")
    ColorMyPencils()
end

vim.keymap.set("n", "<leader>gc", function() commit() end)
vim.keymap.set("n", "<leader>gl", "<CMD>!git log --reflog<CR>")
