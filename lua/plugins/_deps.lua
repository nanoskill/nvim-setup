return {
	-- file explorer & navigation
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- LSP management
	{ 'mason-org/mason.nvim', opts = {} },
	{
		'mason-org/mason-lspconfig.nvim',
		dependencies = { 'neovim/nvim-lspconfig' },
		opts = {}
	},

	-- LSP server config
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },

	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons",     -- optional
		}
	},

	{
		"nvimtools/none-ls.nvim",
		dependencies = {
		  "nvimtools/none-ls-extras.nvim",
		},
	},
	{ "jay-babu/mason-null-ls.nvim",
    	event = { "BufReadPre", "BufNewFile" },
	},
	{ "hrsh7th/cmp-nvim-lsp-document-symbol" },

	-- comment
	{ "numToStr/Comment.nvim" },
}
