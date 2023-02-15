return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    { '<leader>t', ':NvimTreeToggle<CR>', { silent = true, desc = 'tree' } },
  },
  config = function()
    require('nvim-tree').setup({
      view = {
        width = 35,
      },
      filters = {
        custom = { "^.git$", "node_modules" }
      }
    })
  end,
}
