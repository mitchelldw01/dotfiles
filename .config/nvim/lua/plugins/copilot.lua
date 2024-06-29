return {
	{
		"github/copilot.vim",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("CopilotChat").setup({
				show_help = false,
				question_header = " User ",
				answer_header = " Robot Man ",
				error_header = " Error ",
				window = {
					layout = "float",
					width = 0.7,
					height = 0.7,
					border = "rounded",
				},
			})
		end,
	},
}
