return {
	-- Indentation
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = { enabled = false },
			indent = {
				char = {"▏"},
			},
		}
	},

	{ 'echasnovski/mini.nvim',
		version = '*',
		config = function ()
			require('mini.indentscope').setup({
				symbol = '▏',
				options = { try_as_border = true }
			})
		end,
	},

	-- theme
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function ()
			require("cyberdream").setup({
				transparent = true,
				cache = true,
				saturation = 0.8
			})
		end
	},

	-- Treesitter: syntax highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',  -- Automatically update parsers

		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = {
					"lua",
					"python",
					"c",
					"bash",
					"http",
					"json",
					"css",
					"sql",
					"cpp"
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			}
		end,
	},

	{
		'nvim-lualine/lualine.nvim',
		config = function ()
			vim.o.laststatus = 3 -- Enabling global status line
			require('lualine').setup({
				options = {
					component_separators = { left = '', right = ''},
					section_separators = { left = '', right = ''},
				}
			})
		end
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup {}
		end,
	}
}
