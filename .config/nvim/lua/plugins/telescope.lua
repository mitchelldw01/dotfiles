return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	config = function()
		require("telescope").setup({
			find_files = {
				hidden = true,
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					previewer = false,
				},
				live_grep = {
					additional_args = function(_)
						return { "--hidden", "--glob", "!**/.git/*" }
					end,
				},
				buffers = {
					sort_mru = true,
					ignore_current_buffer = true,
					previewer = false,
				},
			},
		})
	end,
}
