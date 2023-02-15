return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({ default = true })
    end,
  },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'everforest',
        component_separators = { left = ' ', right = ' '},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 1,
            shorting_target = 40,
          },
        },
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    })
  end
}
