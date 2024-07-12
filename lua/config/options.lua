local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearence
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
-- opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
-- opt.hidden = true
-- opt.errorbells = false
-- opt.swapfiles = false
-- opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
-- opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
-- opt.guicursor ?
opt.encoding = "UTF-8"

opt.termguicolors = true

-- use :set all and :options to understand the options
-- TODO: read other options

-- folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
