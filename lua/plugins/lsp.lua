return {
	-- LSP core + new API (no legacy require('lspconfig').setup)
	{ "neovim/nvim-lspconfig" },

	-- Mason base + lsp bridge (auto-enable disabled; we enable explicitly)
	{ "williamboman/mason.nvim", build = ":MasonUpdate", opts = {} },
	{ "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim" }, opts = { automatic_enable = false } },

	-- Install servers/formatters/linters automatically (packages by Mason name)
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			ensure_installed = {
				-- LSPs (Mason package names)
				"lua-language-server",
				"pyright",
				"typescript-language-server",
				"bash-language-server",
				"json-lsp",
				"html-lsp",
				"css-lsp",
				"deno",
				-- Formatters/linters
				"prettier",
				"stylua",
				"black",
				"isort",
				"shfmt",
				"eslint_d",
				"ruff",
			},
			auto_update = false,
			run_on_start = true,
		},
	},

	-- lua/plugins/lsp.lua  (Aerial spec)
	{
		"stevearc/aerial.nvim",
		opts = {
			backends = { "lsp", "treesitter", "markdown" },
			attach_mode = "global", -- <- show symbols from last real file
			ignore = {
				filetypes = { "neo-tree", "dashboard", "alpha", "lazy", "TelescopePrompt", "trouble", "help", "qf" },
				buftypes = { "nofile", "terminal", "quickfix" },
			},
			layout = {
				default_direction = "right",
				placement = "edge", -- << open at far right/left, not beside current win
				width = 40,
				preserve_equality = true,
			},
		},
	},

	-- Formatters (Conform)
	{ "stevearc/conform.nvim", opts = { format_on_save = { timeout_ms = 500, lsp_fallback = true } } },

	-- Diagnostics/formatting via none-ls (+ extras for eslint_d)
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvimtools/none-ls-extras.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- formatters
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.shfmt,
					-- eslint_d diagnostics from extras
					require("none-ls.diagnostics.eslint_d"),
					-- optionally: require('none-ls.formatting.eslint_d'),
				},
			})
		end,
	},

	-- LSP server enablement using the new API
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "SmiteshP/nvim-navic" },
		config = function()
			local caps = require("cmp_nvim_lsp").default_capabilities()
			local util = require("lspconfig.util")

			-- 1) Global defaults for ALL servers
			vim.lsp.config("*", {
				capabilities = caps,
			})

			-- 2) Per-server tweaks
			-- Lua (Neovim config)
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			-- TypeScript/JavaScript (disable in Deno projects)
			vim.lsp.config("ts_ls", {
				root_dir = function(fname)
					-- If deno.json(c) is present, do NOT start ts_ls
					if util.root_pattern("deno.json", "deno.jsonc")(fname) then
						return nil
					end
					return util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
				end,
				single_file_support = false,
			})

			-- Optional: Deno LSP (only starts in deno.json/deno.jsonc roots)
			vim.lsp.config("denols", {
				root_dir = util.root_pattern("deno.json", "deno.jsonc"),
				init_options = { lint = true, unstable = true },
			})

			-- 3) Enable the servers
			for _, name in ipairs({ "lua_ls", "pyright", "bashls", "jsonls", "html", "cssls", "ts_ls" }) do
				vim.lsp.enable(name)
			end
			-- Try to enable denols if available (no error if not installed / no root)
			pcall(vim.lsp.enable, "denols")

			-- 4) Attach navic for breadcrumbs if the server supports symbols
			local aug = vim.api.nvim_create_augroup("UserLspAttachNavic", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = aug,
				callback = function(args)
					local ok, navic = pcall(require, "nvim-navic")
					if not ok then
						return
					end
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.server_capabilities.documentSymbolProvider then
						pcall(navic.attach, client, args.buf)
					end
				end,
			})
		end,
	},
}
