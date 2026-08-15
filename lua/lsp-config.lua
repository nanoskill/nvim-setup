require("lspsaga").setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		keys = { edit = "<CR>" },
	},
	lightbulb = { virtual_text = false },
	finder = {
		left_width = 0.2,
	},
})

local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})

mason_null_ls.setup({
	-- `automatic_setup` was a v1 option and is ignored here; sources are declared
	-- explicitly above, this only makes sure their binaries exist.
	ensure_installed = { "stylua" },
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- Same wrapper shape as lua/keymap.lua, but buffer-local to this client.
	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
	end

	map("n", "gf", "<cmd>Lspsaga finder<CR>", "Finder (def/ref/imp)")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gd", "<cmd>Lspsaga finder def<CR>", "Go to definition")
	map("n", "gi", "<cmd>Lspsaga finder imp<CR>", "List implementations")
	map("n", "gr", "<cmd>Lspsaga finder ref<CR>", "List references")
	map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code action")
	map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename symbol")
	map("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line diagnostics")
	map("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor diagnostics")
	map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous diagnostic")
	map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next diagnostic")
	map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover documentation")
	map("n", "<leader>fs", function()
		require("telescope.builtin").lsp_document_symbols()
	end, "Find Symbols")
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Applied as the base for every server, so per-server configs below only need
-- to declare what is genuinely server-specific.
vim.lsp.config("*", {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
vim.lsp.config("lua_ls", {
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- Format on save.
local format_grp = vim.api.nvim_create_augroup("FormatOnSave", {})

-- Go: goimports (via the LSP code action) then gofmt.
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	group = format_grp,
	callback = function(ev)
		local client = vim.lsp.get_clients({ bufnr = ev.buf, name = "gopls" })[1]

		-- organize imports first (gofmt alone does not do this)
		if client then
			local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
			params.context = { only = { "source.organizeImports" }, diagnostics = {} }

			local result = client:request_sync("textDocument/codeAction", params, 1000, ev.buf)
			for _, action in pairs((result or {}).result or {}) do
				if action.edit then
					vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
				end
			end
		end

		vim.lsp.buf.format({ bufnr = ev.buf, async = false })
	end,
})

-- Lua: stylua, via null-ls.
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.lua",
	group = format_grp,
	callback = function(ev)
		vim.lsp.buf.format({ bufnr = ev.buf, async = false, name = "null-ls" })
	end,
})
