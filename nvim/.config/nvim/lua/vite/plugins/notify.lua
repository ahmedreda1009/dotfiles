return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 2000,
    stages = 'static',
    -- background_colour = "#000000",
    render = "compact",
  },

  vim.keymap.set("n", "<leader>ms", "<cmd>Telescope notify<CR><esc>", { desc = "Show notifications history" })
}
