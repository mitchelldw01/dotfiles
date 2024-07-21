return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			commentStyle = { italic = false },
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
			overrides = function(colors)
				local sumiInk7 = "#7d7d9b"

				return {
					LineNr = { bg = colors.palette.sumiInk3, fg = sumiInk7 },
					CursorLineNr = { bg = colors.palette.sumiInk3 },
					SignColumn = { bg = colors.palette.sumiInk3 },
					FoldColumn = { bg = colors.palette.sumiInk3 },
					NormalFloat = { bg = colors.palette.sumiInk3 },
					FloatBorder = { bg = colors.palette.sumiInk3 },
					WinSeparator = { fg = colors.palette.sumiInk6 },
					NonText = { fg = sumiInk7 },
				}
			end,
		})

		vim.cmd("colorscheme kanagawa")
	end,
}
