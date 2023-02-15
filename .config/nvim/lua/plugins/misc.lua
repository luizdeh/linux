return {
  'famiu/bufdelete.nvim',
  'tpope/vim-repeat',
  'ap/vim-css-color',
  'lewis6991/gitsigns.nvim',
  'BurntSushi/ripgrep',
  'mbbill/undotree',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
}
