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
	use 'tpope/vim-dispatch'
	use 'clojure-vim/vim-jack-in'
	use 'Olical/conjure'
    	use { 
		'nvim-treesitter/nvim-treesitter',
        	run = ':TSUpdate'
    	}
	use 'neovim/nvim-lspconfig'
end)
