return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-project.nvim",
		"folke/todo-comments.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-lua/plenary.nvim",
	},
	lazy = false,
	keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
		{ "<leader>f", "", { desc = "Telescope" } },
		{ "<space>fo", ":Telescope file_browser<CR>", { desc = "File Browser (root)" } },
		-- open file_browser with the path of the current buffer
		{
			"<space>fe",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "File Browser(Curr Buffer Path)" },
		},
		{ "<leader>ff", ":Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fh", ":Telescope help_tags<CR>", desc = "Find files" },
		{ "<leader>fa", ":Telescope<CR>", desc = "Find files" },
		{ "<leader>fb", ":Telescope buffers<CR>", desc = "Find files" },
		{ "<leader>fw", ":Telescope live_grep<CR>", desc = "Find files" },
		{ "<leader>fr", ":Telescope oldfiles<CR>", desc = "Find files" },
		{ "<leader>ft", ":TodoTelescope<CR>", desc = "Find files" },
		{ "<leader>ft", ":TodoTelescope<CR>", desc = "Find files" },
		{
			"<leader>p",
			function()
				require("telescope").extensions.project.project({})
			end,
			desc = "Projects",
		},
	},
	-- change some options
	config = {
		defaults = {
			-- Default configuration for telescope goes here:
			-- config_key = value,
			--         layout_strategy = "horizontal",
			path_display = { "smart" },
			layout_config = { prompt_position = "top" },
			sorting_strategy = "ascending",
			winblend = 0,
		},
		extensions = {
			file_browser = {
				-- theme = "ivy",
				-- disables netrw and use telescope-file-browser in its place
				-- WARN: this is not working i add another autocmd to do this in init.lua
				hijack_netrw = true,
				mappings = {},
			},
			-- WARN: not presented in telescope health check!
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
			project = {
				hidden_files = false,
				base_dirs = {
					{ path = "~/projects/assistant", max_depth = 1 },
				},
				-- default for on_project_selected = find project files
				on_project_selected = function(prompt_bufnr)
					-- Do anything you want in here. For example:
					local project_actions = require("telescope._extensions.project.actions")
					project_actions.change_working_directory(prompt_bufnr, false)
					require("telescope.builtin").find_files()
				end,
			},
		},
	},
	opts = function()
		require("telescope").load_extension("fzf")
	end,
}
