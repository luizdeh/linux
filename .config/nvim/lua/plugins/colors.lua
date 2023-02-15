return {
  -- nord
  -- 'arcticicestudio/nord-vim',
  -- name = 'nord',
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   vim.cmd('colorscheme nord')
  --   vim.cmd[[highlight Normal guibg=NONE ctermbg=NONE]]
  -- end
  -- everforest
  -- 'sainnhe/everforest',
  -- name = 'everforest',
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --  vim.g.everforest_transparent_background = 1
  --  vim.g.everforest_enable_italic = 1
  --  vim.g.everforest_better_performance = 1
  --  vim.cmd('colorscheme everforest')
  -- end
  -- grubox-material
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_foreground = 'material'
    vim.cmd('colorscheme gruvbox-material')
  end
}

