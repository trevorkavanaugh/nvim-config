return {
-- Quicklist-style diagnostics browser (ALE  Trouble)
{ 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' }, opts = { use_diagnostic_signs = true } },


-- TODO/FIX/NOTE highlights across project
{ 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },


-- Lightweight linters (Ruff, etc.)
{
'mfussenegger/nvim-lint',
config = function()
local lint = require('lint')
lint.linters_by_ft = { python = { 'ruff' } }
local aug = vim.api.nvim_create_augroup('UserLint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'InsertLeave' }, {
group = aug,
callback = function() require('lint').try_lint() end,
})
end,
},
}
