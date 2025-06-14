return {
	{
    "windwp/nvim-autopairs",
    opts = {
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
      },
    },
    config = function (_, opts)
      require("nvim-autopairs").setup(opts)
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end
  },
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter" },

}
