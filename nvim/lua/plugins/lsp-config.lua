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
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "tsserver", "rust_analyzer", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilites = capabilities,
			})

			lspconfig.tsserver.setup({
				capabilites = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilites = capabilities,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})

			lspconfig.gopls.setup({
				capabilites = capabilities,
				settings = {
					gopls = {
						gofumpt = true,
					},
				},
			})

			lspconfig.bashls.setup({
				capabilites = capabilities,
			})

			lspconfig.zls.setup({
				cmd = { "zls" },
				capabilites = capabilities,
			})

			lspconfig.pyright.setup({
				capabilites = capabilities,
			})
		end,
	},
}
