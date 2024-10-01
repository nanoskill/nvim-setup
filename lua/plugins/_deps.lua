
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
	{ "lewis6991/gitsigns.nvim" },
	{ "sindrets/diffview.nvim", dependencies="nvim-lua/plenary.nvim" },
	{ "f-person/git-blame.nvim" },

	-- autopair
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter" },

	-- Autocomplete
	{ "nvim-treesitter/nvim-treesitter" },
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
    "nvimdev/lspsaga.nvim",
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons",     -- optional
    }
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
