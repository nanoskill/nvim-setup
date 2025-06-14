return {
	{ "lewis6991/gitsigns.nvim" }, -- fot gutter and reset hunk
	{ "sindrets/diffview.nvim", dependencies="nvim-lua/plenary.nvim" },
	{
    "f-person/git-blame.nvim",
    opts = {
      display_virtual_text = 0,
      date_format = "%r",
      -- message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      message_template = "<author> (<date>)", -- template for the blame message, check the Message template section for more options
    }
  }
}
