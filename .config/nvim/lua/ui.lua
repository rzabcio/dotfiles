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
-- fzf
vim.g.fzf_layout={down="40%"}

--------------------------------------
-- smoothscroll
local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map('n', '<C-u>', ':call smooth_scroll#up(&scroll, 7, 2)<CR>')
map('n', '<C-d>', ':call smooth_scroll#down(&scroll, 7, 2)<CR>')

-------------------------------------
-- vim wiki
vim.g.vimwiki_list = {{path = '~/vimwiki', syntax = 'markdown', ext = '.md'}}
