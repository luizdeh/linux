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

require("lazy").setup('plugins', {
  defaults = { lazy = true },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",
        "tohtml",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "tutor",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "matchit",
      },
    },
  },
})
