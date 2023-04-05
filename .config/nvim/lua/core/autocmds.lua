local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local highlight_group = augroup('YankHighlight', { clear = true })

-- clear whitespace
autocmd('BufWritePre', {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- yank highlight
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { timeout = 10 }
  end,
  group = highlight_group,
  pattern = '*',
})

-- auto format
autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- highlight current buffer in nvim-tree
local group = vim.api.nvim_create_augroup('HighlightThatShit', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    local is_tree_open = require('nvim-tree.view').is_visible()
    if (is_tree_open) then
      require('nvim-tree.api').tree.find_file()
    end
  end,
  group = group
})
