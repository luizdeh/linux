local M = {
  'RRethy/vim-illuminate',
  event = 'VeryLazy',
}

M.opts = {
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
}

M.config = function(_, opts)
  require('illuminate').configure(opts)
  vim.cmd[[hi IlluminatedWordText guibg=#48584d guifg=#ffffff gui=nocombine]]
  vim.cmd[[hi IlluminatedWordRead guibg=#48584d guifg=#ffffff gui=nocombine]]
  vim.cmd[[hi IlluminatedWordWrite guibg=#48584d guifg=#ffffff gui=nocombine]]
end

return M
