return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"recarriga/nvim-dap-ui",
	},
	config = function(_, opts)
		local path = "iPython"
		require("dap-python").setup(path)
	end,
}
