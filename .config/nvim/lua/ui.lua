local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--------------------------------------
-- hardline
require('hardline').setup {
	bufferline=false,  -- enable bufferline
	bufferline_settings={
		exclude_terminal=false,  -- don't show terminal buffers in bufferline
		show_index=false,        -- show buffer indexes (not the actual buffer numbers) in bufferline
	},
	theme='nordic',            -- change theme
	sections={                 -- define sections
		{class='mode', item=require('hardline.parts.mode').get_item},
		{class='high', item=require('hardline.parts.git').get_item, hide=100},
		{class='med', item=require('hardline.parts.filename').get_item},
		'%<',
		{class='med', item='%='},
		{class='error', item=require('hardline.parts.lsp').get_error},
		{class='warning', item=require('hardline.parts.lsp').get_warning},
		{class='warning', item=require('hardline.parts.whitespace').get_item},
		{class='high', item=require('hardline.parts.filetype').get_item, hide=80},
		{class='mode', item=require('hardline.parts.line').get_item},
	},
}

--------------------------------------
-- bufline
require('bufbar').setup {
	theme='nordic',          -- the theme in 'lua/bufbar/themes' to use
	show_tabs=true,          -- show tabs
	show_bufname='all',      -- show full buffer name ('current', 'visible' or 'all')
	show_flags=true,         -- show buffer flags
	show_alternate=false,    -- show alternate buffer
	modifier=':t',           -- the buffer name modifier
	separator='|',           -- the buffer separator
}

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

map('n', '<leader>ff', ':Telescope<CR>')
map('n', '<leader>/', ':Telescope current_buffer_fuzzy_find theme=ivy<cr>')
-- map('n', '<leader>o', ':Telescope find_files theme=dropdown<CR>')
-- map('n', '<leader>gf', ':Telescope git_files theme=dropdown<cr>')
map('n', '<leader>o', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer=false}))<CR>")
map('n', '<leader>gf', "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({previewer=false}))<CR>")
map('n', '<leader>gs', ':Telescope git_status<cr>')
map('n', '<leader>H', ':Telescope live_grep<CR>')
map('n', '<leader>fg', ':Telescope grep_string theme=ivy<CR>')
map('n', '<leader>fb', ':Telescope buffers theme=ivy<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>ft', ':Telescope tags<CR>')
-- map('n', '<leader>p', ':Telescope file_browser<CR>')
map('n', '<leader>p', "<cmd>lua require('telescope.builtin').file_browser(require('telescope.themes').get_dropdown({previewer=false}))<CR>")

-------------------------------------
-- vim wiki
vim.g.vimwiki_list = {{path='~/vimwiki', index='README', syntax='markdown', ext='.md', auto_toc=1}}
map('n', '<leader>t', ':VimwikiToggleListItem<CR>')

-------------------------------------
-- Goyo
vim.g.limelight_conceal_ctermfg = 240
vim.g.limelight_conceal_guifg = 'DarkGray'
vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :Goyo 80')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :set wrap')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.md :set showbreak=⎣')
-- vim.api.nvim_command('autocmd! User GoyoEnter Limelight')
-- vim.api.nvim_command('autocmd! User GoyoLeave Limelight!')

-- Nord
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = true
-- vim.g.nord_italic = false
-- require('nord').set()
