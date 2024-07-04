local keymap = vim.keymap
local opts = {noremap=true}
-- Directory navigation

-- keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", opts)
-- keymap.set("n", "<leader>o", "<Cmd>Neotree focus<CR>", opts)
vim.keymap.set("n", "<space>fo", ":Telescope file_browser<CR>")
-- open file_browser with the path of the current buffer
vim.keymap.set("n", "<space>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")


-- Windows
keymap.set("n", "<leader>wsh", ":split<CR>", opts) 
keymap.set("n", "<leader>wsv", ":vsplit<CR>", opts) 
vim.api.nvim_set_keymap('n', 'wmt', '<cmd>lua require("maximizer").toggle()<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'wmm', '<cmd>lua require("maximizer").maximize()<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'wmr', '<cmd>lua require("maximizer").restore()<CR>', {silent = true, noremap = true})

-- Indent
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comment
vim.api.nvim_set_keymap("n", "<leader>/", "gcc", {noremap = false, desc="Toggle Comment"})
vim.api.nvim_set_keymap("v", "<leader>/", "gcc", {noremap = false, desc="Toggle Comment"})


