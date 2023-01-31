require('telescope').setup {
    defaults = {
      wrap_results = true,
      file_ignore_patterns = { 'node_modules', '.pdf', '.mkv', '.mp4', '.png', '.jpg' }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
}

-- enable telescope fzf native
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

local themes = require('telescope.themes')

local opts = themes.get_dropdown {
  winblend = 10,
  previewer = false,
  shorten_path = false,
  border = true,
}

-- fuzzy search
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search current buffer' })

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'search git files' })
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, { desc = 'recently opened files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'buffers' })
