return {
  "nvim-telescope/telescope.nvim",
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
