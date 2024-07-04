return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
          "nvim-telescope/telescope-file-browser.nvim",
          "nvim-lua/plenary.nvim",

    },
    lazy=false,
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {"<leader>ff", ":Telescope find_files<CR>", desc="Find files"},
      {"<leader>fh", ":Telescope help_tags<CR>", desc="Find files"},
      {"<leader>fa", ":Telescope<CR>", desc="Find files"},
      {"<leader>fb", ":Telescope buffers<CR>", desc="Find files"},
      {"<leader>fw", ":Telescope live_grep<CR>", desc="Find files"},

      
    },
    -- change some options
    config = {
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          --         layout_strategy = "horizontal",
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
          mappings = {
          },
        },
      },
    },
    -- opts = function() require("telescope").load_extension "file_browser" end,
}

