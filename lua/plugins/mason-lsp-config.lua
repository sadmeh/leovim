local opts = {
	ensure_installed = {
		"efm",
		"lua_ls",
		"pyright",
		"emmet_ls",
		"html",
		"cssls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "williamboman/mason.nvim",
}
