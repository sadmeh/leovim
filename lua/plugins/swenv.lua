return {
	"AckslD/swenv.nvim",
	keys = {
		{
			"<leader>en",
			function()
				require("swenv.api").pick_venv()
			end,
			"Select Python Virtual Env",
		},
	},
}
