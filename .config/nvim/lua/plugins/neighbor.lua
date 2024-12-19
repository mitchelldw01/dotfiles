return {
	dir = "~/src/neighbor",
	dev = true,
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>at", "<cmd>NeighborOpen test<cr>" },
		{ "<leader>aT", "<cmd>NeighborOpen test rightbelow vsplit<cr>" },
		{ "<leader>ah", "<cmd>NeighborOpen header<cr>" },
		{ "<leader>aH", "<cmd>NeighborOpen header rightbelow vsplit<cr>" },
	},
	opts = {
		extensions = {
			ripgrep = true,
			telescope = true,
		},
		contexts = {
			test = {
				use_first_match = true,
				mappings = {
					{ ".cpp", "_test.cpp" },
					{ ".h", "_test.cpp" },
					{ ".lua", "_spec.lua" },
					{ ".go", "_test.go" },
				},
			},
			header = {
				mappings = {
					{ ".cpp", ".h" },
					{ ".h", "_test.cpp" },
				},
			},
		},
	},
}
