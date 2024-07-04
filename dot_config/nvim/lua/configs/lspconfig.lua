-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "bashls", "fortls", "autotools_ls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- -- typescript
-- lspconfig.tsserver.setup({
-- 	on_attach = on_attach,
-- 	on_init = on_init,
-- 	capabilities = capabilities,
-- })
require("lspconfig").lua_ls.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.pylsp.setup({
	on_attach = on_attach,
	settings = {
		pylsp = {
			plugins = {
				-- formatter options
				black = { enabled = true },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				-- linter options
				pylint = { enabled = false, executable = "pylint" },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				ruff = { enabled = true, formatEnabled = true, executable = "ruff" },
				-- type checker
				pylsp_mypy = { enabled = false },
				-- auto-completion options
				jedi_completion = { fuzzy = true },
				-- import sorting
				pyls_isort = { enabled = false },
			},
		},
	},
	flags = {
		debounce_text_changes = 200,
	},
	capabilities = capabilities,
})
