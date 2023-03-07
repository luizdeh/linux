return {
  {
    'sainnhe/everforest',
    enabled = true,
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
    end,
  },
}
