return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"dockerfile",
			"go",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"make",
			"markdown",
			"sql",
			"svelte",
			"rust",
			"scala",
			"typescript",
			"yaml",
			"zig",
		},
		highlight = { enable = true },
	},
	config = function(_, opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
}
