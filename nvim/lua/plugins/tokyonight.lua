-- TokyoNight theme
-- @link https://github.com/folke/tokyonight.nvim
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require('tokyonight').setup {
			style = "night",
			light_style = "moon",
		}
		vim.cmd([[colorscheme tokyonight]])
	end
}
