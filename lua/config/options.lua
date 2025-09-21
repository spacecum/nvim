-- Relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab size
vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.softtabstop = 3
vim.o.smartindent = true

-- Enable clipboard support
vim.o.clipboard = "unnamedplus"

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
-- vim.opt.cursorline = true

-- split window
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Theme
vim.cmd[[colorscheme cyberdream]]

-- Removing ~
vim.opt.fillchars:append { eob = " " }

--vim.o.signcolumn = 'no'

-- undo across session
vim.opt.undofile = true

-- Removing space below statusline
vim.opt.cmdheight = 0

-- Wordwrap
vim.opt.linebreak = true

-- Enabling features in nvim-term
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.bo.modifiable = true
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end
})
