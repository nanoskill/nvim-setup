require("lspsaga").setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>"},
	definition = {
    keys = { edit = "<CR>" },
  },
  lightbulb = { virtual_text = false },
  finder = {
    left_width = 0.2,
  },
})

local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls");
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		-- require("none-ls.diagnostics.eslint"),
		-- null_ls.builtins.completion.spell,
		-- require("typescript.extensions.null-ls.code-actions"),
	}
})

mason_null_ls.setup({
	automatic_setup = true,
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")
-- local typescript = require("typescript")

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	local builtin = require("telescope.builtin")
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
  -- keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
  -- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gd", "<cmd>Lspsaga finder def<CR>", opts) -- see definition and make edits in window
  -- keymap.set("n", "gd",builtin.lsp_definitions, opts) -- go to definition
  -- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  -- keymap.set("n", "gi", builtin.lsp_implementations, opts) -- list of implementation
  keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts) -- list of implementation
  keymap.set("n", "gr", "<cmd>Lspsaga finder ref<CR>", opts) -- list of implementation
  -- keymap.set("n", "gr", builtin.lsp_references, opts) -- list of references
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  -- keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  -- typescript specific keymaps (e.g. rename file and update imports)
  -- if client.name == "ts_ls" then
  --   keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
  --   keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
  --   keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  -- end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
--[[
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
]]--

-- configure typescript server with plugin
-- typescript.setup({
--   server = {
--     capabilities = capabilities,
--     on_attach = on_attach,
--   },
-- })

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
})

local ts_ls_attach = (vim.lsp.config["ts_ls"] or {}).on_attach or {}
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    ts_ls_attach(client, bufnr)
    on_attach(client, bufnr)
  end,
})

local pyright_attach = (vim.lsp.config["pyright"] or {}).on_attach or {}
vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    pyright_attach(client, bufnr)
    on_attach(client, bufnr)
  end,
})

-- configure lua server (with special settings)
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
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

-- Run gofmt on save

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format()
  end,
  group = format_sync_grp,
})
