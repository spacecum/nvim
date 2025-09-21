-- Load Telescope's built-in functions
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', function()
	builtin.find_files({
		cwd = os.getenv('HOME'), -- Set the starting directory to $HOME
		hidden = true,
	})
end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Configure keys for autocompletion
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	mapping = {
		['<C-j>']  = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-d>'] = cmp_action.luasnip_jump_backward(),
	}
})

-- Swtiching between windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Save
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- Split
vim.api.nvim_set_keymap('n', '<leader>h', ':sp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':vsp<CR>', { noremap = true, silent = true })

-- Remove highlight after searching
vim.api.nvim_set_keymap('n', '<C-[>', ':nohl<CR>', { noremap = true, silent = true })

-- Open terminal
vim.api.nvim_set_keymap('n', '<leader>k', ':sp | resize 16 | term<CR>', { noremap = true, silent = true })

-- Exit terminal mode and go to normal mode when pressing Esc
vim.api.nvim_set_keymap('t', '<c-[>', '<C-\\><C-n>', { noremap = true, silent = true })

-- split line
vim.api.nvim_set_keymap('n', '<CR>', 'i<CR><Esc>', { noremap = true, silent = true })

-- Map <C-Backspace> to <C-W> in Insert mode
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-W>', { noremap = true, silent = true })

-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Compiling and running
vim.api.nvim_set_keymap('n', '<M-r>', ':w | split | resize 16 | terminal make <CR>', { noremap = true, silent = true })

-- Searching on browser
vim.keymap.set('v', 'gs', function()
	vim.cmd('normal! "vy')
	local text = vim.fn.getreg('v')
	text = text:gsub('%s+', '%%20')
	vim.fn.jobstart({ 'xdg-open', 'https://www.google.com/search?q=' .. text }, { detach = true })
end, { noremap = true, silent = true })
