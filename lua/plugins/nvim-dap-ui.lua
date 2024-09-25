return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "folke/neodev.nvim", "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "»" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			layouts = {
				{
					elements = {
						"scopes",
						-- 'breakpoints',
						"stacks",
						-- 'watches',
					},
					size = 30,
					position = "left",
				},
				{
					elements = {
						-- "repl",
						"console",
					},
					size = 40,
					position = "right",
				},
			},
			floating = {
				max_height = nil, -- These can be integers or a float between 0 and 1.
				max_width = nil, -- Floats will be treated as percentage of your screen.
				border = "rounded", -- Border style. Can be "single", "double" or "rounded"
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			controls = {
				-- Requires Neovim nightly (or 0.8 when released)
				enabled = false, -- because the icons don't work
				-- Display controls in this element
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
				},
			},
			windows = { indent = 1 },
		})
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
	end,
	keys = {
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle UI",
		},
		{
			"<leader>dt",
			function()
				local dap = require("dap")
				local dapui = require("dapui")
				dap.terminate()
				dap.close()
				dapui.close()
			end,
			desc = "Terminate",
		},

		{
			"<leader>dp",
			function()
				require("dap").repl.toggle()
			end,
			desc = "REPL",
		},
		{
			"<leader>dw",
			function()
				require("dapui").float_element("watches")
			end,
			desc = "Watches",
		},
		{ "<leader>dn", require("dap").step_over, desc = "Step Over" },
		{ "<leader>di", require("dap").step_into, desc = "Step Into" },
		{ "<leader>do", require("dap").step_out, desc = "Step Out" },
		{ "<leader>dr", require("dap").restart, desc = "Restart(Again)" },
		{ "<leader>ds", require("dap").stop, desc = "Stop" },
		{ "<leader>dl", require("dap").run_last, desc = "Run Last Debug Session" },
		{
			"<leader>dB",
			"<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			desc = "Conditional Breakpoint",
		},
		{
			"<leader>de",
			function()
				require("dapui").eval(nil, { enter = true })
			end,
			desc = "Eval",
		},
	},
}

-- return {
-- 	"rcarriga/nvim-dap-ui",
-- 	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
-- 	config = function()
-- 		local dap, dapui = require("dap"), require("dapui")
-- 		dap.listeners.before.attach.dapui_config = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.launch.dapui_config = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.event_terminated.dapui_config = function()
-- 			dapui.close()
-- 		end
-- 		dap.listeners.before.event_exited.dapui_config = function()
-- 			dapui.close()
-- 		end
-- 	end,
--
