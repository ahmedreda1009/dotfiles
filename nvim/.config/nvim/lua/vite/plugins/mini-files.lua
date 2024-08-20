return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local MiniFiles = require('mini.files')
    MiniFiles.setup()

    -- Function to toggle mini.files
    local minifiles_toggle = function()
      if not MiniFiles.close() then
        MiniFiles.open()
      end
    end

    -- Key mapping to toggle mini.files
    vim.keymap.set('n', '.', minifiles_toggle, { noremap = true, silent = true, desc = 'Toggle mini files' })

    -- highlight groups
    vim.cmd([[
      highlight MiniFilesTitleFocused guifg=#fab387
    ]])
  end,
}
