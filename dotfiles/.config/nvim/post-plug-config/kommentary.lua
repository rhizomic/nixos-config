-- Add bindings
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default", {})

-- Prefer single line comments everywhere
require('kommentary.config').configure_language("default", {
    single_line_comment_string  = 'auto',
    prefer_single_line_comments = true,
    multi_line_comment_strings  = false,
})

require('kommentary.config').configure_language('typescriptreact', {
    single_line_comment_string  = "//",
    multi_line_comment_strings = {"{/*", "*/}"},
    prefer_single_line_comments = true,
  })

require('kommentary.config').configure_language('javascriptreact', {
    single_line_comment_string  = "//",
    multi_line_comment_strings = {"{/*", "*/}"},
    prefer_single_line_comments = true,
  })
