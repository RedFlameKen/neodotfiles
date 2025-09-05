local dap = require('dap')
local dapui = require('dapui')
local jdtls_dap = require('jdtls.dap');

-- dap.adapters.gdb = {
--   type = "executable",
--   command = "gdb",
--   args = { "-i", "dap" }
-- }
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "gdb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = "${workspaceFolder}",
--     stopAtBeginningOfMainSubprogram = false,
--   },
-- }

dap.adapters.codelldb = {
  type = 'server', port = "${port}",
  executable = {
    command = '/home/redflameken/.local/share/nvim/mason/packages/codelldb/codelldb',
    args = {"--port", "${port}"},
  }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    -- cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

dap.configurations.java = {
  {
    classPaths = {"lib/mysql-connector-j-9.1.0.jar:bin"},

    -- If using multi-module projects, remove otherwise.
    projectName = project_name,

    javaExec = "java",
    -- mainClass = "Main",

    name = "Launch " .. project_name,
    request = "launch",
    type = "java"
  },
}

dapui.setup();

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

local function closeSession()
    dapui.close()
    dap.close()
end

vim.keymap.set('n', '<F1>', function() dap.step_back() end)
vim.keymap.set('n', '<F2>', function() dap.step_out() end)
vim.keymap.set('n', '<F3>', function() dap.step_into() end)
vim.keymap.set('n', '<F4>', function() dap.step_over() end)
vim.keymap.set('n', '<F5>', function() dap.run_last() end)
vim.keymap.set('n', '<F6>', function() dap.continue() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set("n", "<Leader>dx", function() closeSession() end)
vim.keymap.set("n", "<Leader>dc", function() dapui.close() end)
vim.keymap.set("n", "<Leader>do", function() dapui.open() end)
vim.keymap.set("n", "<Leader>dd", function() dapui.toggle() end)
vim.keymap.set("n", "<Leader>di", function() dapui.eval() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>de', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
