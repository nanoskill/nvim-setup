
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- appearance
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "Mofiqul/vscode.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = true,
	},

	-- tabs
	{
		"romgrk/barbar.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
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

	-- auto complete
	{ "nvim-treesitter/nvim-treesitter" },

	-- git
	{ "lewis6991/gitsigns.nvim" },
	{ "sindrets/diffview.nvim", dependencies="nvim-lua/plenary.nvim" },
	{ "f-person/git-blame.nvim" },

	-- autopair
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter" },

	-- Autocomplete
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
	{ "williamboman/mason.nvim", build=":MasonUpdate" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- LSP server config
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter"
		},
	},
	{ "jose-elias-alvarez/typescript.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim"},
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

	-- tab size management
	{ "FotiadisM/tabset.nvim" },
})
