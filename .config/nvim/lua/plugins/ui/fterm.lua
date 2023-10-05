return {
  "numToStr/FTerm.nvim",
  event = "VeryLazy",
  config = function()
    require("FTerm").setup({
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })
  end,
}
