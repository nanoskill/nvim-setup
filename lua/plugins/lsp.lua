return {
	-- LSP management
	{ 'mason-org/mason.nvim', opts = {} },

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

  {
		'mason-org/mason-lspconfig.nvim',
    opts = {
      -- ensure_installed = { "lua_ls", "ts_ls", "cssls", "tailwindcss", "html", "gopls" },
    },
		dependencies = { 
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig'
    },
	},
}
