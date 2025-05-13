vim.g.android_sdk_path = '~/libs/Android/'
vim.g.android_adb_tool = '~/libs/Android/platform-tools/adb'
vim.g.gradle_sync_on_load = 1
vim.g.gradle_set_classpath = 0
vim.g.gradle_set_classpath = 0

-- vim.g.gradle_glyph_error = ''
-- vim.g.gradle_glyph_warning = ''
-- vim.g.gradle_glyph_gradle = ''
-- vim.g.gradle_glyph_android = ''
-- vim.g.gradle_glyph_building = ''
--
vim.keymap.set("n", "<leader>lmm", ":AndroidBuild debug<CR>");
vim.keymap.set("n", "<leader>lmi", ":AndroidLaunch debug<CR>");
vim.keymap.set("n", "<leader>cp", ":AndroidLaunch debug<CR>");
vim.keymap.set("n", "<leader>lmrm", ":AndroidBuild release<CR>");
vim.keymap.set("n", "<leader>lmri", ":AndroidLaunch release<CR>");
vim.keymap.set("n", "<leader>lgc", ":GradleGenClassPathFile<CR>");
vim.keymap.set("n", "<leader>lgs", ":GradleSync<CR>");
