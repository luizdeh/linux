return {
  "VonHeikemen/lsp-zero.nvim",
  event = "BufRead",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "nvimdev/lspsaga.nvim" },
    {
      "jose-elias-alvarez/null-ls.nvim",
      event = "BufReadPre",
      dependencies = {
        "williamboman/mason.nvim",
        "nvim-lua/plenary.nvim",
      },
      config = function()
        local nls = require("null-ls")
        nls.setup({
          sources = {
            nls.builtins.formatting.stylua,
            nls.builtins.formatting.black,
            nls.builtins.formatting.shfmt,
            nls.builtins.diagnostics.ruff.with({ extra_args = { "--max-line-length=180" } }),
            nls.builtins.formatting.eslint_d,
            nls.builtins.formatting.prettierd,
            nls.builtins.diagnostics.tsc,
          },
        })
      end,
    },
    { "jay-babu/mason-null-ls.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lua" },
    { "L3MON4D3/LuaSnip" },
    -- {'rafamadriz/friendly-snippets'}, -- Optional
  },
  config = function()
    local lsp = require("lsp-zero")

    lsp.preset({
      name = "recommended",
      set_lsp_keymaps = true,
      manage_nvim_cmp = true,
      suggest_lsp_servers = false,
    })

    lsp.setup_nvim_cmp({
      formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = "ƒ",
            buffer = "ß",
            path = "🖫",
            -- luasnip = '⋗',
            -- nvim_lua = 'Π',
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
    })

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      local key = vim.keymap.set
      key("n", "gD", vim.lsp.buf.declaration, opts)
      key("n", "gd", vim.lsp.buf.definition, opts)
      -- key('n', 'K', vim.lsp.buf.hover, opts)
      key("n", "gi", vim.lsp.buf.implementation, opts)
      key("n", "gs", vim.lsp.buf.signature_help, opts)
      key("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      key("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      key("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      key("n", "gt", vim.lsp.buf.type_definition, opts)
      key("n", "gr", vim.lsp.buf.rename, opts)

      key("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      -- key('n', 'gh', vim.lsp.buf.references, opts)
      key("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
      key("n", "]o", vim.diagnostic.open_float)
      key("n", "[d", vim.diagnostic.goto_prev)
      key("n", "]d", vim.diagnostic.goto_next)
      key("n", "]s", vim.diagnostic.setloclist)
      -- saga
      key("n", "K", ":Lspsaga hover_doc<CR>", opts)
      key("n", "gh", ":Lspsaga finder<CR>", opts)
      key("n", "gp", ":Lspsaga peek_definition<CR>", opts)
      key("n", "<leader>o", ":Lspsaga outline<CR>", opts)
    end)

    -- fix undefined global 'vim'
    lsp.configure("lua-language-server", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    lsp.configure("cssls", {
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    })

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
      }
      vim.lsp.buf.execute_command(params)
    end

    lsp.configure("tsserver", {
      init_options = {
        preferences = {
          disableSuggestions = true,
        },
      },
      commands = {
        OrganizeImports = {
          organize_imports,
          desc = "Organize Imports",
        },
      },
    })

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
    })

    local null_ls = require("null-ls")
    local null_opts = lsp.build_options("null-ls", {})

    null_ls.setup({
      on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
      end,
      sources = {},
    })

    require("mason-null-ls").setup({
      ensure_installed = nil,
      automatic_installation = false, -- You can still set this to `true`
      automatic_setup = true,
      handlers = {},
    })
  end,
}
