local key = vim.keymap.set
local opts = { noremap = true, silent = true }

-- exit insert mode
key("i", "<C-c>", "<Esc>")

-- source open file
key("n", "<leader>%", ":so %<CR>", opts)

-- close buffer
local bufdel = function()
  require('bufdelete').bufdelete(0,true)
end
key("n", "<leader>c", bufdel)

-- close view
key('n', '<leader>x', ':hid<CR>', opts)

-- move lines
key("v", "K", ":m '<-2<CR>gv=gv", opts)
key("v", "J", ":m '>+1<CR>gv=gv", opts)
key("n", "<C-j>", ":m +1<CR>", opts)
key("n", "<C-k>", ":m -2<CR>", opts)
key("n", "J", "mzJ`z", opts)

-- vertical movemene
key("n", "<C-d>", "<C-d>zz")
key("n", "<C-u>", "<C-u>zz")
key("n", "n", "nzzzv")
key("n", "N", "Nzzzv")

-- resizes
key("n", "<C-Up>", ":resize +2<CR>", opts)
key("n", "<C-Down>", ":resize -2<CR>", opts)
key("n", "<C-Left>", ":vertical resize -2<CR>", opts)
key("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- start search and substitute for [current line], [file] and [open buffers]
key("n", "<leader>sc", ":s/", opts)
key("n", "<leader>sf", ":%s/", opts)
key("n", "<leader>so", ":bufdo %s/", opts)

-- greatest remap ever
key("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
key({ "n", "v" }, "<leader>y", [["+y]])
key("n", "<leader>Y", [["+Y]])

-- delete without copying
key({ "n", "v" }, "<leader>d", [["_d]])

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

-- chmod
key("n", "<leader>X", ":!chmod +x %<CR>", { silent = true })

-- nvim tree
key('n', '<leader>t', ':NvimTreeToggle<CR>', opts)

-- undotree
key("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- json
key("n", "<leader>js", ":%!jq .<CR>", opts)
