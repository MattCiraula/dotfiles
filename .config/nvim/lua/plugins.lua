-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- automatically install plugins when this file is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
  augroup end
]])

return require('packer').startup(function()
<<<<<<< HEAD
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'savq/melange-nvim'
  use 'jacoborus/tender.vim'
=======
	use 'wbthomason/packer.nvim'
	use 'ellisonleao/gruvbox.nvim'
  use 'altercation/vim-colors-solarized'
  use 'shaunsingh/nord.nvim'
>>>>>>> 23eb7d6 (Updated neovim config)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
<<<<<<< HEAD
	use {
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	}
=======
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      }
  }
>>>>>>> 23eb7d6 (Updated neovim config)
  use 'lewis6991/gitsigns.nvim'
  use 'folke/which-key.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim' 
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use { 'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim' 
  }
<<<<<<< HEAD
  use 'tpope/vim-fugitive'
=======
	use 'tpope/vim-fugitive'
	use {
		'junegunn/fzf',
		run = 'fzf#install()'
	}
  --use 'vimwiki/vimwiki'
	use 'junegunn/fzf.vim'
  use 'neomake/neomake'
>>>>>>> 23eb7d6 (Updated neovim config)
  use 'williamboman/nvim-lsp-installer'
	use {
	  "hrsh7th/nvim-cmp",
	  requires = {
	    "hrsh7th/cmp-buffer",
	  }
	}
	use 'onsails/lspkind.nvim'
  use 'mfussenegger/nvim-jdtls'
  use "hrsh7th/cmp-nvim-lsp"
<<<<<<< HEAD
=======
  use "mfussenegger/nvim-lint"
	use 'vim-scripts/paredit.vim'
>>>>>>> 23eb7d6 (Updated neovim config)
	use 'Olical/aniseed'
	use 'Olical/conjure'
  use { 
		'nvim-treesitter/nvim-treesitter',
        	run = ':TSUpdate'
<<<<<<< HEAD
  }
=======
    	}
  use "wlangstroth/vim-racket"
	--use 'PaterJason/cmp-conjure'
>>>>>>> 23eb7d6 (Updated neovim config)
end)
