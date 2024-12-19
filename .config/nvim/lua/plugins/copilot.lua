return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				keymap = {
					accept = "<M-\\>",
				},
			},
		},
	},
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				{ "zbirenbaum/copilot.lua" },
				{ "nvim-lua/plenary.nvim", branch = "master" },
			},
			build = "make tiktoken",
			keys = {
				{ "<leader>cc", "<cmd>CopilotChatToggle<cr>" },
				{ "<leader>cr", "<cmd>CopilotChatReset<cr>" },
			},
			opts = {
				answer_header = "## Robot Man ",
				window = {
					layout = "float",
					width = 0.8,
					height = 0.8,
				},
				show_help = false,
			},
		},
	},
}
