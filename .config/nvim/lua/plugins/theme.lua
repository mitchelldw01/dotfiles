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
					Boolean = { bold = false },
					ModeMsg = { bold = false },
					LineNr = { fg = sumiInk7, bg = colors.palette.sumiInk3 },
					CursorLineNr = { bg = colors.palette.sumiInk3, bold = false },
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
		vim.api.nvim_set_hl(0, "@lsp.typemod.function.readonly", { link = "Function" })
		vim.api.nvim_set_hl(0, "@string.escape", { link = "String" })
		vim.api.nvim_set_hl(0, "@keyword.operator", { bold = false })
		vim.api.nvim_set_hl(0, "@variable.builtin", { italic = false })
	end,
}
