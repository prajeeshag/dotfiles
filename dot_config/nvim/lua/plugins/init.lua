return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua-language-server",
        "stylua",
        -- Bash
        "shellcheck",
        "shfmt",
        -- Fortran
        "fortls",
        "fprettify",
      },
    },
  },
  --
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  --
  --{
  --	"nvim-treesitter/nvim-treesitter",
  --	opts = {
  --		ensure_installed = {
  --			"vim",
  --			"lua",
  --			"vimdoc",
  --			"bash",
  --		},
  --	},
  --},
}
