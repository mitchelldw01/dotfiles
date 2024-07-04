return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
				"dockerfile",
				"gleam",
				"go",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"make",
				"markdown",
				"nix",
				"sql",
				"ruby",
				"rust",
				"scala",
				"templ",
				"typescript",
				"yaml",
				"zig",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
