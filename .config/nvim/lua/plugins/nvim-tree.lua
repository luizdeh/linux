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
      },
      git = {
        enable = false,
        ignore = true,
      },
      hijack_unnamed_buffer_when_opening = false,
      hijack_cursor = true,
      update_cwd = true,
    })
  end,
}
