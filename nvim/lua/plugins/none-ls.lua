return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local function has_config_file(filename)
			local function exists_in_dir(dir)
				return vim.fn.filereadable(dir .. "/" .. filename) ~= 0
			end
			local cwd = vim.fn.getcwd()
			while cwd do
				if exists_in_dir(cwd) then
					return true
				end
				local parent = vim.fn.fnamemodify(cwd, ":h")
				if parent == cwd then
					break
				end
				cwd = parent
			end
			return false
		end

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.prettier.with({
					command = "prettierd",
					condition = function()
						return has_config_file(".prettierrc")
							or has_config_file(".prettierrc.js")
							or has_config_file("prettier.config.js")
					end,
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								---@diagnostic disable-next-line: redefined-local
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
