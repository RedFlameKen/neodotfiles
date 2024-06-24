local ls = require ("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.keymap.set({"i", "s"}, "<A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true}
)

vim.keymap.set({"i", "s"}, "<A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, {silent = true}
)

ls.add_snippets("cpp", {
    s("cmain", {
        t({
            '#include <iostream>',
            '',
            'using std::cout;',
            'using std::cin;',
            'using std::endl;',
            'using std::string;',
            '',
            'int main(){',
            '\t',
        }),
        i(1),
        t({
            '',
            '\treturn 0;',
            '}',
        }),
    }),
    s("func", {
        i(1, "type"), t(" "), i(2, "name"), t("("), i(3), t({") {", "\t"}),
        i(4),
        t({'', "}"})
    }),
    s("protofunc", {
        i(1, "type"), t(" "), i(2, "name"), t("("), i(3), t({");"}),
    }),
})

ls.add_snippets("lua", {
    s("vimluamap", {
        t('vim.keymap.set("n", "<leader>'),
        i(1),
        t('", ":lua '),
        i(2),
        t('<CR>")'),
    })
})

ls.add_snippets("lua", {
    s("vimkeymap", {
        t('vim.keymap.set("'),
        i(1),
        t('", "'),
        i(2),
        t('", "'),
        i(3),
        t('")'),
    })
})
