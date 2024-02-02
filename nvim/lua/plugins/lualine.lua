return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local github = require("lualine.themes.github_dark_high_contrast")
		github.normal.c.bg = "#373737"
		github.normal.c.fg = "#71B7FF"

		require("lualine").setup({
			options = {
				theme = github,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
			},
		})
	end,
}
