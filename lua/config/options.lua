-- Mirrors your .vimrc defaults with modern Neovim equivalents
local o, wo, bo = vim.opt, vim.wo, vim.bo

-- UI
wo.number = true
wo.relativenumber = true
wo.cursorline = true
o.showmatch = true

-- Search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- Indent & tabs (4 spaces)
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
bo.autoindent = true

-- Clipboard & mouse
o.clipboard = "unnamedplus"
o.mouse = "a"

-- Files & buffers
o.hidden = true
o.autoread = true
o.updatetime = 200

-- Sessions: keep similar behavior
o.sessionoptions = { "blank", "buffers", "curdir", "help", "tabpages", "winsize", "folds", "terminal" }

-- Look & feel
pcall(vim.cmd, "colorscheme modus-vivendi") -- falls back silently if not installed
