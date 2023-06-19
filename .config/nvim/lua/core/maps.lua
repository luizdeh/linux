local key = vim.keymap.set

local function opts(desc)
  return { desc = "map: " .. desc, noremap = true, silent = true }
end

-- remap Q to nothing
key("n", "Q", "<nop>")

-- disable right mouse click
key({ "n", "v", "x" }, "<RightMouse>", "<nop>")

-- remap saving a file
key({ "n", "v", "x" }, "<leader>w", ":w<CR>", opts("save file"))

-- exit insert mode
key("i", "<C-c>", "<Esc>", opts("exit insert mode"))

-- source open file
key("n", "<leader>%", ":so %<CR>", opts("source open file"))

-- chmod
key("n", "<leader>X", ":!chmod +x %<CR>", opts("chmod"))

-- format json
key("n", "<leader>jq", ":% !jq .<CR>", opts("format json"))

-- move lines (normal)
key("n", "<C-j>", ":m +1<CR>", opts("[n] move line down"))
key("n", "<C-k>", ":m -2<CR>", opts("[n] move line up"))

-- move lines (visual)
key({ "v", "x" }, "K", ":m '<-2<CR>gv=gv", opts("[v] move line down"))
key({ "v", "x" }, "J", ":m '>+1<CR>gv=gv", opts("[v] move line up"))

-- copy whole file
key("n", "<leader>Y", "gg0VGy", opts("copy whole file"))

-- append line below to current line
key("n", "J", "mzJ`z", opts("append line below"))

-- center screen on vertical movement
key("n", "<C-d>", "<C-d>zz", opts("center screen on scroll down"))
key("n", "<C-u>", "<C-u>zz", opts("center screen on scroll up"))
key("n", "n", "nzzzv", opts("center screen when searching"))
key("n", "N", "Nzzzv", opts("center screen when searching"))

-- move to previous or next buffer
key("n", "<leader>[", ":bprev<CR>", opts("go to previous buffer"))
key("n", "<leader>]", ":bnext<CR>", opts("go to next buffer"))

-- window navigation
key("n", "<leader><Left>", "<C-w>h", opts("move to left window"))
key("n", "<leader><Down>", "<C-w>j", opts("move to lower window"))
key("n", "<leader><Up>", "<C-w>k", opts("move to upper window"))
key("n", "<leader><Right>", "<C-w>l", opts("move to right window"))

-- equalise window sizes
key("n", "<leader>=", "<C-w>=", opts("equalise window sizes"))

-- close view
key("n", "<leader>x", ":hid<CR>", opts("close view"))

-- resize views
key("n", "<C-Up>", ":resize +2<CR>", opts("resize view: bigger"))
key("n", "<C-Down>", ":resize -2<CR>", opts("resize view: smaller"))
key("n", "<C-Left>", ":vertical resize -2<CR>", opts("resize view: thinner"))
key("n", "<C-Right>", ":vertical resize +2<CR>", opts("resize view: wider"))

-- -- start search and substitute for [current line], [file] and [open buffers]
-- key('n', '<leader>sc', ':s/', opts)
-- key('n', '<leader>sf', ':%s/', opts)
-- key('n', '<leader>so', ':bufdo %s/', opts)

-- don't yank on visual paste
key({ "v", "x" }, "<leader>p", '"_dP', opts("paste without yank"))

-- yank and go to the end of yanked block
key({ "v", "x" }, "y", "ygv<Esc>", opts("yank and go to end of yanked block"))

-- yank to system clipboard and go to the end of yanked block
key({ "v", "x" }, "<leader>y", '"+ygv<Esc>', opts("yank to system clipboard"))

-- delete without copying
key({ "n", "v", "x" }, "<leader>d", '"_d', opts("delete without copying"))

-- stay in visual mode after (de)indenting
key("v", "<", "<gv", opts("stay in visual mode after deindenting"))
key("v", ">", ">gv", opts("stay in visual mode after indenting"))

-- format
-- key("n", "<leader>f", vim.lsp.buf.format)

-- quickfix list
-- key('n', '<C-k>', ':cnext<CR>zz', opts)
-- key('n', '<C-j>', ':cprev<CR>zz', opts)

-- location list
-- key('n', '<leader>k', ':lnext<CR>zz', opts)
-- key('n', '<leader>j', ':lprev<CR>zz', opts)

---------------------------------------- plugins

-- lazy UI
key("n", "<leader>l", ":Lazy<CR>", opts("lazy UI"))

-- nvim tree
key("n", "<leader>t", ":NvimTreeToggle<CR>", opts("toggle nvim-tree"))
key("n", "T", ":NvimTreeFocus<CR>", opts("focus nvim-tree"))

-- undotree
key("n", "<leader>u", ":UndotreeToggle<CR>", opts("toggle undotree"))

-- null-ls
key("n", "<leader>nl", ":NullLsInfo<CR>", opts("null-ls info"))

-- telescope
key("n", "<leader>ff", ":Telescope find_files<CR>", opts("find files"))
key("n", "<leader>fh", ":Telescope oldfiles<CR>", opts("recently opened files"))
key("n", "<leader>fb", ":Telescope buffers<CR>", opts("buffers"))
key("n", "<leader>fm", ":Telescope harpoon marks<CR>", opts("harpoon"))
key("n", "<leader>fgc", ":Telescope git_commits<CR>", opts("git commits"))
key("n", "<leader>fgs", ":Telescope git_status<CR>", opts("git status"))
key("n", "<leader>fl", ":Telescope live_grep<CR>", opts("fuzzy search (live) in cwd"))
key("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", opts("search current buffer"))
key("n", "<leader>:", ":Telescope command_history<CR>", opts("command history"))
key("n", "<leader>fk", ":Telescope keymaps<CR>", opts("keymaps"))
key("n", "<leader>fa", ":Telescope autocommands<CR>", opts("auto commands"))
key("n", "<leader>fH", ":Telescope highlights<CR>", opts("highlight groups"))

-- trouble
key("n", "<leader>ew", ":TroubleToggle workspace_diagnostics<CR>", opts("trouble: workspace_diagnostics"))
key("n", "<leader>el", ":TroubleToggle loclist<CR>", opts("trouble: location list"))
key("n", "<leader>eq", ":TroubleToggle quickfix<CR>", opts("trouble: quickfix list"))
key("n", "<leader>er", ":TroubleToggle lsp_references<CR>", opts("trouble: lsp references"))

-- todo-comments
key("n", "]t", function()
  require("todo-comments").jump_next()
end, opts("next todo"))
key("n", "[t", function()
  require("todo-comments").jump_prev()
end, opts("previous todo"))
key("n", "<leader>ft", ":TodoTelescope<CR>", opts("todo: telescope"))
key("n", "<leader>et", ":TodoTrouble<CR>", opts("todo: trouble"))

-- treesj
key("n", "<leader>st", ":TSJToggle<CR>", opts("treesj: toggle"))
key("n", "<leader>ss", ":TSJSplit<CR>", opts("treesj: split"))
key("n", "<leader>sj", ":TSJJoinCR>", opts("treesj: join"))

-- markdown preview
key("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", opts("toggle markdown preview"))
