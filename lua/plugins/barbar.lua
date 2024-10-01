local setup, bufferline = pcall(require, "bufferline")
if not setup then return end


bufferline.setup({
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
    -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
    NvimTree = true,
    -- Or, specify the text used for the offset:
    -- undotree = {text = 'undotree'},
    -- Or, specify the event which the sidebar executes when leaving:
    -- ['neo-tree'] = {event = 'BufWipeout'},
    -- Or, specify both
    -- Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },

})

