return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "theHamsta/nvim-dap-virtual-text" },
		{ "rcarriga/nvim-dap-ui" },
		{ "nvim-neotest/nvim-nio" },
	},
	keys = {
		{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>" },
		{ "<leader>dc", "<cmd>DapContinue<cr>" },
		{ "<leader>ds", "<cmd>DapStepOver<cr>" },
		{ "<leader>di", "<cmd>DapStepInto<cr>" },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		require("nvim-dap-virtual-text").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters = {
			lldb = {
				type = "executable",
				command = "/opt/homebrew/bin/lldb-vscode",
				name = "lldb",
			},
		}

		dap.configurations = {
			cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					program = function()
						return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					args = function()
						local input = vim.fn.input("Arguments: ")
						return vim.split(input, " ", { trimempty = true })
					end,
				},
			},
		}
	end,
}
