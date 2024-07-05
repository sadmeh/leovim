return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	lazy = false,
	config = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
