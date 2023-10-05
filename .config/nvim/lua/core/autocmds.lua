local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local highlight_group = augroup("YankHighlight", { clear = true })

local markdown_group = augroup("Markdown", { clear = true })

-- clear whitespace
autocmd("BufWritePre", {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- yank highlight
autocmd("TextYankPost", {
  group = highlight_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 250 })
  end,
})

-- auto format
autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  -- group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd("FileType", {
  pattern = { "*.md" },
  group = markdown_group,
  command = "setlocal wrap",
})

-- -- highlight current buffer in nvim-tree
-- local group = vim.api.nvim_create_augroup("HighlightThatShit", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     local is_tree_open = require("nvim-tree.view").is_visible()
--     if is_tree_open then
--       require("nvim-tree.api").tree.find_file()
--     end
--   end,
--   group = group,
-- })
