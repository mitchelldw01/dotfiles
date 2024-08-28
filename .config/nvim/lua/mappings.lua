--- indenting
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- buffers
vim.keymap.set("n", "<leader>w", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", ":vsplit<CR><C-w>w", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", "<C-6>", { noremap = true, silent = true })

-- file navigation
vim.keymap.set({ "n", "v" }, "J", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "K", "<C-u>zz", { noremap = true, silent = true })

-- black hole paste
vim.keymap.set("v", "<leader>p", '"_dP', { noremap = true, silent = true })

-- highlight
vim.keymap.set("n", "<leader>/", ":noh<CR>", { noremap = true, silent = true })

-- word wrap
vim.keymap.set("n", "<leader>!", ":setlocal wrap!<CR>", { noremap = true, silent = true })

-- line numbers
vim.api.nvim_create_user_command("ToggleNumbers", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end, {})

vim.keymap.set("n", "<leader>r", ":ToggleNumbers<CR>", { noremap = true, silent = true })

-- diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

-- lsp
vim.api.nvim_create_user_command("R", "LspRestart", {})
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { noremap = true, silent = true })

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fr", telescope.lsp_references, { noremap = true, silent = true })

-- neo-tree
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- fugitive
vim.keymap.set("n", "<leader>gg", ":tab Git<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true })

-- markdown-preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })

---- trouble
vim.keymap.set("n", "<leader>dd", ":Trouble diagnostics toggle focus=true<CR>", { noremap = true, silent = true })

-- neotest
local neotest = require("neotest")
vim.keymap.set("n", "<leader>tt", neotest.run.run, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>to", neotest.output.open, { noremap = true, silent = true })

-- copilot
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cc", ":CopilotChatToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cr", ":CopilotChatReset<CR>", { noremap = true, silent = true })

-- flash
vim.keymap.set("n", "s", require("flash").jump, { noremap = true, silent = true })

-- harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>aa", harpoon_mark.add_file, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ao", harpoon_ui.toggle_quick_menu, { noremap = true, silent = true })

for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		harpoon_ui.nav_file(i)
	end, { noremap = true, silent = true })
end

-- neogen
local neogen = require("neogen")

vim.keymap.set("n", "<leader>mc", neogen.generate, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>mf", function()
	neogen.generate({ type = "func" })
end, { noremap = true, silent = true })

-- nvim-dap
local dap = require("dap")

vim.keymap.set("n", "<leader>dc", dap.continue, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dn", dap.clear_breakpoints, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>do", dap.step_over, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>di", dap.step_into, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>du", dap.step_out, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dq", dap.terminate, { noremap = true, silent = true })

-- command line
vim.keymap.set("n", "<leader>;", ":!", { noremap = true, silent = false })
