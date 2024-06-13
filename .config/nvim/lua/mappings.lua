--- indenting
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- window navigation
vim.keymap.set("n", "<leader>jh", "<C-w>h")
vim.keymap.set("n", "<leader>jl", "<C-w>l")
vim.keymap.set("n", "<leader>jk", "<C-w>k")
vim.keymap.set("n", "<leader>jj", "<C-w>j")
vim.keymap.set("n", "<leader>b", "<C-6>")

-- buffers
vim.keymap.set("n", "<leader>w", ":bd<CR>")
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")

-- file navigation
vim.keymap.set({ "n", "v" }, "J", "<C-d>zz", { noremap = true })
vim.keymap.set({ "n", "v" }, "K", "<C-u>zz", { noremap = true })

-- black hole paste
vim.keymap.set("v", "<leader>p", '"_dP')

-- line numbers
vim.api.nvim_create_user_command("ToggleNumbers", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end, {})

vim.keymap.set("n", "<leader>r", ":ToggleNumbers<CR>")

-- diagnostics
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- lsp
vim.api.nvim_create_user_command("R", "LspRestart", {})
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action)

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files)
vim.keymap.set("n", "<leader>fg", telescope.live_grep)
vim.keymap.set("n", "<leader>fb", telescope.buffers)

-- neo-tree
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>")

-- fugitive
vim.keymap.set("n", "<leader>gg", ":tab Git<cr>")
vim.keymap.set("n", "<leader>gp", ":Git push<cr>")

-- markdown-preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>")

---- trouble
vim.keymap.set("n", "<leader>dd", ":Trouble diagnostics toggle<cr>")

-- neotest
vim.keymap.set("n", "<leader>tt", ":lua require('neotest').run.run()<CR>")
vim.keymap.set("n", "<leader>to", ":lua require('neotest').output.open()<CR>")

-- copilot
vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ce", ":Copilot enable<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>cc", ":CopilotChatToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>cr", ":CopilotChatReset<CR>", {})

-- flash
vim.keymap.set("n", "s", require("flash").jump)
