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
		local ignore_patterns = {
			"**/.git/",
			"**/node_modules/",
			"**/*_templ.*",
			"build/*",
			".cache/*",
			"vendor/*",
			".zig-cache/*",
		}

		local ignore_flags = {}
		for _, pattern in ipairs(ignore_patterns) do
			table.insert(ignore_flags, "--glob")
			table.insert(ignore_flags, "!" .. pattern)
		end

		require("telescope").setup({
			pickers = {
				find_files = {
					previewer = false,
					find_command = vim.list_extend({ "rg", "--files", "--hidden", "--no-ignore-vcs" }, ignore_flags),
				},
				live_grep = {
					additional_args = function()
						return vim.list_extend({ "--hidden", "--no-ignore-vcs" }, ignore_flags)
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
