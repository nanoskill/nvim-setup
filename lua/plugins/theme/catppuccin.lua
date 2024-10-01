local present, catppuccin = pcall(require, "catppuccin")
if not present then return end

catppuccin.setup {
	flavour = "mocha"
}

vim.cmd.colorscheme "catppuccin"
