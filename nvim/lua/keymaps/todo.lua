return {
	setup = function()
		vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "[S]earch [T]odo Comments" })
	end
}
