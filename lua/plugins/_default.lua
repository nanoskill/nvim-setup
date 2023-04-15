vim.g.mapleader = " "
vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1

vim.opt.encoding="utf-8"

vim.opt.compatible=false
vim.opt.hlsearch=true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.laststatus = 2
vim.opt.vb = true
vim.opt.ruler = true
vim.opt.spelllang="en_us"
vim.opt.autoindent=true
-- vim.opt.tabstop=2
-- vim.opt.softtabstop=2
-- vim.opt.shiftwidth=2
-- vim.opt.colorcolumn="120"
--vim.opt.textwidth=120
vim.opt.mouse="a"
--vim.opt.clipboard="unnamed"
vim.opt.scrollbind=false
vim.opt.wildmenu=true
-- vim.opt.autochdir=true
vim.opt.foldmethod="expr"
vim.opt.foldexpr="nvim_treesitter#foldexpr()"

vim.opt.termguicolors=true

vim.api.nvim_create_autocmd({'BufReadPost','FileReadPost','BufWinEnter'}, {
	pattern="*",
	command="normal zR",
})

-- vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text, applied on lualine
