-- Mini.nvim
-- @link https://github.com/nvim-mini/mini.nvim
return {
	'nvim-mini/mini.nvim',
	version = '*',
	config = function()
		require("mini.statusline").setup()
		require("mini.ai").setup({
			use_icons = vim.g.have_nerd_font
		})
		require("mini.surround").setup()
	end
}
