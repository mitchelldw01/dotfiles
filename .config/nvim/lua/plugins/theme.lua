return {
	"rose-pine/neovim",
	config = function()
		require("rose-pine").setup({
			styles = {
				bold = false,
				italic = false,
			},
			before_highlight = function(_, highlight, palette)
				if highlight.fg == palette.pine then
					highlight.fg = "#3d90b2"
				end
			end,
		})

		vim.cmd.colorscheme("rose-pine")
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#403d52" })
	end,
}
