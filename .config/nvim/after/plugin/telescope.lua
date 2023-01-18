require('telescope').setup {
    defaults = {
        file_ignore_patterns = { 'node_modules', '.pdf', '.mkv', '.mp4', '.png', '.jpg' }
    }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
