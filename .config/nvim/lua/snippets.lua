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
		i(1), t({'return nil, err'}),
		t({'', '}', ''}),
	}),
	s('iferrnew', {
		t({'if err := '}),
		i(1),
		t({'; err != nil {', '\t'}),
		t({'', '}', ''}),
	}),
	s('ifok', {
		t({'if ok {', '\t'}),
		i(1),
		t({'', '}', ''}),
	}),
	s('ifnotok', {
		t({'if !ok {', '\t'}),
		i(1),
		t({'', '}', ''}),
	}),
	s('switch', {
		t({'switch '}),
		i(1),
		t({' {', ''}),
		t({'case "'}),
		i(2),
		t({'":', ''}),
		t({'\t', ''}),
		t({'default:', ''}),
		t({'\t', ''}),
		t({'}'}),
	}),
}),

-- ls.snippets = {
-- 	all = {
-- 		ls.parser.parse_snippet('proddev', '/*prod_begin*/\n\n/*prod_end*/\n/*dev_begin\n\ndev_end*/'),
-- 	}

})
