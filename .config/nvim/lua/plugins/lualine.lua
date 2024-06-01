return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local function get_lsp_status()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.buf_get_clients(bufnr)
			local filtered_clients = vim.tbl_filter(function(client)
				return client.name ~= "GitHub Copilot"
			end, clients)

			if #filtered_clients > 0 then
				return "LSP Conn"
			else
				return "Not Found"
			end
		end

		local type_name_map = {
			json = "JSON",
			yaml = "YAML",
			xml = "XML",
			html = "HTML",
			css = "CSS",
			javascript = "JavaScript",
			typescript = "TypeScript",
		}

		require("lualine").setup({
			options = {
				theme = "rose-pine",
				component_separators = { "", "" },
			},
			sections = {
				lualine_a = { { "mode" } },
				lualine_b = { { "branch" } },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{ "diagnostics" },
					{
						"filetype",
						fmt = function(str)
							if type_name_map[str] then
								return type_name_map[str]
							end
							return str:sub(1, 1):upper() .. str:sub(2)
						end,
					},
				},
				lualine_y = { { get_lsp_status } },
				lualine_z = {
					{
						function()
							return os.date("%-I:%M %p")
						end,
					},
				},
			},
		})
	end,
}
