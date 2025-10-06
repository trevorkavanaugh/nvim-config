return {
	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "auto",
				globalstatus = true,
				icons_enabled = true,
				section_separators = "",
				component_separators = "",
			},
		},
	},

	-- Indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = {
				filetypes = { "dashboard", "alpha", "neo-tree", "aerial", "help", "lazy", "Trouble" },
				buftypes = { "nofile", "terminal", "prompt", "quickfix" },
			},
		},
	},

	-- Icons for UI plugins
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- Buffer line + safe buffer delete
	{
		"akinsho/bufferline.nvim",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				always_show_bufferline = true,
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				-- offsets = {
				--  { filetype = "neo-tree", text = "Explorer", highlight = "Directory", text_align = "left", separator= true}
				--},
			},
		},
	},
	-- lua/plugins/ui.lua  (replace the heirline block; disable bufferline)
	{
		"rebelot/heirline.nvim",
		event = "VeryLazy",
		config = function()
			local heirline = require("heirline")
			local utils = require("heirline.utils")

			local function cwd()
				return vim.fn.fnamemodify(vim.loop.cwd() or "", ":t")
			end
			local function git_branch()
				local gs = vim.b.gitsigns_status_dict
				return gs and gs.head or ""
			end

			-- Left header (no %= here)
			local Left = {
				hl = "TabLine",
				{ provider = "    " },
				{
					provider = function()
						return " " .. cwd() .. " "
					end,
					hl = "Directory",
				},
				{
					provider = function()
						local h = git_branch()
						return (h ~= "" and ("  " .. h .. " ")) or " "
					end,
				},
			}

			-- Center: buffers
			local Buffers = utils.make_buflist({
				provider = function(self)
					local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.bufnr), ":t")
					if name == "" then
						name = "[No Name]"
					end
					local mod = vim.bo[self.bufnr].modified and " [+]" or ""
					return " " .. name .. mod .. " "
				end,
				hl = function(self)
					return (self.is_active or self.is_visible) and "TabLineSel" or "TabLine"
				end,
				on_click = {
					callback = function(_, minwid)
						vim.api.nvim_set_current_buf(minwid)
					end,
					minwid = function(self)
						return self.bufnr
					end,
					name = "heirline_tab_click",
				},
			}, { provider = " ", hl = "TabLine" })

			-- Right: clock
			local Right = {
				hl = "TabLine",
				{
					provider = function()
						return os.date(" %H:%M ")
					end,
				},
			}

			-- Layout: Left  %=  Buffers  %=  Right  (buffers centered)
			heirline.setup({
				tabline = {
					Left,
					{ provider = "             " }, -- ← gap between header and tabs (tweak spaces)
					Buffers,
					{ provider = "%=" }, -- push the clock to the far right
					Right,
				},
			})
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		lazy = false,
		dependencies = { "nvim-treesitter/nvim-treesitter", "SmiteshP/nvim-navic" },
		opts = {},
	},

	-- Buffer Management
	{ "moll/vim-bbye", event = "VeryLazy" },

	-- Mode indicator on the number column
	{
		"mawkler/modicator.nvim",
		opts = {},
		init = function()
			vim.o.number = true
			vim.o.relativenumber = true
		end,
	},

	-- Winbar breadcrumbs (LSP + Treesitter)
	{
		"Bekaboo/dropbar.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "SmiteshP/nvim-navic" },
		opts = {},
	},

	-- Notifications
	{
		"rcarriga/nvim-notify",
		lazy = false, -- load before Lazy UI uses vim.notify
		config = function()
			local notify = require("notify")
			notify.setup({}) -- your opts if any
			vim.notify = notify -- set AFTER plugin is loaded
		end,
	},

	-- Integrated terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = { open_mapping = [[<c-\>]], direction = "float" },
	},

	-- Colors
	{ "ishan9299/modus-theme-vim" },
	{ "rebelot/kanagawa.nvim" },

	-- Status of LSP/formatting
	{ "j-hui/fidget.nvim", opts = {} },
}
