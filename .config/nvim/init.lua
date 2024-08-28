vim.g.mapleader = " "
vim.g.zig_fmt_autosave = false
vim.opt.clipboard = "unnamedplus"
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.o.scrolloff = 8
vim.o.cmdheight = 0
vim.o.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.foldcolumn = "1"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "javascript", "typescript", "yaml", "json", "jsonc", "gleam" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

vim.filetype.add({
	extension = {
		ash = "sh",
		env = "sh",
	},
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
		if #vim.fn.argv() == 0 then
			require("telescope.builtin").find_files()
		end

		vim.cmd("RenderMarkdown disable")
	end,
})
