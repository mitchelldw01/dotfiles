return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local type_name_map = {
			json = "JSON",
			yaml = "YAML",
			xml = "XML",
			html = "HTML",
			css = "CSS",
			javascript = "JavaScript",
			typescript = "TypeScript",
		}

		local function format_filetype(str)
			if type_name_map[str] then
				return type_name_map[str]
			end
			return str:sub(1, 1):upper() .. str:sub(2)
		end

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

		local bg = "#121219"
		local theme = require("lualine.themes.tokyonight")

		theme.command.a.fg = theme.command.a.bg
		theme.command.a.bg = bg

		theme.inactive.a.fg = theme.inactive.a.bg
		theme.inactive.a.bg = bg
		theme.inactive.c.bg = bg

		theme.normal.a.fg = theme.normal.a.bg
		theme.normal.a.bg = bg
		theme.normal.c.bg = bg

		theme.insert.a.fg = theme.insert.a.bg
		theme.insert.a.bg = bg

		theme.replace.a.fg = theme.replace.a.bg
		theme.replace.a.bg = bg

		theme.terminal.a.fg = theme.terminal.a.bg
		theme.terminal.a.bg = bg

		theme.visual.a.fg = theme.visual.a.bg
		theme.visual.a.bg = bg

		require("lualine").setup({
			options = {
				theme = theme,
				component_separators = { "", "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { { "mode" } },
				lualine_b = {},
				lualine_c = {
					{ "branch" },
					{ "filename", path = 1 },
				},
				lualine_x = {
					{ "diagnostics" },
					{
						"filetype",
						fmt = format_filetype,
					},
					{ get_lsp_status },
					{
						function()
							return os.date("%-I:%M %p")
						end,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
