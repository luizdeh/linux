return {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>c",
      function()
        require("bufdelete").bufdelete(0, true)
      end,
    },
  },
}
