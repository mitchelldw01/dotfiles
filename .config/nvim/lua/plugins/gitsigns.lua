return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signcolumn = false,
			current_line_blame = true,
		})
	end,
}
