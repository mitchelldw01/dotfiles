return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "ThePrimeagen/harpoon" },
	config = function()
		local function lualine_harpoon_files()
			local harpoon = require("harpoon")
			local harpoon_list = harpoon:list()

			local result = {}
			for index, item in ipairs(harpoon_list.items) do
				local filename = item.value and vim.fn.fnamemodify(item.value, ":t") or "Unknown"
				table.insert(result, string.format("(%d) %s", index, filename))
			end

			return table.concat(result, " ")
		end

		require("lualine").setup({
			sections = {
				lualine_b = { "branch" },
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = {
					{
						lualine_harpoon_files,
						color = { fg = "#7e8fa9", gui = "none" },
					},
				},
				lualine_y = { "filetype" },
			},
		})
	end,
}
