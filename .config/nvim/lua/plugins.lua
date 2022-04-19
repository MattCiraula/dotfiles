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
	use 'wbthomason/packer.nvim'
	use 'ellisonleao/gruvbox.nvim'
  use 'shaunsingh/nord.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'lewis6991/gitsigns.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim' 
  }
  use { 'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim' 
  }
	use 'tpope/vim-fugitive'
	use {
		'junegunn/fzf',
		run = 'fzf#install()'
	}
  --use 'vimwiki/vimwiki'
	use 'junegunn/fzf.vim'
  use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
	use {
	  "hrsh7th/nvim-cmp",
	  requires = {
	    "hrsh7th/cmp-buffer",
	  }
	}
  use "hrsh7th/cmp-nvim-lsp"
	use 'vim-scripts/paredit.vim'
	use 'Olical/aniseed'
	use 'Olical/conjure'
    	use { 
		'nvim-treesitter/nvim-treesitter',
        	run = ':TSUpdate'
    	}
	--use 'PaterJason/cmp-conjure'
end)
