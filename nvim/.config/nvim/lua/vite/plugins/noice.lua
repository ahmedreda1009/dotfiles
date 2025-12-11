return {
  {
    "folke/noice.nvim",
    event = "VeryLazy", -- lazy-load after startup
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- optional fallback for notifications
    },
    opts = {
      lsp = {
        progress = { enabled = true },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
          ["vim.lsp.handlers['$/progress']"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
      messages = {
        enabled = true,
        view = "mini", -- safe for short messages
        history = 100, -- keeps last 100 messages
      },
      popupmenu = {
        enabled = true, -- nicer completion menu
        backend = "nui",
      },
      routes = {
        -- example: filter out some messages you don’t want
        { filter = { event = "msg_show", find = "%d+L, %d+B" }, opts = { skip = true } },
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)

      -- Safely reset history if available
      pcall(function()
        if require("noice").history then
          require("noice").history.reset()
        end
      end)

      -- Keymap to dismiss all messages safely
      vim.keymap.set("n", "-", function()
        require("noice").cmd("dismiss")
      end, { desc = "Dismiss all Noice messages" })
    end,
  },
}
