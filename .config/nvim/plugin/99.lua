local _99 = require("99")

local home = os.getenv("HOME")
local cwd = vim.uv.cwd()
local basename = vim.fs.basename(cwd)

_99.setup({

    provider = _99.Providers.OpenCodeProvider,
    -- model = "github-copilot/auto",
    model = "opencode/deepseek-v4.1-flash-free",
    logger = {
        level = _99.DEBUG,
        path = "/tmp/" .. basename .. ".99.debug",
        print_on_error = true,
    },
    completion = {

    },

    md_files = {
        "AGENT.md"
    },

    tmp_dir = "./tmp",
})

vim.keymap.set("v", "<leader>vv", function()
    _99.visual()
end)

vim.keymap.set("n", "<leader>vx", function()
    _99.stop_all_requests()
end)

vim.keymap.set("n", "<leader>vs", function()
    _99.search()
end)

vim.keymap.set("n", "<leader>vo", function()
    _99.open()
end)
