return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown", "mdx" },
	cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	build = "cd app && npm install --omit=dev --no-audit --no-fund",
	init = function()
		vim.g.mkdp_filetypes = { "markdown", "mdx" }
		vim.g.mkdp_auto_start = 0
		vim.g.mkdp_auto_close = 1
		vim.g.mkdp_refresh_slow = 0
		vim.g.mkdp_command_for_global = 0
		vim.g.mkdp_open_to_the_world = 0
	end,
	keys = {
		{
			"<leader>mp",
			"<cmd>MarkdownPreviewToggle<cr>",
			ft = { "markdown", "mdx" },
			desc = "Toggle Markdown [P]review",
		},
	},
}
