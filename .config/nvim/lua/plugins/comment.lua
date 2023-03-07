return {
  'numToStr/Comment.nvim',
  keys = {
    { 'gc' },
    { 'gc', mode = 'v' },
  },
  config = function()
    require('Comment').setup()
  end
}
