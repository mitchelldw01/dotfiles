return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{ "<leader>n", "<cmd>OilToggle<cr>" },
	},
	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)

		local toggle_oil = function()
			if vim.bo.filetype == "oil" then
				oil.close()
			else
				oil.open()
			end
		end

		vim.api.nvim_create_user_command("OilToggle", toggle_oil, {})
	end,
}
