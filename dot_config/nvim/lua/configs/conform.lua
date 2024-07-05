local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		bash = { "shfmt -i 4" },
		sh = { "shfmt -i 4" },
		fortran = { "fprettify" },
		["_"] = { "trim_whitespace" },
		-- css = { "prettier" },
		-- html = { "prettier" },
		yaml = { "prettier" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

require("conform").setup(options)
