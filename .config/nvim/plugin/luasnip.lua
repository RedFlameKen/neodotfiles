local ls = require("luasnip")
local extra = require("luasnip.extras")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node
local r = ls.restore_node
local rep = extra.rep

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

vim.keymap.set({"i", "s"}, "<A-l>", function() ls.expand() end, {silent = true})

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
    s("ifndef", {
        t({'#ifndef '}), i(1, "MACRO"),
        t({'', '#define '}), rep(1), t({'', ''}),
        i(2),
        t({'', '#endif'})
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

ls.add_snippets("java", {

    s("promptInt", {
        t({
            'public static int promptInt(String prompt){',
            '\tint out = 0;',
            '\twhile(true){',
            '\t\ttry {',
            '\t\t\tScanner sc = new Scanner(System.in);',
            '\t\t\tSystem.out.print(prompt);',
            '\t\t\tout = sc.nextInt();',
            '\t\t\tbreak;',
            '\t\t} catch (InputMismatchException e){',
            '\t\t\tSystem.out.println("Numeric inputs only, Try Again!");',
            '\t\t} catch (Exception e){',
            '\t\t\tSystem.out.println(e.getMessage());',
            '\t\t}',
            '\t}',
            '\treturn out;',
            '}',
        }),
    }),

    s("printf", {
        t('System.out.printf("'), i(1), t('");')
    }),

    s("printfn", {
        t('System.out.printf("'), i(1), t('\\n");')
    }),

    s("promptDouble", {
        t({
            'private double promptDouble(String prompt){',
            '\tdouble out = 0;',
            '\twhile(true){',
            '\t\ttry {',
            '\t\t\tScanner sc = new Scanner(System.in);',
            '\t\t\tSystem.out.print(prompt);',
            '\t\t\tout = sc.nextDouble();',
            '\t\t\tbreak;',
            '\t\t} catch (InputMismatchException e){',
            '\t\t\tSystem.out.println("Numeric inputs only, Try Again!");',
            '\t\t} catch (Exception e){',
            '\t\t\tSystem.out.println(e.getMessage());',
            '\t\t}',
            '\t}',
            '\treturn out;',
            '}',
        }),
    }),

    s("promptString", {
        t({
            'public static String promptString(String prompt){',
            '\tString out = "";',
            '\twhile(true){',
            '\t\ttry {',
            '\t\t\tScanner sc = new Scanner(System.in);',
            '\t\t\tSystem.out.print(prompt);',
            '\t\t\tout = sc.nextLine();',
            '\t\t\tbreak;',
            '\t\t} catch (Exception e){',
            '\t\t\tSystem.out.println(e.getMessage());',
            '\t\t}',
            '\t}',
            '\treturn out;',
            '}',
        }),
    }),

})

