-- Basic autocmds
local aug = vim.api.nvim_create_augroup('UserBasics', { clear = true })


-- Highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
group = aug,
callback = function() vim.highlight.on_yank({ timeout = 120 }) end,
})


-- Reload files changed on disk
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
group = aug,
command = 'checktime',
})
