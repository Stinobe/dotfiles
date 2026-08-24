--[[ Basic configuration ]]
require("config.base")
require("config.formatting")

-- [[ Keybindings ]]
require("keymaps.base")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- [[ Load Lazy.nvim ]]
-- @link https://lazy.folke.io/
require("lazy.init")
