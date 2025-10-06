return {
	-- Completion (CoC  native LSP + nvim-cmp)
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
	{ "rafamadriz/friendly-snippets" },

	-- Sort "_"-prefixed items nicely
	{
		"lukas-reineke/cmp-under-comparator",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			local cmp = require("cmp")
			local compare = cmp.config.compare
			cmp.setup({
				sorting = {
					priority_weight = 1,
					comparators = {
						require("cmp-under-comparator").under,
						compare.offset,
						compare.exact,
						compare.score,
						compare.recently_used,
						compare.locality,
						compare.kind,
						compare.sort_text,
						compare.length,
						compare.order,
					},
				},
			})
		end,
	},

	{
		"onsails/lspkind.nvim",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources(
					{ { name = "nvim_lsp" }, { name = "luasnip" } },
					{ { name = "buffer" }, { name = "path" } }
				),
				formatting = { format = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 }) },
			})
		end,
	},
}
