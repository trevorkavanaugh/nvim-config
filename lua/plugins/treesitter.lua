return {
{
'nvim-treesitter/nvim-treesitter',
build = ':TSUpdate',
event = { 'BufReadPost', 'BufNewFile' },
opts = {
highlight = { enable = true },
indent = { enable = true },
ensure_installed = { 'lua', 'vim', 'vimdoc', 'bash', 'python', 'javascript', 'typescript', 'json', 'html', 'css' },
},
config = function(_, opts)
require('nvim-treesitter.configs').setup(opts)
end,
},
}
