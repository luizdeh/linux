return {
  "nvim-telescope/telescope.nvim",
  event = 'BufEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "   ",
        path_display = { 'smart' },
        dynamic_preview_title = true,
        wrap_results = true,
        file_ignore_patterns = { 'node_modules', '.pdf', '.mkv', '.mp4', '.png', '.jpg' },
        layout_strategy = 'horizontal',
        layout_config = {
          prompt_position = 'top',
          height = 0.8,
          width = 0.8,
        },
        sorting_strategy = 'ascending',
        winblend = 0,
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    })
  end,
}
