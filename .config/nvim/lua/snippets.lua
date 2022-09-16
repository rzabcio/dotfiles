local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end



local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local ri = function (insert_node_id)
	return f(function (args) return args[1][1] end, insert_node_id)
end

ls.config.set_config({
	history = true,
	
ls.add_snippets('groovy', {
	s('proddev', {
		t({'/*prod_begin*/', ''}),
		i(1),
		t({'', '/*prod_end*/', ''}),
		t({'/*dev_begin', ''}),
		ri(1),
		t({'', 'dev_end*/', ''}),
	}),
}),

ls.add_snippets('go', {
	s('iferr', {
		t({'if err != nil {', '\t'}),
		i(1),
		t({'', '}', ''}),
	}),
}),

-- ls.snippets = {
-- 	all = {
-- 		ls.parser.parse_snippet('proddev', '/*prod_begin*/\n\n/*prod_end*/\n/*dev_begin\n\ndev_end*/'),
-- 	}

})
