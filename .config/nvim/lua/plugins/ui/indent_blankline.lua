return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = {
        -- char = "|",
        -- highlight = { "Function", "Label" },
        smart_indent_cap = true,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = true,
      },
      exclude = {
        filetypes = {
          "help",
          "mason",
          "mason.nvim",
          "TelescopePromt",
          "TelescopeResults",
          "lspinfo",
          "checkhealth",
          "man",
        },
        buftypes = {
          "terminal",
          "prompt",
          "nofile",
          "quickfix",
        },
      },
    })
  end,
}
