-- luacheck: globals vim

vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
		config = function()
			require("options")
		end,
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)

vim.opt.mouse = ""

-- lua format
vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"

-- Define a new autocommand group
vim.api.nvim_create_augroup("CylcSyntax", { clear = true })

-- Create an autocommand to set the filetype for .cylc files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.cylc",
	callback = function()
		vim.cmd("setfiletype cylc")
		vim.cmd("set foldlevel=99")
	end,
	group = "CylcSyntax",
})

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_exec(
	[[
    autocmd FileType cylc setlocal shiftwidth=4
    autocmd FileType cylc setlocal tabstop=4
    autocmd FileType cylc setlocal expandtab
  ]],
	true
)

-- Function to set filetype based on shebang if no filetype is detected
local function set_filetype_from_shebang()
	-- Only proceed if filetype is not already set
	if vim.bo.filetype == "" then
		-- Read the first line of the file
		local firstline = vim.fn.getline(1)
		-- Check for different shebangs and set the filetype accordingly
		if string.match(firstline, "^#!.*python") then
			vim.bo.filetype = "python"
		elseif string.match(firstline, "^#!.*perl") then
			vim.bo.filetype = "perl"
		elseif string.match(firstline, "^#!.*ruby") then
			vim.bo.filetype = "ruby"
		elseif string.match(firstline, "^#!.*bash") then
			vim.bo.filetype = "sh"
		elseif string.match(firstline, "^#!.*sh") then
			vim.bo.filetype = "sh"
		elseif string.match(firstline, "^#!.*zsh") then
			vim.bo.filetype = "zsh"
		end
	end
end

-- Autocommand to call the function after initial filetype detection
vim.api.nvim_create_augroup("ShebangFiletype", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = "*",
	callback = set_filetype_from_shebang,
})
