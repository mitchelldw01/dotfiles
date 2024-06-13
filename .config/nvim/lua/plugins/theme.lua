return {
	"tokyonight.nvim",
	config = function()
		local bg_highlight = "#222637"
		local comment = "#6571A2"
		local line_nr = "#515C86"
		local ibl_indent = "#313751"
		local ibl_scope = "#4B5580"

		require("tokyonight").setup({
			style = "night",
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				sidebars = "normal",
				floats = "normal",
			},
			on_colors = function(colors)
				colors.comment = comment
				colors.bg_highlight = bg_highlight
			end,
			on_highlights = function(hl, c)
				hl.CursorLineNr = { fg = c.fg, bold = false }
				hl.LineNrAbove = { fg = line_nr }
				hl.LineNrBelow = { fg = line_nr }
				hl.IblIndent = { fg = ibl_indent }
				hl.IblScope = { fg = ibl_scope }
				hl.NeoTreeWinSeparator = { fg = c.bg }
			end,
		})

		vim.cmd.colorscheme("tokyonight-night")
	end,
}
