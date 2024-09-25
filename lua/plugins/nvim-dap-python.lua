return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"recarriga/nvim-dap-ui",
	},
	config = function(_, opts)
		local path = "ipython"
		local dap = require("dap-python")
		dap.setup(path)
		dap.test_runner = "unittest"
	end,
}
