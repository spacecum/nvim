return {
	-- LSP configuration
	{
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x',
			config = function()
				local lsp = require('lsp-zero')
				lsp.preset("recommended")
				lsp.extend_lspconfig()
				vim.diagnostic.config({
					virtual_text = true,
					signs = true,
					update_in_insert = true,
					underline = true,
					severity_sort = true,
				})
			end
		},

		{'williamboman/mason-lspconfig.nvim'},
		{'neovim/nvim-lspconfig'},
	},

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip"
		},
	},

	-- autocompletion
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp',
		config = function ()
			local cmp = require'cmp'
			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})
		end
	},

	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path',
		config = function ()
			require'cmp'.setup {
				sources = {
					{ name = 'path' }
				}
			}
		end,
	},

	-- Auto pairing
	{
		'windwp/nvim-autopairs',
		config = true,
		opts = {}
	},

	-- Jumping out of pairs
	{
		"abecodes/tabout.nvim",
		lazy = false,
		config = function ()
			require("tabout").setup{}
		end,
	},
}
