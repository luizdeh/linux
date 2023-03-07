return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  event = "BufRead",
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig',
      dependencies = {
        'glepnir/lspsaga.nvim'
      },
    }, -- Required
    { 'williamboman/mason.nvim' }, -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    { 'j-hui/fidget.nvim',
      config = function()
        require('fidget').setup()
      end
    },
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' }, -- Optional
    { 'hrsh7th/cmp-path' }, -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' }, -- Optional
    -- Snippets
    { 'L3MON4D3/LuaSnip' }, -- Required
    -- {'rafamadriz/friendly-snippets'}, -- Optional
  },
  config = function()
    local lsp = require('lsp-zero')

    lsp.preset({
      name = 'minimal',
      set_lsp_keymaps = true,
      manage_nvim_cmp = true,
      suggest_lsp_servers = false,
    })

    lsp.setup_nvim_cmp({
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = '',
            buffer = '',
            path = '🖫',
            luasnip = '⋗',
            nvim_lua = 'Π',
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
    })

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      local key = vim.keymap.set
      key("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
      key("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
      key({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
      key("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
      key("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
      key("n", "gp", "<cmd>Lspsaga preview_definition<CR>", opts)
      key("n", "<leader>gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
      key("n", "<leader>gc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
      key("n", "<leader>gb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
      key("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
      key("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
      key("n", "[E", function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end, opts)
      key("n", "]E", function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
      end, opts)
      key("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
    end)

    lsp.setup()
  end,
}
