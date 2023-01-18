-- telescope
require('telescope').setup { defaults = { file_ignore_patterns = { 'node_modules', '.pdf', '.mkv', '.mp4', '.png', '.jpg'} } }

-- nvim-tree
require("nvim-tree").setup()

--  lualine
require('lualine').setup {
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
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
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
}

-- bufferline
require('bufferline').setup {
  options = {
    mode = "buffers",
    numbers = "ordinal",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    buffer_close_icon = '  ',
    modified_icon = ' ● ',
    close_icon = '  ',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 22,
    max_prefix_length = 18,
    tab_size = 20,
    diagnostics = true,
    offsets = {
      {
          filetype = "NvimTree",
          text = "tree",
          text_align = "center",
      },
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    sort_by = 'insert_at_end',
    },
}

-- treesitter
local ts = require('nvim-treesitter.configs')

ts.setup({
    highlight = {
        enable = false,
    },
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'lua',
    'markdown',
    'css',
    'json',
    'html',
    'bash',
  },
  auto_install = true,
})

-- lspkind
local ok, lspkind = pcall(require, "lspkind")
if not ok then
    return
end

lspkind.init()

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- cmp
local cmp = require('cmp')

cmp.setup ({
  mapping = {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format {
        with_text = true,
        mode = 'symbol',
        maxwidth = 50,
        menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            path = "[path]",
            luasnip = "[snip]",
            }
    }
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    -- { name = "buffer", keyword_length = 4 },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
})

cmp.setup.cmdline(':', { cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{ name = 'path' }},{{ name = 'cmdline' }})})
cmp.setup.cmdline('/', { cmp.mapping.preset.cmdline(), sources = {{ name = 'buffer' }}})

-- lsp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.tsserver.setup {} -- capabilities = capabilities
require'lspconfig'.jsonls.setup {}
require'lspconfig'.bashls.setup {}
require'lspconfig'.cssls.setup {}
require'lspconfig'.marksman.setup {}
require'lspconfig'.html.setup {}

-- lsp installer
require('nvim-lsp-installer').setup {
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

