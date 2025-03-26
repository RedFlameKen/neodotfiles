local function buildProject(run, silent)
    run = run or false
    silent = silent or false

    local rootDirName = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local command = "make -C build"

    if run then
        command = command .. "& build/" .. rootDirName;
        if silent then
            command = command .. " &"
        end
    end
    vim.cmd(command)

end

vim.keymap.set("n", "<leader>lm", function() buildProject() end)

vim.keymap.set("n", "<leader>lr", function() buildProject(true) end)

vim.keymap.set("n", "<leader>lsr", function() buildProject(true, true) end)
