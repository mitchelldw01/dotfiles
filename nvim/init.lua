vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.scrolloff = 10
vim.o.wrap = false

vim.opt.signcolumn = "yes"
vim.opt.conceallevel = 0

vim.wo.number = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "go.mod",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "build.zig.zon",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.wo.wrap = true
	end,
})

function ToggleColorColumn()
	if vim.wo.colorcolumn == "120" then
		vim.wo.colorcolumn = ""
	else
		vim.wo.colorcolumn = "120"
	end
end

vim.api.nvim_set_keymap("n", "<leader>sv", ":lua ToggleColorColumn()<CR>", { noremap = true, silent = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("mappings")

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		local cwd = vim.fn.getcwd()
		local directory_name = cwd:match("([^/]+)$")

		vim.api.nvim_set_option("titlestring", "vim » " .. directory_name)
		vim.api.nvim_set_option("title", true)

		if #vim.fn.argv() == 0 then
			require("telescope.builtin").find_files()
		end
	end,
})

vim.cmd([[highlight ColorColumn ctermbg=none guibg=#BDE567]])
