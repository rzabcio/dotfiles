--------------------------------------
-- cmp
local cmp = require('cmp')
local menu = {buffer = '[Buf]', nvim_lsp = '[LSP]', omni = '[Omni]', path = '[Path]'}
local widths = {abbr = 80, kind = 40, menu = 40}
cmp.setup {
	completion = {keyword_length = 2},
	formatting = {
		format = function(entry, vim_item)
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
	},
	preselect = require('cmp.types').cmp.PreselectMode.None,
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		{name = 'omni'},
		{name = 'path'},
		{name = 'buffer'},
	}),
}
