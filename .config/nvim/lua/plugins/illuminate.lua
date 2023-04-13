return {
  'RRethy/vim-illuminate',
  event = 'BufReadPost',
  config = function()
    require('illuminate').configure({
      delay = 200,
      filetypes_denylist = {
        'NvimTree'
      },
      providers = {
        'treesitter',
        'lsp',
        'regex',
      },
      modes_allowlist = { 'n' },
      min_count_to_highlight = 2,
    })
    -- vim.cmd [[hi IlluminatedWordText guibg=#a7c080 guifg=#424c33 gui=nocombine]]
    -- vim.cmd [[hi IlluminatedWordText guibg=#a7c080 guifg=#424c33 gui=nocombine]]
    -- vim.cmd [[hi IlluminatedWordRead guibg=#a7c080 guifg=#424c33 gui=nocombine]]
    vim.cmd [[hi IlluminatedWordWrite guifg=#ff71ce gui=bold]]
    vim.cmd [[hi IlluminatedWordRead  guifg=#ff71ce gui=bold]]
    vim.cmd [[hi IlluminatedWordWrite guifg=#ff71ce gui=bold]]
  end,
}
