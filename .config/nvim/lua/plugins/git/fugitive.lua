return {
  'tpope/vim-fugitive',
  dependencies = {
    'tpope/vim-rhubarb', -- GitHub support.
    -- 'shumphrey/fugitive-gitlab.vim', -- GitLab support.
  },
  cmd = { 'Git' },
  keys = {
    { '<Leader>gg', ':Git<Space>', desc = 'Input commmand' },
    { '<Leader>gb', '<Cmd>Git blame<CR>', desc = 'Blame' },
    { '<Leader>gs', '<Cmd>vertical Git<CR>', desc = 'Status' },
  },
}
