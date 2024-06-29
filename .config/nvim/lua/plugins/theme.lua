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
		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#162943" })
	end,
}
