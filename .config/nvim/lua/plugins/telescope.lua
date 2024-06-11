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
			pickers = {
				find_files = {
					previewer = false,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--no-ignore-vcs",
						"--glob",
						"!**/.git/",
						"--glob",
						"!**/node_modules/",
						"--glob",
						"!**/*_.templ.*",
					},
				},
				live_grep = {
					additional_args = {
						"--hidden",
						"--no-ignore-vcs",
						"--glob",
						"!**/node_modules/",
						"--glob",
						"!**/.git/",
						"--glob",
						"!**/*_templ.*",
					},
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
