-- tabbing
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- markdown-preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", {})

-- buffers
vim.keymap.set("n", "<leader>w", ":bd<CR>", {})

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- neotree
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", {})

-- lsp
vim.api.nvim_create_user_command("R", "LspRestart", {})
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, {})

-- fugitive
vim.keymap.set("n", "<leader>gg", ":Git<CR>", {})
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})

-- copilot
vim.api.nvim_create_user_command("C", "CopilotChat <args>", { nargs = "*" })
vim.keymap.set("x", "<leader>cp", ":CopilotChatInPlace<CR>", {})

-- diagnostics
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- neotest
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua require('neotest').run.run()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>tf",
	":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>to",
	":lua require('neotest').output.open()<CR>",
	{ noremap = true, silent = true }
)

-- trouble
vim.keymap.set("n", "<leader>dd", ":Trouble document_diagnostics<CR>", {})
vim.keymap.set("n", "<leader>dw", ":Trouble workspace_diagnostics<CR>", {})

-- harpoon
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>ao", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>aa", function()
	harpoon:list():append()
end)

vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)
vim.keymap.set("n", "<leader>5", function()
	harpoon:list():select(4)
end)

-- window navigation
vim.api.nvim_set_keymap("n", "<leader>jh", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>jl", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>jk", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>jj", "<C-w>j", { noremap = true, silent = true })

-- file navigation
vim.keymap.set({ "n", "v" }, "J", "<C-d>zz", {})
vim.keymap.set({ "n", "v" }, "K", "<C-u>zz", {})
