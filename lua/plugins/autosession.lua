require("auto-session").setup({
	log_level = "error",
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local view = require('nvim-tree.view')
    local is_visible = view.is_visible()

    local api = require('nvim-tree.api')
    if not is_visible then
      api.tree.open()
    end
  end,
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
