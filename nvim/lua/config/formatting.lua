return {
	prettier = function()
		require("conform").formatters.prettier = {
			options = {},
		}
	end,
	vim.filetype.add({
		extension = {
			prisma = "prisma",
		},
		pattern = {
			[".*/git/config"] = "toml",
			[".*/ghostty/config"] = "toml",
		},
	}),
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "markdown", "mdx" },
		callback = function()
			vim.bo.syntax = "markdown"
			vim.treesitter.stop()
		end,
	}),
}
