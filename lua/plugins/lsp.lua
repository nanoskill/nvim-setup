return {
	-- LSP management. Kept reachable by command so :Mason works before any buffer
	-- is opened; otherwise it loads as a dependency below.
	{
		'mason-org/mason.nvim',
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
		opts = {},
	},

	-- LSP server config. Everything lsp-config.lua requires is declared here as a
	-- dependency, so the whole LSP stack loads on the first real buffer instead of
	-- at startup. Declaring any of these as a top-level spec would make it a
	-- "start" plugin again.
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{
				"nvimdev/lspsaga.nvim",
				dependencies = {
					"nvim-treesitter/nvim-treesitter", -- optional
					"nvim-tree/nvim-web-devicons",     -- optional
				},
			},
			{
				"nvimtools/none-ls.nvim",
				dependencies = { "nvimtools/none-ls-extras.nvim" },
			},
			"jay-babu/mason-null-ls.nvim",
			{
				'mason-org/mason-lspconfig.nvim',
				opts = {},
				dependencies = { 'mason-org/mason.nvim' },
			},
		},
		config = function()
			require("lsp-config")
		end,
	},
}
