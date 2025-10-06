-- Neovim 0.12.x - clean bootstrap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Core config first
require("config.init-options")
require("config.init-autocmds")

-- Plugins
require("lazy").setup({
    spec = {
        { import = "plugins.core" },
        { import = "plugins.ui" },
        { import = "plugins.files" },
        { import = "plugins.git" },
        { import = "plugins.treesitter" },
        { import = "plugins.telescope" },
        { import = "plugins.editing" },
        { import = "plugins.lsp" },
        { import = "plugins.cmp" },
        { import = "plugins.diagnostics" },
        { import = "plugins.sessions" },
    },
    change_detection = { notify = false },
    ui = { border = "rounded" },
})

require("config.options")
require("config.keymaps")
require("config.commands")
require("config.autocmds")

-- Final touches can go here
