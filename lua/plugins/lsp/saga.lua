local saga = require("lspsaga")

saga.setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>"},
	definition = { 
    keys = { edit = "<CR>" },
  },
  lightbulb = { virtual_text = false },
})
