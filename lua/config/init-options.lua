-- Things that must exist before plugins read them

-- Leaders (plugins bind <leader> at load time)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Providers: set hosts now so health checks & plugins see them
-- (adjust path if you used a different venv)
vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim-host/bin/python")
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Optional: disable netrw if you want zero interference with file explorers
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- UI prerequisites that some UI plugins/animations check
vim.o.termguicolors = true
vim.o.background = "dark"

-- Nice to have early so modicator & friends start correctly
vim.opt.number = true
vim.opt.relativenumber = true

-- Bufferline autoopens with Neovim
vim.opt.showtabline = 2 -- always show tabline (Bufferline lives here)

-- Statusbar Last Status
vim.opt.laststatus = 3
