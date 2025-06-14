return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
  clickable = true, -- Enables/disable clickable tabs
  tabpages = true, -- Enable/disable current/total tabpages indicator (top right corner)
  icons =  {
		buffer_index = true,
		filetype = {
			enabled = true,
		},
	}, -- Enable/disable icons
	-- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    ['neo-tree'] = true,
  }},
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
