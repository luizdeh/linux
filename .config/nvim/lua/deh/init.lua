require("deh.settings")
require("deh.map")
require("deh.plugins")

-- clear whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
