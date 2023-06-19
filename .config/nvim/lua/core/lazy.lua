local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.cmp" },
  { import = "plugins.colors" },
  { import = "plugins.editing" },
  { import = "plugins.git" },
  { import = "plugins.lsp" },
  { import = "plugins.navigation" },
  { import = "plugins.ui" },
  defaults = { lazy = true },
  checker = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})

-- vim.cmd("colorscheme gruvbox-material")

require("core.colors").colors("catppuccin-mocha")

local colors = vim.g.colors_name

if colors == "nord" then
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.g.nord_italic = true
  vim.g.nord_italic_comments = true
  vim.g.nord_uniform_status_line = true
  vim.g.nord_bold = true
end

if colors == "everforest" then
  vim.g.everforest_transparent_background = 1
  vim.g.everforest_better_performance = 1
  vim.g.everforest_enable_italic = 1
end

if colors == "gruxbox_material" then
  vim.g.gruvbox_material_transparent_background = 1
  vim.g.gruvbox_material_enable_italic = 1
  vim.g.gruvbox_material_better_performance = 1
end
