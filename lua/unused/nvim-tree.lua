local function on_attach(bufnr)
	local api = require('nvim-tree.api')
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	api.config.mappings.default_on_attach(bufnr)

	-- auto change cwd to tree root when update tree root
	vim.keymap.set('n', '<C-]>', function ()
		api.tree.change_root_to_node();
		vim.cmd([[:cd %:h]]);
	end, opts('Up'));
end


return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    on_attach = on_attach,
    filters = {
      custom = { "^.git$" }
    },
  }
}
