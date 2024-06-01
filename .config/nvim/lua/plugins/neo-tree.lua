return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 30,
			},
			filesystem = {
				use_libuv_file_watcher = true,
				close_if_last_window = true,
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_hidden = false,
					hide_gitignored = false,
					hide_by_name = {
						".git",
					},
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
			default_component_configs = {
				name = {
					use_git_status_colors = false,
				},
				container = {
					enable_character_fade = false,
				},
			},
		})
	end,
}
