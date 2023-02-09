-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	-- use 'shougo/deoplete-lsp'
	-- use 'shougo/deoplete.nvim'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'ojroques/nvim-lspfuzzy'
	use 'nvim-lua/plenary.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	-- use 'ojroques/nvim-bufbar'
	use 'terryma/vim-smooth-scroll'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'norcalli/nvim-colorizer.lua'
	use 'folke/todo-comments.nvim'
	use 'ThePrimeagen/harpoon'

	-- cmp
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	-- use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	-- use 'hrsh7th/cmp-omni'
	use 'hrsh7th/cmp-path'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use {
		'L3MON4D3/LuaSnip',
		-- after = 'nvim-cmp',
		-- config = function() require('config.snippets') end,
	}
	use 'akinsho/toggleterm.nvim'

	-- lsp + treesitter
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client]
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'nvim-treesitter/playground'
	use 'p00f/nvim-ts-rainbow'
	use 'folke/trouble.nvim'
	use 'simrat39/symbols-outline.nvim'
	use 'stevearc/aerial.nvim'

	-- telescope
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'

	-- vimwiki
	-- use 'godlygeek/tabular'
	-- use 'preservim/vim-markdown'
	use 'vimwiki/vimwiki'
	use 'folke/zen-mode.nvim'
	use 'junegunn/limelight.vim'
	use 'renerocksai/calendar-vim'

	-- git plugins
	use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-fugitive'
	use 'junegunn/gv.vim'
	use 'ThePrimeagen/git-worktree.nvim'

	-- lang plugins
	use 'stephpy/vim-yaml'
	use 'pedrohdz/vim-yaml-folds'

	--- color schemes
	use 'shaunsingh/nord.nvim'
	use 'morhetz/gruvbox'
	use 'navarasu/onedark.nvim'
	use 'sainnhe/everforest'
	use {
		"mcchrish/zenbones.nvim",
		requires = "rktjmp/lush.nvim"
	}

	--- Go
	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua'
end)

