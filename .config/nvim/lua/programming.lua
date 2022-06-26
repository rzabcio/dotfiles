local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--------------------------------------
-- cmp
local cmp = require('cmp')
local menu = {
	buffer = '[Buf]',
	nvim_lsp = '[LSP]',
	omni = '[Omni]',
	path = '[Path]',
	luasnip = '[Snippet]'
}
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}
local widths = {
	abbr = 80,
	kind = 40,
	menu = 40
}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- for 'luasnip'
		end,
	},
	completion = {keyword_length = 2},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = vim_item.menu or menu[entry.source.name]
			for k, width in pairs(widths) do
				if #vim_item[k] > width then
					vim_item[k] = fmt('%s...', string.sub(vim_item[k], 1, width))
				end
			end
			return vim_item
		end,
	},
	mapping = {
		['<Tab>'] = function(fb) if cmp.visible() then cmp.select_next_item() else fb() end end,
		['<S-Tab>'] = function(fb) if cmp.visible() then cmp.select_prev_item() else fb() end end,
		['<CR>'] = cmp.mapping.confirm {select=true},
	},
	preselect = require('cmp.types').cmp.PreselectMode.None,
	sources = cmp.config.sources({
		{name = 'luasnip'},
		{name = 'buffer'},
		{name = 'nvim_lsp'},
		{name = 'omni'},
		{name = 'path'},
		{name = 'cmdline'},
	}),
}


--------------------------------------
-- lsp configs
local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'
-- lsp.groovyls.setup{ cmd = { "java", "-jar", "/home/jglazik/.config/lsp-servers/groovy-language-server/build/libs/groovy-language-server-all.jar" }, }
-- require'lspconfig'.groovyls.setup{}
-- lsp.groovyls.setup{ cmd = { "/home/jglazik/.config/lsp-servers/groovy-language-server/groovy-language-server" }, }
lsp.gopls.setup{}
lsp.jedi_language_server.setup{}
lspfuzzy.setup{}


--------------------------------------
-- mappings
map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')


--------------------------------------
-- treesitter
require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'go',
		'java',
		'json',
		'python',
		'yaml'
	},
	sync_install = false,
	ignore_install = { '' },
	highlight = {
		enable = true,
		disable = { '' },
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
	},
	-- textobjects={
	-- 	select={
	-- 		enable=true,
	-- 		keymaps={
	-- 			['aa']='@parameter.outer', ['ia']='@parameter.inner',
	-- 			['af']='@function.outer', ['if']='@function.inner',
	-- 		},
	-- 	},
	-- 	move={
	-- 		enable=true,
	-- 		goto_next_start={[']a']='@parameter.inner', [']f']='@function.outer'},
	-- 		goto_next_end={[']A']='@parameter.inner', [']F']='@function.outer'},
	-- 		goto_previous_start={['[a']='@parameter.inner', ['[f']='@function.outer'},
	-- 		goto_previous_end={['[A']='@parameter.inner', ['[F']='@function.outer'},
	-- 	},
	-- },
}


--------------------------------------
-- gitsigns
require('gitsigns').setup{
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		-- Navigation
		map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
		map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
		-- Actions
		-- map({'n', 'v'}, '<leader>hs', gs.stage_hunk)
		-- map({'n', 'v'}, '<leader>hr', gs.reset_hunk)
		-- map('n', '<leader>hS', gs.stage_buffer)
		-- map('n', '<leader>hu', gs.undo_stage_hunk)
		-- map('n', '<leader>hR', gs.reset_buffer)
		-- map('n', '<leader>hp', gs.preview_hunk)
		-- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
		-- map('n', '<leader>tb', gs.toggle_current_line_blame)
		-- map('n', '<leader>hd', gs.diffthis)
		-- map('n', '<leader>hD', function() gs.diffthis('~') end)
		-- map('n', '<leader>td', gs.toggle_deleted)
		-- -- Text object
		-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}


--------------------------------------
-- toggleterm
require('toggleterm').setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = 'float',
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = 'curved',
		winblend = 0,
		highlights = {
			border = 'Normal',
			background = 'Normal',
		},
	},
})
