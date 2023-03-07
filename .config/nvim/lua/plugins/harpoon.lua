local M = {
  'theprimeagen/harpoon',
  keys = {
    { "<leader>a",
      function()
        require('harpoon.mark').add_file()
      end,
    },
    { "<C-e>",
      function()
        require('harpoon.ui').toggle_quick_menu()
      end,
    },
  },
}

M.opts = function()
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,
    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,
    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,
    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,
    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },
    -- set marks specific to each git branch inside git repository
    mark_branch = false,
  }
end

M.config = function()
  local harpoon = require('harpoon')

  harpoon.setup(opts)
  require('telescope').load_extension('harpoon')

  local ui = require('harpoon.ui')

  vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
  vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
  vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
  vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
  vim.keymap.set('n', '<A-p>', function() ui.nav_prev() end)
  vim.keymap.set('n', '<A-n>', function() ui.nav_next() end)
end

return M
