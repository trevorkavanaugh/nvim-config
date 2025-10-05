return {
-- Simple session management akin to your sessionoptions + startify
{
'folke/persistence.nvim',
event = 'BufReadPre',
opts = {},
keys = {
{ '<leader>ss', function() require('persistence').load() end, desc = 'Restore Session' },
{ '<leader>sl', function() require('persistence').load({ last = true }) end, desc = 'Restore Last Session' },
{ '<leader>sd', function() require('persistence').stop() end, desc = 'Stop Session Saving' },
},
},
}
