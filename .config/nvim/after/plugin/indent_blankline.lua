require('indent_blankline').setup {
    space_char_blankline = " ",
    char_highlight_list = { "IndentBlankLineIndent1" },
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
}

vim.cmd[[highlight IndentBlankLineIndent1 guifg=#465055 gui=nocombine]]
vim.cmd[[highlight IndentBlankLineContextChar guifg=#88c0d0 gui=nocombine]]