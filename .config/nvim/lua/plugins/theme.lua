return {
	"oxfist/night-owl.nvim",
	config = function()
		require("night-owl").setup({
			bold = false,
			italics = false,
			underline = false,
			undercurl = false,
		})

		vim.cmd.colorscheme("night-owl")
	end,
}
