return {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      show_end_of_buffer = true, -- show the '~' characters after the end of buffers
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "italic" },
        properties = {},
        types = { "italic" },
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        neotree = true,
        fidget = true,
        harpoon = true,
        lsp_saga = true,
        mason = true,
        lsp_trouble = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
    -- vim.cmd([[highlight! NvimTreeOpenedFile guifg=#ffb732 gui=bold]])
    -- vim.cmd([[highlight! NvimTreeCursorLine guifg=#ffb732 gui=bold]])
    -- -- vim.cmd([[highlight NvimTreeOpenedFile guifg=#8beb60 gui=italic]])
    -- vim.cmd("highlight! IndentBlankLineChar guifg=#484a4a gui=nocombine")
    -- vim.cmd("highlight! IndentBlankLineContextChar guifg=#909495 gui=nocombine")
    -- vim.cmd("highlight! FidgetTask guifg=#5f6f67")
  end,
}
