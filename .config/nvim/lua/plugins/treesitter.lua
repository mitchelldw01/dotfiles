return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
				"dockerfile",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"make",
				"markdown",
				"nix",
				"ruby",
				"rust",
				"typescript",
				"yaml",
				"zig",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
