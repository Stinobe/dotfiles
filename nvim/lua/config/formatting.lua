-- [[ Filetype & syntax tweaks ]]
vim.filetype.add({
	extension = {
		prisma = "prisma",
	},
	pattern = {
		[".*/git/config"] = "toml",
		[".*/ghostty/config"] = "toml",
	},
})

-- Treesitter's markdown parser struggles with these, fall back to classic syntax.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "mdx" },
	callback = function()
		vim.bo.syntax = "markdown"
		vim.treesitter.stop()
	end,
})
