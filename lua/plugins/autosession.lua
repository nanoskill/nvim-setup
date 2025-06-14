return {
  "rmagatti/auto-session",
  opts = {
    log_level = "error",
  },
  config = function (_, opts)
    require("auto-session").setup(opts)
    vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end
}
