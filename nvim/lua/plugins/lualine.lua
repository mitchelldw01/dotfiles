return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "ThePrimeagen/harpoon" },
	config = function()
		require("lualine").setup({
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = { "fileformat", "filetype" },
			},
		})
	end,
}
