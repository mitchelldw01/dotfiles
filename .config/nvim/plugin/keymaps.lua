local opts = { noremap = true }

vim.keymap.set("n", "<leader>w", "<cmd>bd<cr>", opts)
vim.keymap.set("n", "<leader>a", "<C-^>", opts)
vim.keymap.set("v", "<leader>p", '"_dP', opts)
vim.keymap.set("n", "<leader>/", "<cmd>noh<cr>", opts)
vim.keymap.set("t", "<C-ESC>", "<C-\\><C-n>", opts)

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set({ "n", "v" }, "J", "<C-d>zz", opts)
vim.keymap.set({ "n", "v" }, "K", "<C-u>zz", opts)

vim.keymap.set("n", "<leader>ts", "<cmd>tab split<cr>", opts)
vim.keymap.set("n", "<leader>tw", "<cmd>tabclose<cr>", opts)

vim.keymap.set("n", "<leader>s", "<cmd>vsplit<cr><C-w>w", opts)
vim.keymap.set("n", "<leader>mh", "<C-w>H", opts)
vim.keymap.set("n", "<leader>mj", "<C-w>J", opts)
vim.keymap.set("n", "<leader>mk", "<C-w>K", opts)
vim.keymap.set("n", "<leader>ml", "<C-w>L", opts)

vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)

vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerminal<cr>", opts)
vim.keymap.set("n", "<leader>tj", "<cmd>ToggleTerminal lazygit<cr><cmd>startinsert<cr>", opts)
vim.keymap.set("n", "<leader>tk", "<cmd>ToggleTerminal lazydocker<cr><cmd>startinsert<cr>", opts)
