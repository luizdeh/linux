return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  dependencies = {
    "tpope/vim-rhubarb", -- GitHub support.
    -- 'shumphrey/fugitive-gitlab.vim', -- GitLab support.
  },
  cmd = { "Git" },
}
