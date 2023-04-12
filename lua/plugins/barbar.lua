local setup, bufferline = pcall(require, "bufferline")
if not setup then return end


bufferline.setup({
  clickable = true, -- Enables/disable clickable tabs
  tabpages = true, -- Enable/disable current/total tabpages indicator (top right corner)
  icons =  {
		--button = false,
		--modified = {
		--	button = true,
		--},
		buffer_index = true,
		filetype = {
			enabled = true,
		},
	}, -- Enable/disable icons
})

