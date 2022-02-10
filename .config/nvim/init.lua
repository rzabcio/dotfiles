--------------------------------------
-- basic options
vim.cmd 'colorscheme nord'              -- Put your favorite colorscheme here
vim.opt.colorcolumn='110'                 -- column limit
vim.opt.completeopt={'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
vim.opt.hidden=true                     -- Enable background buffers
vim.opt.list=true                       -- Show some invisible characters
vim.opt.listchars='tab:▶·'              -- set tabs and trails chars
vim.opt.number=true                     -- Show line numbers
vim.opt.relativenumber=true             -- Relative line numbers
vim.opt.scrolloff=4                     -- Lines of context
vim.opt.shiftround=true                 -- Round indent
vim.opt.shiftwidth=2                    -- Size of an indent
vim.opt.sidescrolloff=8                 -- Columns of context
vim.opt.smartcase=true                  -- Do not ignore case with capitals
vim.opt.smartindent=true                -- Insert indents automatically
vim.opt.splitbelow=true                 -- Put new windows below current
vim.opt.splitright=true                 -- Put new windows right of current
vim.opt.tabstop=2                       -- Number of spaces tabs count for
vim.opt.wildmode={'list', 'longest'}    -- Command-line completion mode
vim.opt.wrap=false                      -- Disable line wrap
vim.opt.dir='~/.vim/swapfiles'          -- 
vim.opt.directory='~/.vim/swapfiles'
vim.opt.backupdir='~/.vim/swapfiles'


--------------------------------------
-- mappings
local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map('n', '<C-j>', ':m-2<CR>')
map('n', '<C-k>', ':m+<CR>')
map('n', '<C-h>', ':bp<CR>')
map('n', '<C-l>', ':bn<CR>')
map('i', 'jj', '<Esc>')


--------------------------------------
-- plugin configs
require('plugins')
require('lsp')
require('ui')
require('cmp')
require('git')


--------------------------------------
-- plugins' options
vim.g['deoplete#enable_at_startup'] = 1     -- enable deoplete
