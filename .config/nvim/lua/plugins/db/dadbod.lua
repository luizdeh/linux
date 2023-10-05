return {
  "tpope/vim-dadbod",
  event = "VeryLazy",
  requires = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  config = function()
    require("config.dadbod").setup()
  end,
}
