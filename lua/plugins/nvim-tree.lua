require("nvim-tree").setup({
	respect_buf_cwd = true,
	sync_root_with_cwd = true,
	filters = {
		custom = { "^.git$" }
	},
})
