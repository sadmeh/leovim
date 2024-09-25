return {
	"kelly-lin/ranger.nvim",
	config = function()
		local ranger_nvim = require("ranger-nvim")
		ranger_nvim.setup({
			enable_cmds = true,
			replace_netrw = true,
			keybinds = {
				["ov"] = ranger_nvim.OPEN_MODE.vsplit,
				["oh"] = ranger_nvim.OPEN_MODE.split,
				["ot"] = ranger_nvim.OPEN_MODE.tabedit,
				["or"] = ranger_nvim.OPEN_MODE.rifle,
			},
			ui = {
				border = "rounded",
				height = 0.9,
				width = 0.9,
				x = 0.5,
				y = 0.5,
        
			},
		})
		vim.api.nvim_set_keymap("n", "<leader>ef", "open ranger", {
			noremap = true,
			callback = function()
				require("ranger-nvim").open(true)
			end,
		})
	end,
}
