return {
-- Statusline
{ 'nvim-lualine/lualine.nvim', opts = { options = { theme = 'auto', section_separators = '', component_separators = '' } } },


-- Indentation guides
{ 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },


-- Icons for UI plugins
{ 'nvim-tree/nvim-web-devicons', lazy = true },


-- Buffer line + safe buffer delete
{
'akinsho/bufferline.nvim', version = '*', dependencies = { 'nvim-tree/nvim-web-devicons' },
opts = {
options = {
diagnostics = 'nvim_lsp',
separator_style = 'slant',
offsets = { { filetype = 'neo-tree', text = 'Explorer', highlight = 'Directory', text_align = 'left' } },
},
},
},
{ 'moll/vim-bbye', event = 'VeryLazy' },


-- Mode indicator on the number column
{ 'mawkler/modicator.nvim', opts = {}, init = function() vim.o.number = true; vim.o.relativenumber = true end },


-- Winbar breadcrumbs (LSP + Treesitter)
{ 'Bekaboo/dropbar.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter', 'SmiteshP/nvim-navic' }, opts = {} },


-- Notifications
{ 'rcarriga/nvim-notify', opts = {}, init = function() vim.notify = require('notify') end },


-- Integrated terminal
{ 'akinsho/toggleterm.nvim', version = '*', opts = { open_mapping = [[<c-\>]], direction = 'float' } },


-- Colors
{ 'ishan9299/modus-theme-vim' },
{ 'rebelot/kanagawa.nvim' },


-- Status of LSP/formatting
{ 'j-hui/fidget.nvim', opts = {} },
}
