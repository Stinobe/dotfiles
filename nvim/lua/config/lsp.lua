-- [[ LSP Configuration ]]
-- Lists the required LSP's
local servers = {
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
	bashls = {},
	biome = {},
	cssls = {},
	css_variables = {},
	cssmodules_ls = {},
	html = {},
	jsonls = {},
	mdx_analyzer = {},
	prismals = {
		on_new_config = function(new_config, _)
			local env_file = vim.fn.getcwd() .. "/.env"
			if vim.fn.filereadable(env_file) == 1 then
				for line in io.lines(env_file) do
					local key, val = line:match("^([A-Za-z_][A-Za-z0-9_]*)=(.*)$")
					if key and val then
						new_config.cmd_env = new_config.cmd_env or {}
						new_config.cmd_env[key] = val
					end
				end
			end
		end,
	},
	svelte = {},
	tailwindcss = {},
	taplo = {},
	ts_ls = {},
	yamlls = {},
}

local tools = {
	"biome",
	"beautysh",
	"black",
	"isort",
	"prettier",
	"shfmt",
	"stylua",
}

return { servers = servers, tools = tools }
