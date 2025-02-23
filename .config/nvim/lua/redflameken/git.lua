-- local function cancelled(input)
--     if input == "" then
--         print("cancelled");
--         return true
--     end
-- end

local function commit()
    local message = vim.fn.input("Message: ")
    if Cancelled(message) then
        return
    end
    os.execute("git add .")
    os.execute('git commit -m \"' .. message .. '\"')
    ColorMyPencils()
end

local function branch()
    local branchName = vim.fn.input{prompt = "Branch > ", completion = "history"}
    if Cancelled(branchName) then
        return
    end
    os.execute("git branch " .. branchName)
    os.execute("git checkout " .. branchName)
    ColorMyPencils()
end

local function checkout()
    local branchName = vim.fn.input{prompt = "Checkout > ", completion = "history"}
    if Cancelled(branchName) then
        return
    end
    os.execute("git checkout " .. branchName)
    ColorMyPencils()
end

local function push()
    os.execute("git push")
    ColorMyPencils()
end

vim.keymap.set("n", "<leader>gc", commit)
vim.keymap.set("n", "<leader>gl", "<CMD>!git log --reflog<CR>")
vim.keymap.set("n", "<leader>ge", checkout)
vim.keymap.set("n", "<leader>gb", branch)
vim.keymap.set("n", "<leader>gp", push)
vim.keymap.set("n", "<leader>gs", ":lua ShowBranch = not ShowBranch <CR>")
