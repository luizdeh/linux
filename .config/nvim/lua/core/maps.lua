local key = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap Q to nothing
key('n', 'Q', '<nop>', opts)

-- remap saving a file
key({ 'n', 'v', 'x' }, '<leader>w', ':w<CR>', opts)

-- exit insert mode
key('i', '<C-c>', '<Esc>', opts)

-- source open file
key('n', '<leader>%', ':so %<CR>', opts)

-- chmod
key('n', '<leader>X', ':!chmod +x %<CR>', { silent = true })

-- format json
key('n', '<leader>js', ':%!jq .<CR>', opts)

-- move lines (normal)
key('n', '<C-j>', ':m +1<CR>', opts)
key('n', '<C-k>', ':m -2<CR>', opts)

-- move lines (visual)
key({ 'v', 'x' }, 'K', ":m '<-2<CR>gv=gv", opts)
key({ 'v', 'x' }, 'J', ":m '>+1<CR>gv=gv", opts)

-- append line below to current line
key('n', 'J', 'mzJ`z', opts)

-- center screen on vertical movement
key('n', '<C-d>', '<C-d>zz', opts)
key('n', '<C-u>', '<C-u>zz', opts)
key('n', 'n', 'nzzzv', opts)
key('n', 'N', 'Nzzzv', opts)

-- move to previous or next buffer
key('n', '<leader>[', ':bprev<CR>', opts)
key('n', '<leader>]', ':bnext<CR>', opts)

-- window navigation
key('n', '<leader><Left>', '<C-w>h', opts)
key('n', '<leader><Down>', '<C-w>j', opts)
key('n', '<leader><Up>', '<C-w>k', opts)
key('n', '<leader><Right>', '<C-w>l', opts)

-- equalise window sizes
key('n', '<leader>=', '<C-w>=', opts)

-- close view
key('n', '<leader>x', ':hid<CR>', opts)

-- resize views
key('n', '<C-Up>', ':resize +2<CR>', opts)
key('n', '<C-Down>', ':resize -2<CR>', opts)
key('n', '<C-Left>', ':vertical resize -2<CR>', opts)
key('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- -- start search and substitute for [current line], [file] and [open buffers]
-- key('n', '<leader>sc', ':s/', opts)
-- key('n', '<leader>sf', ':%s/', opts)
-- key('n', '<leader>so', ':bufdo %s/', opts)

-- greatest remap ever
key('x', '<leader>p', '"_dP', opts)

-- yank and go to the end of yanked block
key('v', 'y', 'ygv<Esc>', opts)

-- yank to system clipboard
key('n', '<leader>y', '"+y', opts)

-- yank to system clipboard and go to the end of yanked block
key('v', '<leader>y', '"+ygv<Esc>', opts)

-- delete without copying
key({ 'n', 'v' }, '<leader>d', '"_d', opts)

-- stay in visual mode after (de)indenting
key('v', '<', '<gv', opts)
key('v', '>', '>gv', opts)

-- format
key('n', '<leader>f', vim.lsp.buf.format)

-- quickfix list
-- key('n', '<C-k>', ':cnext<CR>zz', opts)
-- key('n', '<C-j>', ':cprev<CR>zz', opts)

-- location list
-- key('n', '<leader>k', ':lnext<CR>zz', opts)
-- key('n', '<leader>j', ':lprev<CR>zz', opts)

---------------------------------------- plugins

-- lazy UI
key('n', '<leader>l', ':Lazy<CR>', opts)

-- nvim tree
key('n', '<leader>t', ':NvimTreeToggle<CR>', opts)

-- undotree
key('n', '<leader>u', ':UndotreeToggle<CR>', opts)

-- telescope: file explorer
key('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'find files' })

-- telescope: history
key('n', '<leader>fh', ':Telescope oldfiles<CR>', { desc = 'recently opened files' })

-- telescope: buffers
key('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'buffers' })

-- telescope: fuzzy search current buffer
key('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'search current buffer' })

-- telescope: fuzzy search (live) current working directory
key('n', '<leader>fl', ':Telescope live_grep<CR>', { desc = 'live grep files in the cwd' })

-- telescope: fuzzy search current working directory
key('n', '<leader>fs', function() require('telescope.builtin').grep_string({ search = vim.fn.input('grep > ') }) end,
  { desc = 'grep string in current buffer' })

-- telescope: harpoon
key('n', '<leader>fm', ':Telescope harpoon marks<CR>', { desc = 'harpoon' })

-- trouble: document diagnostics
key('n', '<leader>zd', ':TroubleToggle document_diagnostics<CR>', opts)

-- trouble: location list
key('n', '<leader>zl', ':TroubleToggle loclist<CR>', opts)

-- trouble: quickfix list
key('n', '<leader>zq', ':TroubleToggle quickfix<CR>', opts)

-- trouble: lsp references
key('n', '<leader>zr', ':TroubleToggle lsp_references<CR>', opts)
