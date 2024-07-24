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
		function ToggleAndFocus(panel_name, toggle_function)
			local winid = nil
			for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
				local bufnr = vim.api.nvim_win_get_buf(win)
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match(panel_name) then
					winid = win
					break
				end
			end

			if winid then
				-- Close the panel if it's already open
				vim.api.nvim_win_close(winid, true)
			else
				-- Open the panel and focus on it
				toggle_function()
				for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
					local bufnr = vim.api.nvim_win_get_buf(win)
					local bufname = vim.api.nvim_buf_get_name(bufnr)
					if bufname:match(panel_name) then
						vim.api.nvim_set_current_win(win)
						break
					end
				end
			end
		end
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
		-- {
		-- 	"<leader>tso",
		-- 	function()
		-- 		require("neotest").summary.open()
		-- 	end,
		-- 	desc = "Summary Open",
		-- },
		-- {
		-- 	"<leader>tsc",
		-- 	function()
		-- 		require("neotest").summary.close()
		-- 	end,
		-- 	desc = "Summary Close",
		-- },
		{
			"<leader>ts",
			function()
				ToggleAndFocus("Neotest Summary", require("neotest").summary.toggle)
			end,

			desc = "Summary Open",
		},
		{
			"<leader>tl",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Output Pannel Toggle",
		},

		{
			"<leader>tt",
			function()
				require("neotest").run.run({ enter = true })
			end,
			desc = "Run Nearest Test",
		},

		{
			"<leader>tl",
			function()
				require("neotest").run.run_last({ strategy = "dap" })
			end,
			desc = "Debug Last Test",
		},
		{
			"<leader>tp",
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
	},
}
-- Key mapping to focus the summary window
