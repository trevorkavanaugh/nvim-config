return {
-- NERDTree  Neo-tree
{
'nvim-neo-tree/neo-tree.nvim',
branch = 'v3.x',
dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
cmd = 'Neotree',
opts = { filesystem = { filtered_items = { hide_dotfiles = false } } },
},
}
