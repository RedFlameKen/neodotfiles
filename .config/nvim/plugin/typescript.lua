
vim.keymap.set("n", "<leader>pc", function()
    vim.fn.system("tsc src/**/*.ts");
    print("compiled")
end)
