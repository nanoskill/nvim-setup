-- nvim-treesitter `main` branch: setup() only accepts `install_dir`.
-- Parsers are installed explicitly, and highlighting/indent is started per buffer.
local ensure_installed = {
  "c", "css", "go", "gomod", "gosum", "gowork", "html", "json",
  "lua", "query", "vim", "vimdoc", "yaml",
}

return {
	{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = 'main',
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup()

      local installed = ts.get_installed("parsers")
      local missing = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, ensure_installed)
      if #missing > 0 then
        ts.install(missing, { summary = true })
      end

      local tsgroup = vim.api.nvim_create_augroup('treesitter', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = tsgroup,
        callback = function(ev)
          -- Match on parser name, not filetype (e.g. ft `gomod` -> parser `gomod`,
          -- ft `javascriptreact` -> parser `tsx`).
          local lang = vim.treesitter.language.get_lang(ev.match)
          if not lang or not vim.tbl_contains(ts.get_installed("parsers"), lang) then
            return
          end
          pcall(vim.treesitter.start, ev.buf, lang)
          -- Buffer-local, and set after the ftplugin so it wins.
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end
  },
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("cmp-config")
		end,
	},
}
