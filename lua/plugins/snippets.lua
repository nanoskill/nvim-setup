-- All of these are only ever used through nvim-cmp, so they load with it rather
-- than at startup. Without the event they are "start" plugins, and cmp-tsnip in
-- particular would require("cmp") during startup and undo nvim-cmp's lazy load.
return {
	{ "L3MON4D3/LuaSnip", event = "InsertEnter" },
	{ "saadparwaiz1/cmp_luasnip", event = "InsertEnter" }, -- for autocompletion
	{ "rafamadriz/friendly-snippets", event = "InsertEnter" }, -- useful snippets
	{ "onsails/lspkind.nvim", event = "InsertEnter" },
}
