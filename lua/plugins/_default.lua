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

-- vim.opt.shell = 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe'
--[[ vim.o.shell = 'powershell.exe'
vim.o.shellxquote = ''
vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
vim.o.shellquote = ''
vim.o.shellpipe = '| Out-File -Encoding UTF8 %s'
vim.o.shellredir = '| Out-File -Encoding UTF8 %s'
 ]]

 vim.opt.shell = "wsl.exe"
vim.o.shellxquote = ''
vim.o.shellcmdflag = ''
vim.o.shellquote = ''

-- vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text, applied on lualine
