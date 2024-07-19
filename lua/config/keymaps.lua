local keymap = vim.keymap
local opts = { noremap = true }
-- Directory navigation
-- keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", opts)
-- keymap.set("n", "<leader>o", "<Cmd>Neotree focus<CR>", opts)

-- Windows
vim.api.nvim_set_keymap("n", "<leader>w", "", { desc = "Window" })
vim.api.nvim_set_keymap("n", "<leader>wh", "<C-w>h", { desc = "Move Right" })
vim.api.nvim_set_keymap("n", "<leader>wj", "<C-w>j", { desc = "Move Down" })
vim.api.nvim_set_keymap("n", "<leader>wk", "<C-w>k", { desc = "Move Up" })
vim.api.nvim_set_keymap("n", "<leader>wl", "<C-w>l", { desc = "Move Left" })
vim.api.nvim_set_keymap("n", "<leader>ws", "", { desc = "Split" })
keymap.set("n", "<leader>wsh", ":split<CR>", opts)
keymap.set("n", "<leader>wsv", ":vsplit<CR>", opts)
vim.api.nvim_set_keymap("n", "wmt", '<cmd>lua require("maximizer").toggle()<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "wmm", '<cmd>lua require("maximizer").maximize()<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "wmr", '<cmd>lua require("maximizer").restore()<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>o", ":only<CR>", { noremap = true, silent = true })

-- Indent
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comment
vim.api.nvim_set_keymap("n", "<leader>/", "gcc", { noremap = false, desc = "Toggle Comment" })
vim.api.nvim_set_keymap("v", "<leader>/", "gcc", { noremap = false, desc = "Toggle Comment" })

--line number
function ToggleLineNumbers()
	local number = vim.wo.number
	local relativenumber = vim.wo.relativenumber
	if number == true and relativenumber == true then
		vim.wo.number = true
		vim.wo.relativenumber = false
	elseif number == true and relativenumber == false then
		vim.wo.number = false
		vim.wo.relativenumber = true
	else
		vim.wo.number = true
		vim.wo.relativenumber = true
	end
end
vim.api.nvim_set_keymap("n", "<leader>wn", "<cmd>lua ToggleLineNumbers()<CR>", { desc = "Toggle line number" })

vim.api.nvim_set_keymap("n", "<leader>ip", "<cmd>term ipython %<CR>", { desc = "Run In Terminal" })
vim.api.nvim_set_keymap("n", "<leader>ss", "<cmd>source %<CR>", { desc = "Source Current File" })
