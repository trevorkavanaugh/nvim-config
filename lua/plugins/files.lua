return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		cmd = "Neotree",
		opts = {
			window = { position = "left", width = 32 },
			close_if_last_window = true,
			filesystem = {
				bind_to_cwd = true,
				use_libuv_file_watcher = true, -- live updates
				group_empty_dirs = true, -- visually “auto-expands” chains of single dirs
				filtered_items = { hide_dotfiles = false, hide_gitignored = false },
				follow_current_file = {
					enabled = true, -- jump to current file
					-- these two make the tree open its parent dirs automatically
					expand = true, -- expand the path to the file
					leave_dirs_open = true, -- don’t collapse previously opened dirs
				},
			},
			event_handlers = {
				-- When you open a file from the tree, ensure its parent chain is expanded
				{
					event = "file_opened",
					handler = function()
						require("neo-tree.command").execute({ action = "reveal" })
					end,
				},
			},
		},
	},
}
