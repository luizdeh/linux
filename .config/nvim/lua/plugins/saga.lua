return {
  'glepnir/lspsaga.nvim',
  branch = 'main',
  event = 'BufRead',
  config = function()
    require('lspsaga').setup({
      ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "💡",
        incoming = " ",
        outgoing = " ",
        hover = ' ',
        -- colors = {
        --   normal_bg = 'NONE',
        --   title_bg = 'NONE',
        -- },
      },
      lightbulb = {
        enable = false,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },
      code_action = {
        keys = {
          quit = { '<Esc', 'q' },
        },
      },
      rename = {
        quit = '<Esc>',
        exec = '<CR>',
        mark = 'x',
        confirm = '<CR>',
        in_select = true,
      },
    })
  end,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-treesitter/nvim-treesitter' },
  },
}
