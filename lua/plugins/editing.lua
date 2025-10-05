return {
-- Surround / Comment / Repeat equivalents
{ 'kylechui/nvim-surround', version = '*', event = 'VeryLazy', config = true },
{ 'numToStr/Comment.nvim', opts = {} },


-- AutoPairs
{ 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },


-- Bullets & Taskpaper (keep your legacy)
{ 'dkarter/bullets.vim', ft = { 'markdown', 'text', 'taskpaper' } },
{ 'davidoc/taskpaper.vim', ft = 'taskpaper' },


-- Color preview for CSS like vim-css-color
{ 'NvChad/nvim-colorizer.lua', opts = {} },


-- Increment/decrement numbers, dates, etc.
{
  'monaqa/dial.nvim',
  keys = {
    { '<C-a>', function() return require('dial.map').inc_normal() end, expr = true, desc = 'Dial increment' },
    { '<C-x>', function() return require('dial.map').dec_normal() end, expr = true, desc = 'Dial decrement' },
  },
  config = function()
    local augend = require('dial.augend')
    require('dial.config').augends:register_group{
      default = {
        augend.integer.alias.decimal,
        augend.date.alias['%Y-%m-%d'],
      },
    }
  end,
},

-- CSV/TSV viewer & editor (0.10+)
{ 'hat0uma/csvview.nvim', ft = { 'csv', 'tsv' }, opts = {} },


-- Motion/navigation helpers
{ 'rhysd/clever-f.vim' },
{ 'ggandor/leap.nvim', config = function() require('leap').add_default_mappings() end },
{ 'chrisgrieser/nvim-spider', opts = {} },
{ 'karb94/neoscroll.nvim', opts = {} },
}
