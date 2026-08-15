vim.g.mapleader = " "
vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1

vim.opt.hlsearch=true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.vb = true
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
-- vim.opt.autochdir=true
vim.o.foldlevelstart=99
vim.o.foldmethod='expr'
-- `vim.o` (:set) so new windows inherit it; `vim.wo` (:setlocal) only applied to
-- the first window. indentexpr is set per buffer by the treesitter FileType autocmd.
vim.o.foldexpr='v:lua.vim.treesitter.foldexpr()'
vim.opt.termguicolors=true
vim.opt.signcolumn="yes:1"


-- vim.api.nvim_create_autocmd({'BufReadPost','FileReadPost','BufWinEnter'}, {
-- 	pattern="*",
-- 	command="normal zR",
-- })

-- vim.api.nvim_clear_autocmd({'BufReadPost','FileReadPost','BufWinEnter'}, {
-- 	pattern="*",
-- 	command="normal zR",
-- })

-- vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text, applied on lualine
