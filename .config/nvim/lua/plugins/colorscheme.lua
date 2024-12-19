return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		styles = {
			comments = { italic = false },
			keywords = { italic = false },
			sidebars = "transparent",
			floats = "transparent",
		},
		on_highlights = function(hl, c)
			hl.WinSeparator = { fg = c.fg_gutter }
			hl.CursorLineNr = { fg = c.fg }
			hl.LineNrAbove = { fg = c.fg_dark }
			hl.LineNrBelow = { fg = c.fg_dark }
			hl.IblScope = { fg = c.fg_gutter }
			hl.IblIndent = { fg = "#323953" }
			hl.NormalFloat = { bg = c.bg_dark1 }
			hl.FloatBorder = { bg = c.bg_dark1 }
			hl.CmpNormal = { bg = c.bg_dark1 }
			hl.CmpDocNormal = { bg = c.bg_dark }
			hl.CmpDocBorder = { bg = c.bg_dark }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
}
