-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	-- use 'shougo/deoplete-lsp'
	-- use 'shougo/deoplete.nvim'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-omni'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'ojroques/nvim-lspfuzzy'
	use 'nvim-lua/plenary.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'ojroques/nvim-hardline'
	use 'ojroques/nvim-bufbar'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'

	--- color schemes
	use 'arcticicestudio/nord-vim'
end)

