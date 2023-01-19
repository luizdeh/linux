local key = vim.keymap.set
local silent = { silent = true }

-- source open file
key("n", "<leader>%", ":so %<CR>", silent)

-- close buffer
local bufdel = function()
  require('bufdelete').bufdelete(0,true)
end
key("n", "<leader>c", bufdel )

-- move lines
key("v", "K", ":m '<-2<CR>gv=gv")
key("v", "J", ":m '>+1<CR>gv=gv")
key("n", "<C-j>", ":m +1<CR>", silent)
key("n", "<C-k>", ":m -2<CR>", silent)
key("n", "J", "mzJ`z")

-- vertical movemene
key("n", "<C-d>", "<C-d>zz")
key("n", "<C-u>", "<C-u>zz")
key("n", "n", "nzzzv")
key("n", "N", "Nzzzv")

-- close view
key('n', '<leader>x', ':hid<CR>')

-- nvim tree
key('n', '<leader>t', ':NvimTreeToggle<CR>', silent)

-- undotree
key("n", "<leader>u", ":UndotreeToggle<CR>", silent)

-- greatest remap ever
key("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
key({ "n", "v" }, "<leader>y", [["+y]])
key("n", "<leader>Y", [["+Y]])

key({ "n", "v" }, "<leader>d", [["_d]])

-- this is going to get me cancelled
key("i", "<C-c>", "<Esc>")

-- misc
key("n", "Q", "<nop>")
-- key("n", "<leader>f", vim.lsp.buf.format)

-- quickfix list
-- key("n", "<C-k>", ":cnext<CR>zz")
-- key("n", "<C-j>", ":cprev<CR>zz")

-- location list
-- key("n", "<leader>k", ":lnext<CR>zz")
-- key("n", "<leader>j", ":lprev<CR>zz")

--key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--key("n", "<leader>x", ":!chmod +x %<CR>", { silent = true })
