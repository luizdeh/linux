return {
  {
    'sainnhe/everforest',
    enabled = false,
    name = 'everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_transparent_background = 1
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
      vim.cmd('colorscheme everforest')
      -- vim.cmd [[highlight IndentBlankLineContextStart guisp=#909495 gui=underline]]
      vim.cmd [[highlight IndentBlankLineChar guifg=#484a4a gui=nocombine]]
      vim.cmd [[highlight IndentBlankLineContextChar guifg=#909495 gui=nocombine]]
      vim.cmd [[highlight NvimTreeCursorLine guifg=#a7c080 gui=bold]]
      vim.cmd [[highlight NvimTreeOpenedFile gui=italic]]
      vim.cmd [[highlight FidgetTask guifg=#5f6f67]]
    end,
  },
  {
    'arcticicestudio/nord-vim',
    enabled = false,
    name = 'nord',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_italic = true
      vim.g.nord_italic_comments = true
      vim.g.nord_uniform_status_line = true
      vim.g.nord_bold = true
      vim.cmd('colorscheme nord')
      vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
      -- vim.cmd [[highlight IndentBlankLineContextStart guisp=#909495 gui=underline]]
      vim.cmd [[highlight IndentBlankLineChar guifg=#484a4a gui=nocombine]]
      vim.cmd [[highlight IndentBlankLineContextChar guifg=#909495 gui=nocombine]]
      vim.cmd [[highlight NvimTreeOpenedFile guifg=#a7d933 gui=italic]]
      vim.cmd [[highlight NvimTreeCursorLine guifg=#a7c080 gui=bold]]
    end,
  },
  {
    'sainnhe/gruvbox-material',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd('colorscheme gruvbox-material')
      -- vim.cmd [[highlight IndentBlankLineContextStart guisp=#909495 gui=underline]]
      vim.cmd [[highlight IndentBlankLineChar guifg=#484a4a gui=nocombine]]
      vim.cmd [[highlight IndentBlankLineContextChar guifg=#909495 gui=nocombine]]
      vim.cmd [[highlight NvimTreeOpenedFile guifg=#a7d933 gui=italic]]
      vim.cmd [[highlight NvimTreeCursorLine guifg=#a7c080 gui=bold]]
      vim.cmd [[highlight FidgetTask guifg=#5f6f67]]
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        show_end_of_buffer = true, -- show the '~' characters after the end of buffers
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false,   -- Force no bold
        styles = {
          comments = { "italic" },
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = { "italic" },
          properties = {},
          types = { "italic" },
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false,
        },
      })
      vim.cmd('colorscheme catppuccin')
      vim.cmd [[highlight IndentBlankLineChar guifg=#484a4a gui=nocombine]]
      vim.cmd [[highlight IndentBlankLineContextChar guifg=#909495 gui=nocombine]]
      vim.cmd [[highlight NvimTreeOpenedFile guifg=#8beb60 gui=bold]]
      vim.cmd [[highlight NvimTreeCursorLine guifg=#ffb732 gui=bold]]
      -- vim.cmd [[highlight FidgetTask guifg=#5f6f67]]
    end,
  },
}
