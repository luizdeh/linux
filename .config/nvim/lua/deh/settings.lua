local o = vim.opt
local g = vim.g

-- leader
g.mapleader = " "

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- colors
o.termguicolors = true
o.background = 'dark'

-- colorscheme
g.nord_italic = true
g.nord_italic_comments = true
g.nord_uniform_status_lines = true
g.nord_bold = true

-- mouse and clipboard
o.mouse = 'a'
o.clipboard = 'unnamedplus'

-- lsp/cmp
o.completeopt = { 'menu', 'menuone', 'noselect' }
o.wildmenu = true
o.wildignore = {'*/node_modules/**/*'}
o.shortmess:append('c')

-- file management
o.autoread = true
o.fileencoding = 'utf-8'
o.swapfile = false
o.backup = false
o.hidden = true
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- visibilty
o.title = true
o.cursorline = true
o.nu = true
o.relativenumber = true
o.wrap = false
o.scrolloff = 8
o.laststatus = 3
o.splitbelow = true
o.splitright = true

-- tabs and spaces
o.tabstop = 2
o.softtabstop = -1
o.shiftwidth = 2
o.expandtab = true

-- search
o.smartcase = true
o.ignorecase = true
o.hlsearch = false
o.incsearch = true
o.showmatch = true

-- misc
o.showmode = false
o.updatetime = 50
o.lazyredraw = true
