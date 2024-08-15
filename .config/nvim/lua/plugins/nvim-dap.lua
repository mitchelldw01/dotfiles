return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "theHamsta/nvim-dap-virtual-text" },
		{ "rcarriga/nvim-dap-ui" },
		{ "nvim-neotest/nvim-nio" },
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
				command = "/usr/bin/lldb-vscode",
				name = "lldb",
			},
			["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = { "/Users/mitchell/bin/js-debug/src/dapDebugServer.js", "${port}" },
				},
			},
		}

		dap.configurations = {
			c = {
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
			javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			},
		}
	end,
}
