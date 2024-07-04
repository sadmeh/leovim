require("config.lazy")

-- TODO: check the noice plugin
-- TODO: see is there any benefit to install lualine or other alternatives


local find_files_on_startup = vim.api.nvim_create_augroup("find_files_on_startup", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    group = find_files_on_startup,
    pattern = "*",
    callback = function()
        if vim.fn.isdirectory(vim.fn.expand("%:p")) ~= 0 then
            local current_dir = vim.fn.expand("%:p:h")
            -- require("telescope.builtin").find_files({ cwd = current_dir })
          require("telescope").extensions.file_browser.file_browser({cwd=current_dir})
        end
    end,
})