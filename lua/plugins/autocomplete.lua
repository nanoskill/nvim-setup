return {
	{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = 'main',
    config = function()
      local tsgroup = vim.api.nvim_create_augroup('treesitter', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = tsgroup,
        pattern = { "c", "go", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html", "css", "python" },
        callback = function() vim.treesitter.start() end,
      })
    end
  },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
}
