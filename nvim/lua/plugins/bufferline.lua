return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				show_close_icon = false,
				show_buffer_close_icons = false,
				show_buffer_icons = false,
				numbers = "ordinal",
				indicator = {
					style = "none",
				},
			},
		})
	end,
}
