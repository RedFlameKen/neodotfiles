local conform = require'conform'

local home = os.getenv"HOME"

conform.setup({
    formatters = {
        android_xml_formatter = {
            inherit = false,
            command = home .. "/libs/JavaTools/android_xml_formatter",
            args = { "--stdout", "$FILENAME" },
            stdin = true
        }
    },
    formatters_by_ft = {
        xml = {"android_xml_formatter"}
    }
})

vim.keymap.set("n", "<leader>ff", function()
    conform.format({})
end)
