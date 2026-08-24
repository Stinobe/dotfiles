-- Treesitter
-- @link https://github.com/nvim-treesitter/nvim-treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.mdx = {
			install_info = {
				url = "https://github.com/srazzak/tree-sitter-mdx",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "main",
			},
			filetype = "mdx",
		}

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash", -- https://github.com/tree-sitter/tree-sitter-bash
				"caddy", -- https://github.com/opa-oz/tree-sitter-caddy
				"css", -- https://github.com/tree-sitter/tree-sitter-css
				"diff", -- https://github.com/tree-sitter-grammars/tree-sitter-diff
				"editorconfig", -- https://github.com/ValdezFOmar/tree-sitter-editorconfig
				"git_config", -- https://github.com/the-mikedavis/tree-sitter-git-config
				"git_rebase", -- https://github.com/the-mikedavis/tree-sitter-git-rebase
				"gitcommit", -- https://github.com/gbprod/tree-sitter-gitcommit
				"gitignore", -- https://github.com/shunsambongi/tree-sitter-gitignore
				"html", -- https://github.com/tree-sitter/tree-sitter-html
				"jsdoc", -- https://github.com/tree-sitter/tree-sitter-jsdoc
				"json", -- https://github.com/tree-sitter/tree-sitter-json
				"lua", -- https://github.com/MunifTanjim/tree-sitter-lua
				"luadoc", -- https://github.com/tree-sitter-grammars/tree-sitter-luadoc
				"markdown", -- https://github.com/tree-sitter-grammars/tree-sitter-markdown
				"markdown_inline",
				"mdx",
				"prisma", -- https://github.com/victorhqc/tree-sitter-prisma
				"regex", -- https://github.com/tree-sitter/tree-sitter-regex
				"robots", -- https://github.com/opa-oz/tree-sitter-robots-txt
				"scss", -- https://github.com/serenadeai/tree-sitter-scss
				"ssh_config", -- https://github.com/tree-sitter-grammars/tree-sitter-ssh-config
				"styled", -- https://github.com/mskelton/tree-sitter-styled
				"svelte",
				"tmux", -- https://github.com/Freed-Wu/tree-sitter-tmux
				"tsx", -- https://github.com/tree-sitter/tree-sitter-typescript
				"toml", -- https://github.com/tree-sitter-grammars/tree-sitter-toml
				"vim", -- https://github.com/tree-sitter-grammars/tree-sitter-vim
				"vimdoc", -- https://github.com/neovim/tree-sitter-vimdoc
				"yaml", -- https://github.com/tree-sitter-grammars/tree-sitter-yaml
				-- "vue"		-- https://github.com/tree-sitter-grammars/tree-sitter-vue
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			modules = {},
			highlight = {
				enable = true,
				disable = { "markdown" },
			},
		})
	end,
}
