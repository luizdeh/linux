return {
  "glepnir/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = false,
      },
      code_action_lightbulb = {
        sign = false,
        virtual_text = false,
      },
      outline = {
        win_position = "right",
        win_with = "",
        win_width = 35,
        preview_width = 0.4,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
          expand_or_jump = "o",
          quit = "q",
        },
      },
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
}
