return {
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
  config = function()
    local harpoon = require('harpoon')

    harpoon.setup()

    require('telescope').load_extension('harpoon')

    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<A-p>', function() ui.nav_prev() end)
    vim.keymap.set('n', '<A-n>', function() ui.nav_next() end)

    local nmap = function(tbl)
      vim.keymap.set('n', tbl[1], tbl[2], tbl[3])
    end

    for i = 1, 9 do
      nmap {
        string.format('<leader>%s', i),
        function()
          require('harpoon.ui').nav_file(i)
        end,
      }
    end
  end
}
