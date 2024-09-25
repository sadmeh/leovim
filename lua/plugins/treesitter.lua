return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"python",
				"lua",
				"vim",
				"vimdoc",
				"markdown",
				-- "markdown-inline",
				"json",
				"javascript",
				"typescript",
				"yaml",
				"html",
				"css",
				"bash",
				"gitignore",
				"docerfile",
			},

			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
