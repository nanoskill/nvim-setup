local git_blame = require('gitblame')

require("lualine").setup({
	-- sections={
	-- 	lualine_x={
	-- 		{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
	-- 	}
	-- }
})
