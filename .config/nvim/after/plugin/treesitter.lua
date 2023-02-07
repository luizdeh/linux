require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['ia'] = '@parameter.inner',
            }
        },
        swap = {
            enable = true,
            swap_previous = {
                ['{a'] = '@parameter.inner',
            },
            swap_next = {
                ['}a'] = '@parameter.inner',
            },
        }
    },
    ignore_install = { 'phpdoc', 'tree-sitter-phpdoc' },
    sync_install = true,
    auto_install = true,
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
    additional_vim_regex_highlighting = true,
})

