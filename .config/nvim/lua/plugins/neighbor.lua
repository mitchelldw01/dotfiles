return {
	dir = "~/src/neighbor",
	dev = true,
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>at", "<cmd>NeighborOpen test<cr>" },
		{ "<leader>aT", "<cmd>NeighborOpen test 'rightbelow vsplit'<cr>" },
		{ "<leader>ah", "<cmd>NeighborOpen header<cr>" },
		{ "<leader>aH", "<cmd>NeighborOpen header 'rightbelow vsplit'<cr>" },
	},
	opts = {
		remember_selections = false,
		extenstions = {
			ripgrep = true,
			telescope = true,
		},
		contexts = {
			{
				name = "test",
				use_first_match = true,
				mappings = {
					{ ".cpp", "_test.cpp" },
					{ ".h", "_test.cpp" },
					{ ".go", "_test.go" },
				},
			},
			{
				name = "header",
				mappings = {
					{ ".cpp", ".h" },
					{ ".h", "_test.cpp" },
				},
			},
		},
	},
}
