return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = { '*', '!lazy' },
    buftype = { '*', '!prompt', '!nofile' },
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = true,
      RRGGBBAA = true,
      AARRGGBB = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      sass = { enable = true, parsers = { css }, },
      tailwind = true,
      mode = 'background',
    },
    typescriptreact = { css = true },
  },
}
