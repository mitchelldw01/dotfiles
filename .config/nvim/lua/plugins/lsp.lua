return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local mason = require("mason")
			local lspconfig = require("mason-lspconfig")

			mason.setup()

			lspconfig.setup({
				ensure_installed = {
					"bashls",
					"clangd",
					"cssls",
					"docker_compose_language_service",
					"dockerls",
					"gopls",
					"html",
					"jsonls",
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			local lspconfig = require("lspconfig")

			local base_config = {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
				handlers = {
					["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
					["textDocument/signatureHelp"] = vim.lsp.with(
						vim.lsp.handlers.signature_help,
						{ border = "rounded" }
					),
				},
			}

			lspconfig.cssls.setup(base_config)
			lspconfig.docker_compose_language_service.setup(base_config)
			lspconfig.dockerls.setup(base_config)
			lspconfig.gopls.setup(base_config)
			lspconfig.html.setup(base_config)
			lspconfig.jsonls.setup(base_config)
			lspconfig.lua_ls.setup(base_config)
			lspconfig.ts_ls.setup(base_config)

			lspconfig.bashls.setup(vim.tbl_deep_extend("keep", base_config, {
				filetypes = { "ash", "bash", "env", "sh", "zsh" },
			}))

			lspconfig.clangd.setup(vim.tbl_deep_extend("keep", base_config, {
				cmd = { "clangd", "--offset-encoding=utf-16", "--function-arg-placeholders=0" },
			}))

			lspconfig.rust_analyzer.setup(vim.tbl_deep_extend("keep", base_config, {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			}))

			lspconfig.zls.setup(vim.tbl_deep_extend("keep", base_config, {
				cmd = { "zls" },
			}))
		end,
	},
}
