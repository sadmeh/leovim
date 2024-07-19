return {
	"AckslD/swenv.nvim",
	config = {
		post_set_venv = function()
			vim.cmd.LspRestart()
		end,
	},
	keys = {
		{
			"<leader>en",
			function()
				require("swenv.api").pick_venv()
			end,
			desc = "Select Python Virtual Env",
		},
	},
}
