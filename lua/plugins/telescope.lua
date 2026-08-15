return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    pickers = {
      lsp_document_symbols = {
        symbol_width = 80,
      }
    }
  }
}
