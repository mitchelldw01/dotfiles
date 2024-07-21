return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"rouge8/neotest-rust",
		"marilari88/neotest-vitest",
		"lawrence-laz/neotest-zig",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go"),
				require("neotest-rust"),
				require("neotest-vitest"),
				require("neotest-zig"),
			},
		})
	end,
}
