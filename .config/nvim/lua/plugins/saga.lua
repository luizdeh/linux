return {
  'glepnir/lspsaga.nvim',
  branch = 'main',
  event = 'BufRead',
  config = function ()
    require('lspsaga').setup({})
  end
}
