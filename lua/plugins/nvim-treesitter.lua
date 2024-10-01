require 'nvim-treesitter.install'.prefer_git = false
require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "go", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html", "css" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  },

	autotag = {
		enable = true,
	}
}
