return {
	"tpope/vim-commentary",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "c",
			callback = function()
				vim.bo.commentstring = "// %s"
			end,
		})
	end,
}
