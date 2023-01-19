vim.cmd [[packadd packer.nvim]]

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Load plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- search
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  	  requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-lua/popup.nvim'}
        },
  }
  use('nvim-tree/nvim-tree.lua')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')

  -- colorscheme
  use({
	'arcticicestudio/nord-vim',
	as = 'nord',
	config = function()
        vim.cmd('colorscheme nord')
        vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
 	end
  })

  -- syntax
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})

  -- git
  use('lewis6991/gitsigns.nvim')

  -- looks
  use('nvim-lualine/lualine.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('lukas-reineke/indent-blankline.nvim')
  use('ap/vim-css-color')

  -- helpers
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
  use('famiu/bufdelete.nvim')
  use('tpope/vim-repeat')

  -- UI
  use({
        'glepnir/lspsaga.nvim', 
        branch = 'main',
        config = function()
            require('lspsaga').setup({})
        end,
   })

  -- lsp
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- finish
  if PACKER_BOOTSTRAP then
     require('packer').sync()
 end
end)


