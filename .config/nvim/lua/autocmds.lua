-- clear whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- yank highlight
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { timeout = 10 }
  end,
  group = highlight_group,
  pattern = '*',
})

-- auto format through prettier
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    --vim.cmd("EslintFixAll")
    vim.cmd("Neoformat prettier")
  end,
})
