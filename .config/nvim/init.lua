--------------------------------------
-- basic options
-- vim.cmd 'colorscheme nord'             -- Put your favorite colorscheme here
-- vim.opt.colorcolumn='101'               -- column limit
vim.opt.completeopt={'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
vim.opt.guifont="JetBrains Mono NL:h12" -- font for gui apps (mostly for Windows' Neovide)
vim.opt.hidden=true                     -- Enable background buffers
vim.opt.ignorecase=true
vim.opt.linebreak=true                  -- Does not break line in the middle of the word
vim.opt.list=true                       -- Show some invisible characters
-- vim.opt.listchars='tab:▶‒,trail:■'      -- set tabs and trails chars
vim.opt.listchars='tab:┊ ,trail:●'      -- set tabs and trails chars
vim.opt.mouse=''                        -- Disable mouse
vim.opt.number=true                     -- show line numbers
vim.opt.path=vim.opt.path + ".,**"      -- tab-completion for all file-related tasks
vim.opt.relativenumber=true             -- relative line numbers
vim.opt.scrolloff=4                     -- Lines of context
vim.opt.shiftround=true                 -- Round indent
vim.opt.shiftwidth=2                    -- Size of an indent
vim.opt.sidescrolloff=8                 -- Columns of context
vim.opt.smartcase=true                  -- Do not ignore case with capitals
vim.opt.smartindent=true                -- Insert indents automatically
vim.opt.splitbelow=true                 -- Put new windows lower of current
vim.opt.splitright=true                 -- Put new windows right of current
vim.opt.tabstop=2                       -- Number of spaces tabs count for
vim.opt.termguicolors = true            -- needed for colorized and todo plugins
vim.opt.wildmenu=true                   -- Display all matching files when tab-complete
vim.opt.wildmode={'list','full'}        -- Command-line completion mode
vim.opt.wrap=false                      -- Disable line wrap
vim.wo.breakindent=true                 -- Envable indentation at break line
vim.wo.breakindentopt='shift:4,min:40,sbr'
-- vim.wo.cursorline=true                  -- Visible cursor line
vim.wo.showbreak='↳ '                   -- Show break line
vim.g.mapleader=' '                     -- Changing leader key
-- vim.o.cmdheight=0                       -- no command line


--------------------------------------
-- mappings
local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
vim.keymap.set('n', '<C-h>', ':bp<cr>')
vim.keymap.set('n', '<C-l>', ':bn<cr>')
-- vim.keymap.set('n', '<Space>p', ':bp<cr>')
-- vim.keymap.set('n', '<Space>n', ':bn<cr>')
vim.keymap.set('n', '<Tab>', '<C-w><C-w>')
vim.keymap.set('i', 'jj', '<Esc>')


--------------------------------------
-- plugin configs
require('plugins')
require('programming')
require('ui')
require('cmp')
require('snippets')


--------------------------------------
-- plugins' options
vim.g['deoplete#enable_at_startup'] = 1     -- enable deoplete
