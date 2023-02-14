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
		-- theme = 'codedark',
		theme = 'everforest',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', },
		lualine_c = {{'filename', path=1,symbols={modified=' ●',}}, 'fugitive',  },
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
	-- 	lualine_a = {
	-- 		{
	-- 			'buffers',
	-- 			show_filename_only = false,
	-- 			component_separators = { left = '|', right = '|' },
	-- 			section_separators = { left = '', right = '' },
	-- 			mode = 4,
	-- 			symbols = {
	-- 				alternate_file = '',
	-- 				modified = ' ●',
	-- 			},
	-- 		},
	-- 	},
	-- 	lualine_b = {},
	-- 	lualine_c = {},
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = {'tabs'}
	},
	extensions = {
		'toggleterm',
		'fugitive',
		'aerial',
		'fzf',
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
	},
	defaults = {
		mappings = {
			n = {
				['<C-d>'] = require('telescope.actions').delete_buffer,
				-- ['<C-v>'] = require('telescope.actions').select_vertical,
				-- ['<C-b>'] = require('telescope.actions').git_switch_branch,
			},
			i = {
				['<C-d>'] = require('telescope.actions').delete_buffer,
				-- ['<C-v>'] = require('telescope.actions').select_vertical,
				-- ['<C-b>'] = require('telescope.actions').git_switch_branch,
			}
		}
	}
}
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("harpoon")

map('n', '<leader>ff', ':Telescope<CR>')
map('n', '<leader>fk', ':Telescope keymaps<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
-- map('n', '<leader>ft', ':Telescope tags<CR>')
map('n', '<leader>ft', ':TodoTelescope<CR>')
-- text searchers
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { previewer = false, }) end, { desc = '[/] Fuzzy search in current buffer'})
vim.keymap.set('n', '<leader>H', require('telescope.builtin').live_grep, { desc = '[H] Fuzzy search in current buffer'})
vim.keymap.set('n', '<leader>*', function() require('telescope.builtin').grep_string(require('telescope.themes').get_cursor { }) end, { desc = '[*] Fuzzy search current word'})
-- files/buffers
vim.keymap.set('n', '<leader><space>', function() require('telescope.builtin').buffers(require('telescope.themes').get_ivy { }) end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>o', function() require('telescope.builtin').find_files(require('telescope.themes').get_dropdown { previewer=false }) end, { desc = '[o] Find files' })
vim.keymap.set('n', '<leader>O', require('telescope').extensions.file_browser.file_browser, { desc = '[O] File browser' })
-- git
vim.keymap.set('n', '<leader>go', function() require('telescope.builtin').git_files(require('telescope.themes').get_dropdown { previewer=false }) end, { desc = '[go] Git files' })
-- vim.keymap.set('n', '<leader>gs', function() require('telescope.builtin').git_status(require('telescope.themes').get_ivy { }) end, { desc = '[gs] Git status' })
vim.keymap.set('n', '<leader>gs', function() require('telescope.builtin').git_status(require('telescope.themes')) end, { desc = '[gs] Git status' })
vim.keymap.set('n', '<leader>gC', function() require('telescope.builtin').git_commits(require('telescope.themes')) end, { desc = '[gC] Git commits' })
vim.keymap.set('n', '<leader>gc', function() require('telescope.builtin').git_bcommits(require('telescope.themes').get_ivy { prompt_title='Git Commits for file' }) end, { desc = '[gc] Git buffer commits' })
vim.keymap.set('n', '<leader>gb', function() require('telescope.builtin').git_branches(require('telescope.themes').get_ivy { }) end, { desc = '[gb] Git commits' })

-------------------------------------
-- vim wiki
vim.g.vimwiki_list = {
	{path='~/vimwiki/default', index='README', syntax='markdown', ext='.md', auto_toc=1},
	{path='~/vimwiki/gcp', index='README', syntax='markdown', ext='.md', auto_toc=1},
	{path='~/vimwiki/k8s', index='README', syntax='markdown', ext='.md', auto_toc=1},
}
map('n', '<leader>t', ':VimwikiToggleListItem<CR>')


-------------------------------------
-- Harpoon
require('harpoon').setup()
vim.keymap.set('n', '<leader>ho', ':Telescope harpoon marks previewer=false theme=dropdown<CR>', { desc = '[ho] Harpoon in Telescope' })
vim.keymap.set('n', '<leader>ha', function() require('harpoon.mark').add_file() end, { desc = '[ha] Harpoon add file' })
vim.keymap.set('n', '<leader>hr', function() require('harpoon.mark').rm_file() end, { desc = '[hr] Harpoon remove file' })
vim.keymap.set('n', '<leader>hx', function() require('harpoon.mark').clear_all() end, { desc = '[hx] Harpoon remove all' })
vim.keymap.set('n', '<leader>hq', function() require('harpoon.ui').toggle_quick_menu() end, { desc = '[hq] Harpoon quick menu' })
vim.keymap.set('n', '<leader>hh', function() require('harpoon.ui').nav_next() end, { desc = '[hh] Harpoon next mark' })
vim.keymap.set('n', '<leader>hp', function() require('harpoon.ui').nav_prev() end, { desc = '[hp] Harpoon previous mark' })

-------------------------------------
-- Colorizer
require('colorizer').setup()

------------------------------------
-- ZenMode
require("zen-mode").setup({
		window = {
			backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 120, -- width of the Zen window
			height = 1, -- height of the Zen window
			options = {
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				-- foldcolumn = "0", -- disable fold column
				list = false, -- disable whitespace characters
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
			},
			twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = false }, -- disables git signs
			tmux = { enabled = false }, -- disables the tmux statusline
			kitty = {
				enabled = false,
				font = "+4", -- font size increment
			},
		},
		on_open = function(win)
			vim.opt.number=true
			vim.opt.relativenumber=true
		end,
		on_close = function()
			vim.opt.number=true
			vim.opt.relativenumber=true
		end,
})
-- vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :ZenMode')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :set wrap')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :set showbreak=↳ ')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :set number!')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :set relativenumber!')

------------------------------------
-- Mind
require('mind').setup({
	persistence = {
		state_path = "~/vimwiki/default/.mind/mind.json",
		data_dir = "~/vimwiki/default/",
	},
	edit = {
		data_header = "%s\n=======================================",
	},
})
map('n', '<leader>m<leader>p', ':MindOpenSmartProject<CR>')
map('n', '<leader>mm', ':MindOpenMain<CR>')
map('n', '<leader>mp', ':MindOpenProject<CR>')

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
