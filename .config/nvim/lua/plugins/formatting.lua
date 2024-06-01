return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "goimports", "golines" },
					javascript = { "biome", "prettierd" },
					typescript = { "biome", "prettierd" },
					jsonc = { "biome", "prettierd" },
					json = { "biome", "prettierd" },
					yaml = { "prettierd" },
					ruby = { "rubocop" },
				},
				format_after_save = {
					async = true,
					lsp_fallback = true,
					timeout_ms = 2500,
				},
				formatters = {
					golines = {
						args = { "-m", "120" },
					},
					biome = {
						command = "biome",
						args = { "check", "--apply", "$FILENAME" },
						stdin = false,
						cwd = require("conform.util").root_file({ "biome.json" }),
						require_cwd = true,
						exit_codes = { 0, 1 },
					},
					prettierd = {
						cwd = require("conform.util").root_file({ ".prettierrc" }),
						require_cwd = true,
					},
					rubocop = {
						command = "rubocop",
						args = { "-A", "$FILENAME" },
						stdin = false,
						cwd = require("conform.util").root_file({ "Gemfile" }),
						require_cwd = true,
					},
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				go = { "golangcilint" },
				javascript = { "biomejs" },
				typescript = { "biomejs" },
				ruby = { { "rubocop" } },
			}
		end,
	},
}
