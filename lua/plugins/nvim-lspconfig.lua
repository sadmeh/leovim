--key binding when lsp server is available
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- TODO: add go to type definition
	vim.keymap.set("n", "<leader>lf", ":Lspsaga finder<CR>", opts) -- go to definition
	vim.keymap.set("n", "gd", ":Lspsaga peek_definition<CR>", opts) -- peak definition
	vim.keymap.set("n", "gD", ":Lspsaga goto_definition<CR>", opts) -- go to definition
	vim.keymap.set("n", "<leader>la", ":Lspsaga code_action<CR>", opts) -- see available code actions
	vim.keymap.set("n", "<leader>ln", ":Lspsaga rename<CR>", opts) -- smart rename
	vim.keymap.set("n", "<leader>ldS", ":Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	vim.keymap.set("n", "<leader>lds", ":Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	-- vim.keymap.set("n", "<leader>ldp", ":Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buffer
	-- vim.keymap.set("n", "<leader>ldn", ":Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

	if client.name == "pyright" then
		vim.keymap.set("n", "<Leader>loi", "PyrightOrganizeImports", opts)
	end
end

local config = function()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = cmp_nvim_lsp.default_capabilities()
	require("neoconf").setup({})
	local lspconfig = require("lspconfig")

	local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

	for name, icon in pairs(symbols) do
		local hl = "DiagnosticSign" .. name
		vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
	end
	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
					},
				},
			},
		},
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh", "aliasrc" },
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"sh",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				sh = { shellcheck, shfmt },
				python = { flake8, black },
			},
		},
	})
end

-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

return {
	"neovim/nvim-lspconfig",
	config = config,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
    -- check nvim-lsp-file-operations capabilities
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
