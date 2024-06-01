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
					"docker_compose_language_service",
					"dockerls",
					"gopls",
					"gofumpt",
					"goimports",
					"golines",
					"jsonls",
					"lua_ls",
					"prettierd",
					"rust_analyzer",
					"solargraph",
					"stylua",
					"tsserver",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			}

			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			vim.diagnostic.config({
				virtual_text = {
					prefix = "■ ",
				},
				float = { border = border },
			})

			lspconfig.bashls.setup({
				capabilities = capabilities,
				handlers = handlers,
				filetypes = { "sh", "bash", "zsh", "env" },
			})

			lspconfig.biome.setup({
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

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.zls.setup({
				cmd = { "zls" },
				capabilities = capabilities,
				handlers = handlers,
			})
		end,
	},
}
