return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>" },
		{ "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>" },
	},
	config = function()
		local telescope = require("telescope")

		local ignore_dirs = {
			".cache",
			".git",
			".zig-cache",
			"build",
			"node_modules",
		}

		local rg_options = {}
		for _, dir in ipairs(ignore_dirs) do
			table.insert(rg_options, "-g")
			table.insert(rg_options, "!**/" .. dir .. "/*")
		end

		telescope.setup({
			extensions = {
				["ui-select"] = {},
			},
			pickers = {
				find_files = {
					find_command = vim.list_extend({ "rg", "--files", "--hidden", "--no-ignore-vcs" }, rg_options),
				},
				live_grep = {
					additional_args = function()
						return vim.list_extend({ "--hidden", "--no-ignore-vcs" }, rg_options)
					end,
				},
				buffers = {
					sort_mru = true,
					ignore_current_buffer = true,
				},
			},
		})

		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
	end,
}
