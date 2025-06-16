return {
	{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = 'main',
    opts = {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "c", "go", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html", "css", "python" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        enable = true,
      },

      autotag = {
        enable = true,
      }
    },
    config = function(_, opts) 
      require("nvim-treesitter").setup(opts)
      
      local tsgroup = vim.api.nvim_create_augroup('treesitter', { clear = true})
      vim.api.nvim_create_autocmd('FileType', {
        group= tsgroup,
        pattern = opts.ensure_installed,
        callback = function() vim.treesitter.start() end,
      })
    end
  },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
}
