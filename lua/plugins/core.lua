return {
{ 'nvim-lua/plenary.nvim', lazy = true },
{ 'folke/which-key.nvim', event = 'VeryLazy', config = true },


-- Start screen (Dashboard)
{
'nvimdev/dashboard-nvim',
event = 'VimEnter',
config = function()
local db = require('dashboard')
db.setup({
theme = 'hyper',
config = {
header = { 'Neovim 0.12.x - IDE starter' },
week_header = { enable = true },
shortcut = {
{ desc = 'Files', group = 'Label', action = 'Telescope find_files', key = 'f' },
{ desc = 'Recent', group = 'Label', action = 'Telescope oldfiles', key = 'r' },
{ desc = 'Projects', group = 'DiagnosticHint', action = 'Telescope projects', key = 'p' },
{ desc = 'New', group = 'DiagnosticOk', action = 'ene', key = 'n' },
{ desc = 'Quit', group = 'DiagnosticError', action = 'qa', key = 'q' },
},
},
})
end,
},
}
