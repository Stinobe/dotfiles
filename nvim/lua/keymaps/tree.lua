return {
	setup = function()
		vim.keymap.set("n", "<leader>tn", "<cmd>Neotree toggle<CR>", { desc = "[T]oggle [N]eotree" })
		vim.keymap.set("n", "<leader>rf", "<cmd>Neotree reveal<CR>", { desc = "[R]eveal [F]ile" })
	end,
}
