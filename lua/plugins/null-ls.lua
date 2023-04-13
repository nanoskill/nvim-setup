local null_ls = require("null_ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		require("typescript.extensions.null-ls.code-actions"),
	}
})
