-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- automatically compile packer when this file is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {'rktjmp/lush.nvim'}
	use {'ellisonleao/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
	use 'Olical/aniseed'
	use 'tpope/vim-fugitive'
	use {
		'junegunn/fzf',
		run = 'fzf#install()'
	}
	use 'junegunn/fzf.vim'
	use 'mfussenegger/nvim-lint'
  use 'kabouzeid/nvim-lspinstall'
	use 'neovim/nvim-lspconfig'
	use {
	  "hrsh7th/nvim-cmp",
	  requires = {
	    --"hrsh7th/vim-vsnip",
	    "hrsh7th/cmp-buffer",
	  }
	}
	use 'tpope/vim-dispatch'
	use 'clojure-vim/vim-jack-in'
	use 'vim-scripts/paredit.vim'
	use 'Olical/conjure'
    	use { 
		'nvim-treesitter/nvim-treesitter',
        	run = ':TSUpdate'
    	}
	use 'PaterJason/cmp-conjure'
	--use 'guns/vim-sexp'
	--use 'tpope/vim-sexp-mappings-for-regular-people'
	--use 'tpope/vim-repeat'
	--use 'tpope/vim-surround'
end)
