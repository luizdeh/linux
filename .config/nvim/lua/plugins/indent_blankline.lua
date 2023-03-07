return {
  "lukas-reineke/indent-blankline.nvim",
  event = 'BufReadPost',
  opts = {
    space_char_blankline = " ",
    -- char = "| ",
    -- char_highlight_list = {
    --   "IndentBlankLineIndent1",
    --   "IndentBlankLineContextChar",
    --   "IndentBlankLineContextStart"
    -- },
    -- space_char_highlight_list = {
    --   "IndentBlankLineIndent1",
    --   "IndentBlankLineContextChar",
    --   "IndentBlankLineContextStart"
    -- },
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = false,
    show_current_context_start_on_current_line = true,
    show_end_of_line = true,
    use_treesitter_scope = true,
    filetype_exclude = {
      'help',
      'NvimTree',
      'mason.nvim',
      'TelescopePromt',
      'TelescopeResults',
      'lspinfo',
      'checkhealth',
    },
  },
}
