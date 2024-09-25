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
		dap.set_log_level("TRACE")
		-- vim.highlight.create("DapBreakpoint", { ctermbg = 0, guifg = "#993939", guibg = "#31353f" }, false)
		-- vim.highlight.create("DapLogPoint", { ctermbg = 0, guifg = "#61afef", guibg = "#31353f" }, false)
		-- vim.highlight.create("DapStopped", { ctermbg = 0, guifg = "#98c379", guibg = "#31353f" }, false)

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define("DapBreakpointCondition", {
			text = "🔷",
			texthl = "DapBreakpointCondition",
			linehl = "DapBreakpointCondition",
			numhl = "DapBreakpointCondition",
		})
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "⚪", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "🪵", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
		)
		vim.fn.sign_define("DapStopped", {
			text = "",
			texthl = "DapUIBreakpointsCurrentLine",
			linehl = "DapUIBreakpointsCurrentLine",
			numhl = "DapUIBreakpointsCurrentLine",
		})

		-- setup dap config by VsCode launch.json file
		-- local vscode = require("dap.ext.vscode")
		-- local json = require("plenary.json")
		-- vscode.json_decode = function(str)
		-- 	return vim.json.decode(json.json_strip_comments(str))
		-- end
		--
		-- -- Extends dap.configurations with entries read from .vscode/launch.json
		-- if vim.fn.filereadable(".vscode/launch.json") then
		-- 	vscode.load_launchjs()
		-- end
	end,
}
