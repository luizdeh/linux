return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { 'smart' },
        dynamic_preview_title = true,
        wrap_results = true,
        file_ignore_patterns = { 'node_modules', '.pdf', '.mkv', '.mp4', '.png', '.jpg' },
        layout_strategy = 'horizontal',
        layout_config = {
          height = 0.9,
          prompt_position = 'bottom',
          width = 0.9,
        },
        sorting_strategy = 'ascending',
        wainblend = 10,
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
