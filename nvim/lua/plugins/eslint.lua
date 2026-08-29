-- ESLint LSP
-- @link https://github.com/esmuellert/nvim-eslint
--
-- nvim-eslint attaches to every JS/TS buffer regardless of whether the project
-- actually uses ESLint, so in a Biome-only project it still reports diagnostics
-- and offers fixes. Only load it when an ESLint config is present.
local ESLINT_CONFIGS = {
	"eslint.config.js",
	"eslint.config.mjs",
	"eslint.config.cjs",
	"eslint.config.ts",
	"eslint.config.mts",
	"eslint.config.cts",
	".eslintrc",
	".eslintrc.js",
	".eslintrc.cjs",
	".eslintrc.mjs",
	".eslintrc.json",
	".eslintrc.yaml",
	".eslintrc.yml",
}

return {
	"esmuellert/nvim-eslint",
	cond = function()
		return vim.fs.find(ESLINT_CONFIGS, { path = vim.fn.getcwd(), upward = true })[1] ~= nil
	end,
	config = function()
		require("nvim-eslint").setup({})
	end,
}
