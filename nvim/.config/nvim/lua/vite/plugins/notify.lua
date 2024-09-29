return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 5000,
    -- background_colour = "#000000",
    render = "compact",
  },

  vim.keymap.set("n", "<leader>mh", "<cmd>Telescope notify<CR><esc>", { desc = "Show notifications history" })
}
