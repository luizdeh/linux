local M = {
  'theprimeagen/harpoon',
  lazy = false,
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
    { "<leader>z", ":Telescope harpoon marks<CR>" },
    { "<C-h>", function() ui.nav_file(1) end },
    { "<C-t>", function() ui.nav_file(2) end },
    { "<C-n>", function() ui.nav_file(3) end },
    { "<C-s>", function() ui.nav_file(4) end },
    { "<A-p>", function() ui.nav_prev() end },
    { "<A-n>", function() ui.nav_next() end },
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
end

return M
