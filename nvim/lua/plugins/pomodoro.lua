return {
	"Stinobe/nvim-pomodoro",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("pomodoro").setup({
			presets = {
				{ name = "Classic", work = 25, short_break = 5, long_break = 15, rounds = 4 },
			},
			hud = {
				enabled = false,
			},
			notify = false,
		})
	end,
}
