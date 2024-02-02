return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local highlight = {
			"Surface",
		}

		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "Surface", { fg = "#414141" })
		end)

		require("ibl").setup({
			indent = {
				highlight = highlight,
				char = "▏",
			},
			scope = { enabled = false },
		})
	end,
}
