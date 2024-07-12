return {
	"mfussenegger/nvim-dap",
	keys = {
		{ "<leader>d", "", desc = "Debug" },
		{ "<leader>dc", "<cmd>DapContinue<CR>", desc = "Continue" },
		{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
	},
	config = function()
		local dap = require("dap")
		dap.adapters.terminal = {
			type = "executable",
			command = "kitty", -- Replace with your terminal emulator
			args = { "nvim-dap", "ui" },
		}
	end,
}
