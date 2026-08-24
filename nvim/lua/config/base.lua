--[[ Basic configuration ]]

-- Setting <leader> to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tab as spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Setting line numbers
--   make sure they're relative
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable nerd fonts
vim.g.have_nerd_font = true

vim.o.termguicolors = true

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Sync clipboard between OS & Neovim
--   we schedule this event to run after 'UIEnter' for performance
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Store undo history in file
vim.opt.undofile = true

-- Always show sign column
vim.opt.signcolumn = "yes"

-- Minimum number of lines to keep above & below cursor 
vim.opt.scrolloff = 15

-- Show which line your cursor is on
vim.o.cursorline = true

-- Case insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how splits should open
vim.o.splitbelow = true
vim.o.splitright = true

-- Live substitution previews
vim.o.inccommand = "split"

-- Enable confirmation
--  when performing an actions that would fail due to unsaved changes in a buffer,
--  show a confirmation dialog instead of failing
--  see `:h confirm`
vim.opt.confirm = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease timeout length
--   time between key combinations for keymaps
vim.opt.timeoutlen = 300
