return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"bashls",
					"biome",
					"clangd",
					"clang-format",
					"docker_compose_language_service",
					"dockerls",
					"gopls",
					"goimports",
					"golines",
					"jsonls",
					"lua_ls",
					"mesonlsp",
					"prettierd",
					"rust_analyzer",
					"solargraph",
					"stylua",
					"ts_ls",
					"zls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

			vim.diagnostic.config({
				virtual_text = {
					prefix = "■ ",
				},
				float = { border = "rounded" },
				signs = false,
			})

			lspconfig.bashls.setup({
				capabilities = capabilities,
				handlers = handlers,
				filetypes = { "sh", "bash", "ash", "zsh", "env" },
			})

			lspconfig.biome.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.dockerls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.gleam.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			lspconfig.mesonlsp.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				handlers = handlers,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})

			lspconfig.solargraph.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.templ.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
			})

			lspconfig.zls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})
		end,
	},
}
