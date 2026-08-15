return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
      "f-person/git-blame.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      local git_blame = require('gitblame')
      require("lualine").setup({
        -- The filename is already in the barbar tabline, so it is dropped from
        -- both the focused statusline and the inactive-window one (which
        -- defaults to `lualine_c = { 'filename' }`).
        inactive_sections = {
          lualine_c = {},
        },
        sections={
          lualine_c = {},
          lualine_x = {
            {
              git_blame.get_current_blame_text,
              color = { fg = "#aaaaaa", gui = "italic" },
              cond = git_blame.is_blame_text_available,
              separator = "│",
              align = "right",
            },
            'encoding',
            'fileformat',
            'filetype',
            'lsp_status',
          },
        },
        extensions = { 'lazy', 'mason', 'toggleterm', 'neo-tree', --[[ 'nvim-tree' ]] },
      })
    end
	},
}
