local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--------------------------------------
-- cmp
local cmp = require('cmp')
local luasnip = require('luasnip')
require("luasnip/loaders/from_vscode").lazy_load()
local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end
local menu = {
	buffer = '[Buf]',
	buffer_lines = '[Buf]',
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
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {keyword_length = 2},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = vim_item.menu or menu[entry.source.name]
			-- 2022-10-03: jglazik: commented because there were some errors
			-- for k, width in pairs(widths) do
			-- 	if #vim_item[k] > width then
			-- 		vim_item[k] = fmt('%s...', string.sub(vim_item[k], 1, width))
			-- 	end
			-- end
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm {select=true},
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			-- elseif has_words_before() then
			-- 	cmp.complete()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	preselect = require('cmp.types').cmp.PreselectMode.None,
	sources = cmp.config.sources({
		{name = 'luasnip'},
		{name = 'nvim_lsp'},
		{name = 'omni'},
		{name = 'path'},
		{name = 'buffer'},
		-- {name = 'cmdline'},
	}),
}


--------------------------------------
-- lsp configs
require("mason").setup()
require("mason-lspconfig").setup()
local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'
-- lsp.groovyls.setup{ cmd = { "java", "-jar", "/home/jglazik/.config/lsp-servers/groovy-language-server/build/libs/groovy-language-server-all.jar" }, }
-- lsp.groovyls.setup{ cmd = { "/home/jglazik/.config/lsp-servers/groovy-language-server/groovy-language-server" }, }
lsp.gopls.setup{}
-- lsp.lua.setup{}
-- lsp.sumneko_lua.setup{}
lsp.pylsp.setup{
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {'W391', 'W503'},
					maxLineLength = 160
				}
			}
		}
	}
}
lsp.pyright.setup{}
lspfuzzy.setup{}


--------------------------------------
-- mappings
map('n', '<space>,', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', '<space>xx', '<cmd>TroubleToggle<CR>')
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = '[K] Hover documentation' })


--------------------------------------
-- treesitter
require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'comment',
		'go',
		'java',
		'json',
		'lua',
		'python',
		'yaml',
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
	-- rainbow = {
	-- 	enable = true,
	-- },
	textobjects={
		select={
			enable=true,
			lookahead=true,
			keymaps={
				['aa']='@parameter.outer',
				['ia']='@parameter.inner',
				['af']='@function.outer',
				['if']='@function.inner',
				['ac']='@class.outer',
				['ic']='@class.inner',
			},
		},
		move={
			enable=true,
			set_jumps=true,
			goto_next_start={
				[']a']='@parameter.inner',
				[']f']='@function.outer'
			},
			goto_next_end={
				[']A']='@parameter.inner',
				[']F']='@function.outer'
			},
			goto_previous_start={
				['[a']='@parameter.inner',
				['[f']='@function.outer'
			},
			goto_previous_end={
				['[A']='@parameter.inner',
				['[F']='@function.outer'
			},
		},
	},
}


--------------------------------------
-- symbols
if vim.fn.has("nvim-0.8") == 1 then
require('aerial').setup({})
end


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


--------------------------------------
-- todo
if vim.fn.has("nvim-0.8") == 1 then
require("todo-comments").setup({
	signs = true, -- show icons in the signs column
	sign_priority = 8, -- sign priority
	-- keywords recognized as todo comments
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
	},
	merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		before = "", -- "fg" or "bg" or empty
		keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
		after = "fg", -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 400, -- ignore lines longer than this
		exclude = {}, -- list of file types to exclude highlighting
	},
	-- list of named colors where we try to extract the guifg from the
	-- list of hilight groups or use the hex color if hl not found as a fallback
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
})
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
end

--------------------------------------
-- go
require("go").setup()
-- Run gofmt on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)
-- TS import suppoer (?)
-- vim.api.nvim_exec([[ autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500) ]], false)

