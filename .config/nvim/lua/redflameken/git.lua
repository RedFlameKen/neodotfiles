---@class GitUtils
local M = {}

--- This method will stage the current file in the buffer
---@param file_name? string if no file_name is provided, the current file in the buffer is used
function M.stage(file_name)
    file_name = file_name or vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
    os.execute("git add " .. file_name)
end

--- This method will unstage the current file in the buffer
---@param file_name? string if no file_name is provided, the current file in the buffer is used
function M.unstage(file_name)
    file_name = file_name or vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
    os.execute("git restore --staged " .. file_name)
end

--- This method checks if there are currently staged changes
function M.has_diff()
    if vim.fn.system("git status --porcelain") ~= "" then
        return true
    end
    return false
end

--- This method will commit the current staged changes
---@param files? table | string
function M.commit(files)
    local files_type = type(files)
    local message = vim.fn.input("Message: ")
    if Cancelled(message) then
        return
    end
    if not M.has_diff then
        print("There is nothing to commit")
        return
    end
    if files ~= nil then
        if files_type == "table" then
            for _, v in pairs(files) do
                M.stage(v)
            end
        else
            M.stage(files)
        end
    end
    os.execute('git commit -m \"' .. message .. '\"')
end

--- This method will stage the current working directory and commit it
function M.commit_all()
    local message = vim.fn.input("Message: ")
    if Cancelled(message) then
        return
    end
    M.stage(".")
    os.execute('git commit -m \"' .. message .. '\"')
    -- ColorMyPencils()
end

--- This method will commit stage the current file in the buffer and commit it
function M.commit_current_file()
    local message = vim.fn.input("Message: ")
    if Cancelled(message) then
        return
    end
    M.stage()
    os.execute('git commit -m \"' .. message .. '\"')
    -- ColorMyPencils()
end

--- This method will create a new branch
function M.branch()
    local branchName = vim.fn.input{}
    if Cancelled(branchName) then
        return
    end
    os.execute("git branch " .. branchName)
    -- ColorMyPencils()
end

--- This method will switch to the provided branch
function M.checkout()
    local branchName = vim.fn.input{prompt = "Checkout > ", completion = "history"}
    if Cancelled(branchName) then
        return
    end
    os.execute("git checkout " .. branchName)
    -- ColorMyPencils()
end

--- This method will push the project to the default remote
function M.push()
    vim.cmd("!git push")
    -- ColorMyPencils()
end

function M.show_staged()
    vim.cmd("!git diff --name-only --staged")
end

function M.setup()
end

return M
