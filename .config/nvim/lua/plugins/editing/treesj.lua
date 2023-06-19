return {
  "Wansmer/treesj",
  event = "BufReadPost",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
    })
  end,
}
