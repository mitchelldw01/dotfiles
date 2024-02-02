vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.scrolloff = 10
vim.o.wrap = false

vim.opt.signcolumn = "yes"

vim.opt.conceallevel = 1

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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.wo.wrap = true
	end,
})

local search_performed = false

vim.api.nvim_create_augroup("SearchHighlight", { clear = true })
vim.api.nvim_create_autocmd("CmdlineLeave", {
	group = "SearchHighlight",
	pattern = { "/", "?" },
	callback = function()
		if vim.v.event.cmdtype == "/" or vim.v.event.cmdtype == "?" then
			search_performed = true
		end
	end,
})

vim.keymap.set("n", "<Esc>", function()
	if search_performed then
		vim.cmd("nohlsearch")
		search_performed = false
	end
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end, { noremap = true, silent = true })

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
