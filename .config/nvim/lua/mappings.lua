--- indenting
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- buffers
vim.keymap.set("n", "<leader>w", ":bd<CR>")
vim.keymap.set("n", "<leader>s", ":vsplit<CR><C-w>w")
vim.keymap.set("n", "<leader>b", "<C-6>")

-- file navigation
vim.keymap.set({ "n", "v" }, "J", "<C-d>zz", { noremap = true })
vim.keymap.set({ "n", "v" }, "K", "<C-u>zz", { noremap = true })

-- black hole paste
vim.keymap.set("v", "<leader>p", '"_dP')

-- highlight
vim.keymap.set("n", "<leader>/", ":noh<CR>")

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
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- lsp
vim.api.nvim_create_user_command("R", "LspRestart", {})
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action)

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files)
vim.keymap.set("n", "<leader>fg", telescope.live_grep)
vim.keymap.set("n", "<leader>fb", telescope.buffers)
vim.keymap.set("n", "<leader>fr", telescope.lsp_references)

-- neo-tree
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>")

-- fugitive
vim.keymap.set("n", "<leader>gg", ":tab Git<CR>")
vim.keymap.set("n", "<leader>gp", ":Git push<CR>")

-- markdown-preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>")

---- trouble
vim.keymap.set("n", "<leader>dd", ":Trouble diagnostics toggle focus=true<CR>")

-- neotest
local neotest = require("neotest")
vim.keymap.set("n", "<leader>tt", neotest.run.run)
vim.keymap.set("n", "<leader>to", neotest.output.open)

-- copilot
vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ce", ":Copilot enable<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>cc", ":CopilotChatToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>cr", ":CopilotChatReset<CR>", {})

-- flash
vim.keymap.set("n", "s", require("flash").jump)

-- harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>aa", harpoon_mark.add_file)
vim.keymap.set("n", "<leader>ao", harpoon_ui.toggle_quick_menu)

for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		harpoon_ui.nav_file(i)
	end)
end

-- neogen
local neogen = require("neogen")

vim.keymap.set("n", "<Leader>mc", neogen.generate)
vim.keymap.set("n", "<Leader>mf", function()
	neogen.generate({ type = "func" })
end)

-- nvim-dap
local dap = require("dap")

vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>do", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>du", dap.step_out)
vim.keymap.set("n", "<leader>dq", dap.terminate)
