return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = function()
		local BIOME_CONFIGS = { "biome.json", "biome.jsonc", ".biome.json", ".biome.jsonc" }

		-- Every Biome config from the file's directory upwards, nearest first.
		-- Monorepos nest a config per package on top of the workspace root.
		local function biome_configs(ctx)
			return vim.fs.find(BIOME_CONFIGS, {
				path = ctx.dirname,
				upward = true,
				limit = math.huge,
			})
		end

		-- Only let Biome format when the project actually has a Biome config,
		-- otherwise fall through to Prettier.
		local function has_biome_config(_, ctx)
			return biome_configs(ctx)[1] ~= nil
		end

		-- Biome's HTML formatter is experimental and off unless a config opts in.
		-- Without this check Biome exits 1 on .html and `stop_after_first` would
		-- swallow the Prettier fallback, leaving the file unformatted.
		local function biome_formats_html(_, ctx)
			for _, path in ipairs(biome_configs(ctx)) do
				local ok, decoded = pcall(vim.json.decode, table.concat(vim.fn.readfile(path), "\n"), {
					luanil = { object = true },
				})
				local enabled = ok
					and type(decoded) == "table"
					and vim.tbl_get(decoded, "html", "formatter", "enabled")
				if enabled ~= nil then
					return enabled
				end
			end
			return false
		end

		-- Filetypes Biome formats itself; Prettier is the fallback for the rest.
		local biome_first = { "biome", "prettier", stop_after_first = true }

		return {
			notify_on_error = true,
			formatters = {
				biome = {
					condition = has_biome_config,
				},
				["biome-html"] = {
					condition = biome_formats_html,
					inherit = false,
					command = require("conform.util").from_node_modules("biome"),
					stdin = true,
					args = { "format", "--stdin-file-path", "$FILENAME" },
					cwd = require("conform.util").root_file(BIOME_CONFIGS),
				},
			},
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				sh = { "beautysh" },
				bash = { "beautysh" },
				javascript = biome_first,
				typescript = biome_first,
				javascriptreact = biome_first,
				typescriptreact = biome_first,
				json = biome_first,
				jsonc = biome_first,
				css = biome_first,
				graphql = biome_first,
				vue = { "prettier" },
				svelte = { "prettier" },
				astro = { "prettier" },
				scss = { "prettier" },
				html = { "biome-html", "prettier", stop_after_first = true },
				yaml = { "prettier" },
				toml = { "taplo" },
				markdown = { "prettier" },
				mdx = { "prettier" },
			},
		}
	end,
}
