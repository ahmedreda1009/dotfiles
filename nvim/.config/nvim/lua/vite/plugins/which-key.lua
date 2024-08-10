return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require("which-key")
    wk.setup({
      -- icons = {
      -- 	group = " ",
      -- },
    })
    wk.register({
      f = {
        name = "Find & Format", -- optional group name
      },
      c = {
        name = "Code",
      },
      w = {
        name = "Window",
      },
      g = {
        name = "Git & Go",
      },
      l = {
        name = "Lazy",
      },
      q = {
        name = "Quit",
      },
      -- n = {
      -- 	name = "Neorg",
      -- },
    }, { prefix = "<leader>" })
  end,
}
