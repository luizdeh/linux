return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    { '<leader>t', ':NvimTreeToggle<CR>', { silent = true, desc = 'tree' } },
  },
  config = function()
    require('nvim-tree').setup({
      view = {
        width = 35,
        signcolumn = "yes",
      },
      filters = {
        custom = { "^.git$", "node_modules" }
      },
      git = {
        enable = true,
        ignore = true,
      },
      hijack_unnamed_buffer_when_opening = false,
      hijack_cursor = true,
      update_cwd = true,
      renderer = {
        highlight_opened_files = "all",
        icons = {
          git_placement = "signcolumn",
          padding = " ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          glyphs = {
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      }
    })
  end,
}
