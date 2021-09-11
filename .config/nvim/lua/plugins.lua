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
	use 'neovim/nvim-lspconfig'
	--use 'guns/vim-sexp'
	--use 'tpope/vim-sexp-mappings-for-regular-people'
	--use 'tpope/vim-repeat'
	--use 'tpope/vim-surround'
	use {
	  "hrsh7th/nvim-cmp",
	  requires = {
	    --"hrsh7th/vim-vsnip",
	    "hrsh7th/cmp-buffer",
	  }
	}
	use 'tpope/vim-dispatch'
	use 'clojure-vim/vim-jack-in'
	use 'Olical/conjure'
    	use { 
		'nvim-treesitter/nvim-treesitter',
        	run = ':TSUpdate'
    	}
	use 'PaterJason/cmp-conjure'
end)
