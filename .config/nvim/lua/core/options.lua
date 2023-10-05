local o = vim.opt

-- colors
o.termguicolors = true
o.background = "dark"

-- mouse and clipboard
o.mouse = "a"
o.clipboard = "unnamedplus"

-- lsp/cmp
o.completeopt = { "menu", "menuone", "noselect" }
o.wildmenu = true
o.wildignore = { "*/node_modules/**/*" }
o.shortmess:append("c")

-- file management
o.autoread = true
o.fileencoding = "utf-8"
o.hidden = true

-- swap and backup
o.swapfile = false
o.backup = false

-- undo
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- UI
o.showmode = false
o.title = true
o.cursorline = true
o.number = true
o.relativenumber = true
o.wrap = false
o.scrolloff = 8
o.laststatus = 3
o.signcolumn = "yes"
o.showmatch = true
o.list = true

-- folds
-- o.foldmethod= 'indent'
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.foldcolumn = "1"
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99

-- windows
o.splitright = true
o.splitbelow = true

-- tabs and spaces
o.tabstop = 2
o.softtabstop = -1
o.shiftwidth = 2
o.expandtab = true
o.smarttab = true

-- search
o.smartcase = true
o.ignorecase = true
o.hlsearch = false
o.incsearch = true

-- misc
o.updatetime = 50
o.lazyredraw = true
