local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--------------------------------------
-- hardline
-- require('hardline').setup {
-- 	bufferline=false,  -- enable bufferline
-- 	bufferline_settings={
-- 		exclude_terminal=false,  -- don't show terminal buffers in bufferline
-- 		show_index=false,        -- show buffer indexes (not the actual buffer numbers) in bufferline
-- 	},
-- 	theme='nordic',            -- change theme
-- 	sections={                 -- define sections
-- 		{class='mode', item=require('hardline.parts.mode').get_item},
-- 		{class='high', item=require('hardline.parts.git').get_item, hide=100},
-- 		{class='med', item=require('hardline.parts.filename').get_item},
-- 		'%<',
-- 		{class='med', item='%='},
-- 		{class='error', item=require('hardline.parts.lsp').get_error},
-- 		{class='warning', item=require('hardline.parts.lsp').get_warning},
-- 		{class='warning', item=require('hardline.parts.whitespace').get_item},
-- 		{class='high', item=require('hardline.parts.filetype').get_item, hide=80},
-- 		{class='mode', item=require('hardline.parts.line').get_item},
-- 	},
-- }


--------------------------------------
-- lualine
require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'codedark',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', },
		lualine_c = {'filename', 'fugitive'},
		lualine_x = {'diagnostics', 'encoding', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = {
			{
				'buffers',
				component_separators = { left = '|', right = '|' },
				section_separators = { left = '', right = '' },
				mode = 4,
				symbols = {
					alternate_file = '',
					modified = '[+]',
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'tabs'}
	},
	extensions = {
		'toggleterm',
		'fugitive',
	}
})

--------------------------------------
-- smoothscroll
map('n', '<C-u>', ':call smooth_scroll#up(&scroll, 7, 2)<CR>')
map('n', '<C-d>', ':call smooth_scroll#down(&scroll, 7, 2)<CR>')

--------------------------------------
-- fzf
vim.g.fzf_layout={down="40%"}
-- map('n', '<leader>/', ':BLines<cr>')
-- map('n', '<leader>o', ':Files<cr>')
-- map('n', '<leader>g', ':GFiles!?<cr>')
-- map('n', '<leader>H', ':Rg<cr>')
-- map('n', '<leader>f', ':Lines<cr>')

--------------------------------------
-- telescope
require('telescope').setup {
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown {
				-- even more opts
			}
		}
	}
}
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("git_worktree")

map('n', '<leader>ff', ':Telescope<CR>')
map('n', '<leader>/', ':Telescope current_buffer_fuzzy_find theme=ivy<cr>')
map('n', '<leader>o', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer=false}))<CR>")
map('n', '<leader>gf', "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({previewer=false}))<CR>")
map('n', '<leader>gs', ':Telescope git_status<cr>')
map('n', '<leader>gw', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
map('n', '<leader>gc', "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
map('n', '<leader>H', ':Telescope live_grep<CR>')
map('n', '<leader>fg', ':Telescope grep_string theme=ivy<CR>')
map('n', '<leader>b', ':Telescope buffers theme=ivy<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
-- map('n', '<leader>ft', ':Telescope tags<CR>')
map('n', '<leader>ft', ':TodoTelescope<CR>')

-------------------------------------
-- vim wiki
vim.g.vimwiki_list = {
	{path='~/vimwiki/default', index='README', syntax='markdown', ext='.md', auto_toc=1},
	{path='~/vimwiki/gcp', index='README', syntax='markdown', ext='.md', auto_toc=1},
	{path='~/vimwiki/k8s', index='README', syntax='markdown', ext='.md', auto_toc=1},
}
map('n', '<leader>t', ':VimwikiToggleListItem<CR>')

-------------------------------------
-- Goyo
map('n', '<leader>gg', ':Goyo 120<CR>')
vim.g.limelight_conceal_ctermfg = 240
vim.g.limelight_conceal_guifg = 'DarkGray'
-- vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :Goyo 120')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :set wrap')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :set showbreak=↳ ')
-- vim.api.nvim_command('autocmd! User GoyoEnter Limelight')
-- vim.api.nvim_command('autocmd! User GoyoLeave Limelight!')

-- Colorizer
require('colorizer').setup()

------------------------------------
-- Nord (only on newer neovim versions)
if (vim.fn.has("nvim-0.8") == 1) then
	vim.g.nord_contrast = false
	vim.g.nord_borders = false
	vim.g.nord_disable_background = true
	vim.g.cursorline_transparent = true
	vim.g.nord_italic = false
	require('nord').set()
end

-- Onedark
require('onedark').setup({
	style = 'darker',
	transparent = true,
	code_style = {
		comments = none,
	}
})
vim.g.onedark_terminal_italics = false
-- require('onedark').load()

-- Everforest
vim.g.everforest_transparent_background = 1
vim.g.everforest_disable_italic_comment = 1

-- Zenbones
vim.g.zenbones_italic_comments = false

-- uncomment default colorscheme below (or change in command mode)
-- vim.cmd[[colorscheme nord]]
-- vim.cmd[[colorscheme onedark]]
vim.cmd[[colorscheme everforest]]
