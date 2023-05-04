return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dash = require("dashboard")
    dash.setup({
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        packages = { enable = true },
        project = {
          enable = false,
          limit = 4,
        },
        disable_move = true,
        shortcut_type = "number",
        shortcut = {
          {
            desc = "Update ",
            group = "@property",
            action = "Lazy update",
            key = "u",
          },
          {
            -- icon = ' ',
            icon_hl = "@variable",
            desc = "Files ",
            group = "Number",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = "History ",
            group = "Label",
            action = "Telescope oldfiles",
            key = "h",
          },
        },
        footer = { " " },
      },
    })
  end,
}
