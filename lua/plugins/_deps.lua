return {
	-- appearance
	-- { "catppuccin/nvim", name = "catppuccin" },
	-- { "Mofiqul/vscode.nvim" },
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	opts = true,
	-- },

	-- tabs
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},

	-- file explorer & navigation
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- git
	{ "lewis6991/gitsigns.nvim" }, -- fot gutter and reset hunk
	{ "sindrets/diffview.nvim", dependencies="nvim-lua/plenary.nvim" },
	{ "f-person/git-blame.nvim" }, -- for lualine

	-- autopair
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter" },

	-- Autocomplete
	{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
  },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },

	-- snippets
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
	{ "rafamadriz/friendly-snippets" }, -- useful snippets
	{ "onsails/lspkind.nvim"},

	-- ts snippets
	{ "yuki-yano/tsnip.nvim", dependencies="vim-denops/denops.vim" },
	{ "KentoOgata/cmp-tsnip" },

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

	-- terminal 
	{ "akinsho/toggleterm.nvim" },

	-- comment
	{ "numToStr/Comment.nvim" },

	-- auto session
	{ "rmagatti/auto-session" },
}
