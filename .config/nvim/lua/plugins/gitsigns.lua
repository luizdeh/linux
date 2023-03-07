return {
  'lewis6991/gitsigns.nvim',
  event = "BufReadPost",
  config = function()
    require('gitsigns').setup({
      numhl = true,
      signcolumn = true,
    })
  end,
}
