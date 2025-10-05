return {
{
'nvim-telescope/telescope.nvim', 
tag = '0.1.6',
cmd = 'Telescope',
dependencies = { 'nvim-lua/plenary.nvim' },
config = function(_, opts)
require('telescope').setup(opts)
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'projects')
pcall(require('telescope').load_extension, 'neoclip')
end,
},
{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },


-- Project detection & Telescope integration
{
'ahmedkhalf/project.nvim',
opts = { detection_methods = { 'pattern', 'lsp' }, patterns = { '.git', 'pyproject.toml', 'package.json', 'Makefile' } },
config = function(_, opts) require('project_nvim').setup(opts) end,
keys = { { '<leader>fp', function() require('telescope').extensions.projects.projects({}) end, desc = 'Projects' } },
},


-- Clipboard manager + persistent history (needs SQLite)
{ 'AckslD/nvim-neoclip.lua', dependencies = { 'kkharji/sqlite.lua' }, opts = { default_register = '+', enable_persistent_history = true } },
}
