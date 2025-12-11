-- https://github.com/okuuva/auto-save.nvim
-- This is a fork of original plugin `pocco81/auto-save.nvim` but the original
-- one was updated 2 years ago, and I was experiencing issues with autoformat
-- undo/redo
--
-- Filename: ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/auto-save.lua
-- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/auto-save.lua

return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      enabled = true,

      callbacks = {
        after_saving = function()
          vim.notify("Saved! " .. vim.fn.strftime("%H:%M:%S"), vim.log.levels.INFO, {
            title = "AutoSave",
          })
        end,
      },

      trigger_events = {
        immediate_save = {
          "BufLeave",
          "FocusLost",
          "BufWinLeave",
          "BufUnload",
          "BufDelete",
          "BufHidden",
          "BufWritePost",
          "BufWritePre",
          "BufWrite",
        },
        defer_save = {
          "InsertLeave",
          "TextChanged",
        },
        cancel_deferred_save = { "InsertEnter" }, -- ✔️ correct name
      },

      condition = nil,
      write_all_buffers = false,
      noautocmd = false,
      lockmarks = false,

      -- ⚠️ NOTE: Setting this to 0 means "save instantly without debounce"
      -- If you want the old behavior, set it back to 1000.
      debounce_delay = 0,

      debug = false,
    },
  },
}
