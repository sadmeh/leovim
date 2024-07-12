return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-neotest/neotest-python",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python"),
			},
		})
	end,
	keys = {
		{
			"<leader>t",
			"",
			desc = "🧪Test",
		},
		{
			"<leader>tso",
			function()
				require("neotest").summary.open()
			end,
			desc = "Summary Open",
		},
		{
			"<leader>tsc",
			function()
				require("neotest").summary.close()
			end,
			desc = "Summary Close",
		},
		{
			"<leader>tst",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Summary Open",
		},

		{
			"<leader>tt",
			function()
				require("neotest").run.run()
			end,
			desc = "Run Nearest Test",
		},
		{
			"<leader>ts",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop Nearest Test",
		},
		{
			"<leader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug Nearest Test",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run Current File",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true })
			end,
			desc = "Open Test Output",
		},
		{
			"<leader>tp",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Output Pannel Toggle",
		},
	},
}
