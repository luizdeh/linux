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
