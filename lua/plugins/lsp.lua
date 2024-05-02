return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"clangd"
		}
	},
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    event = { "InsertEnter", "CmdlineEnter" },
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin
    config = function()
        configs = require("configs.lsp")
    end,
    }

